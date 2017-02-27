+++
date = "2015-11-06"
title = "Jenkins Docker'd"
category = ["programming"]
tags = ["CI", "CD", "Jenkins", "Docker"]
draft = true
+++

I've been spending some time setting up a Jenkins server to facilitate my
team's adoption of Continuous Delivery practices. I wanted to use Docker as
much as possible, for various reasons.

Given _n_ Docker-ready nodes, how can we:
* Run a Jenkins master in a container, or multiple masters even
* Let it utilize as many of the _n_ nodes as required for slave containers
  running build jobs?

## The Setup
Fairly simple; I had a docker-compose.yml file that looks like this:
```yaml
# Jenkins master
master:
  image: jenkins:1.625.1
  volumes_from:
    - data
  ports:
    # Web UI
    - "8888:8080"
    # Slave port
    - "50000"

# Data-only container for Jenkins
data:
  image: jenkins:1.625.1
  command: echo "Data-only Jenkins container started"
```

After spinning up a box with `docker-machine`, I simply:

```bash
docker-machine env docker24-01-useast1b
docker-compose up -d
```

And Jenkins was up and running.


### Sibling Container's
One option is to use the Jenkins master's host's Docker daemon; said another
way, you can setup the Jenkins master container to use the same docker daemon that created it.

You'll need to mount the Docker binary and socket:

```yaml
data:
  image: jenkins:1.625.1
  command: echo "Data-only Jenkins container started"
  volumes:
    # Give access to our docker binary inside our Jenkins master
    # This starts 'sibling' containers, not 'child'
    - /var/run/docker.sock:/var/run/docker.sock
    - /usr/bin/docker:/usr/bin/docker
```

And you'll need to install `lxc` in the Jenkins container, as well as add the
`jenkins` user to the `docker` group. I recommend extending the official
Jenkins Dockerfile.

```Dockerfile
# Install Docker library dependencies inside this container
# This lets us mount the host's Docker binary & socket, allowing Jenkins to
# splin up sibling containers on the same host.
USER root
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    lxc
RUN groupadd -g 999 docker && gpasswd -a jenkins docker
USER jenkins
```

After installing the Docker plugin, you can specify the binary path on the
Jenkins master. Now you can setup simple build jobs that involve commands like
`docker run mycontainer do these things` will create containers _next_ to the
Jenkins master on the same host.

### Custom Docker Build Environment
The [CloudBees Docker Custom Build Environment
Plugin](https://wiki.jenkins-ci.org/display/JENKINS/CloudBees+Docker+Custom+Build+Environment+Plugin)
runs your build job in custom containers, using `docker exec`.  However, the
open issues of [not being able to run on remote Docker
hosts](https://issues.jenkins-ci.org/browse/JENKINS-29194) and [not working
when Jenkins is
containerized](https://issues.jenkins-ci.org/browse/JENKINS-29239) cause some
problems. As such, if you'd like to use this plugin, you'll need to be running
Jenkins outside of a container on a box with Docker installed.

I believe you _could_ get around the latter issue by mounting
`/var/jenkins_home` and `/tmp` directories into the container, thereby storing it on the host
for sibling container's to pick up. However, watch out for permissions issues;
the official Jenkins Dockerfile sets a uid of 1000 to their `jenkins` user.
Conveniently, that's the same as the `ubuntu` user on the EC2 box created by
docker-machine, so `chown`'ing made life simpler.


### Docker Cloud
You can register remote Docker hosts with the Jenkins master, and tell it to
handle creating jobs on them as slaves.

Supposedly. I've hit two snags so far:

1. The "Add Credentials" button won't take my credentials
  * See [this open
    issue](https://issues.jenkins-ci.org/browse/JENKINS-31327?jql=project%20%3D%20JENKINS%20AND%20status%20in%20%28Open%2C%20%22In%20Progress%22%2C%20Reopened%29%20AND%20component%20%3D%20%27docker-plugin%27)
    from 2015 Oct 31
1. Only "http" is supported at this time.

It's unclear if issue #1 went away, that if #2 would just get ignored. Maybe it
wouldn't care that we're sending TLS credentials over an http connection; I
don't know. What I do know is that until you can actually specify creds, it's
not gonna get you very far. This [Jenkins article](right here) says this
capability is possible now, and can even be pointed at Docker Swarm.
But, until the creds work...

[right here]: https://www.cloudbees.com/blog/disaster-proofing-slaves-docker-swarm-and-cloudbees-jenkins-platform
