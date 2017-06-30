+++
date = "2017-06-30T10:57:47-04:00"
title = "Docker"
draft = "true"
tags = ["programming"]
categories = ["code"]
+++
All things Docker.

## Best Practices
### Size
* Where possible, run using [sratch] as your base image. [alpine] otherwise.
  * Consider using [squash], as in `docker build --squash`. An experimental
    feature.

[scratch]: https://hub.docker.com/_/scratch/
[alpine]: https://hub.docker.com/_/alpine/
[squash]: https://docs.docker.com/engine/reference/commandline/build/#squash-an-images-layers-squash-experimental-only

### Security
* Run in `--read-only` mode, allowing writeable directories through `--tmpfs
  <dir>,<options>` and volume mounts.
  * src=http://www.projectatomic.io/blog/2015/12/making-docker-images-write-only-in-production/

## Troubleshooting
Docker - I love you. But sometimes you hurt me. And when you do, you never want
to talk it out, and you force me to question and probe until the truth comes
out.

Burn me once, shame on me. Burn me twice, write about it on the internet.

Here are my (solved) problems with Docker.

> COPY file.py /usr/src/pkg/file.py
> ImportError: No module named 'pkg.file'

That's an error from a Python program, obviously not finding what it's looking
for. After inspecting the running container's file system, sure enough, the
file wasn't there.While symptom isn't Docker, the cause _was_.

Step 1, you double-check your .dockerignore files for a over-eager rule. In this
case, there were no .dockerignores. In fact, I never found the official solution
at all! The image was being built using docker-compose. Building the image using
`docker build ...` successfully COPY'd the file , and subsequent docker-compose
builds began to work again.

> ERROR: Error processing tar file(archive/tar: invalid tar header):

You might not have permission to load files into the Docker build context.
Circularly, this may have been caused by Docker in the first place. Yay!

> error creating aufs mount to /var/lib/docker/aufs/mnt   /6c1b42ce1a98b1c0f2d2a7f17c196221445f1054566065d4c607e4f1b99930eb-init:   invalid argument

Fix: [Stack Overflow](http://stackoverflow.com/a/31467799)

Delete all containers and images.

```bash
# Cleaning up through docker avoids these errors
#   ERROR: Service 'master' failed to build:
#     open /var/lib/docker/aufs/layers/<container_id>: no such file or directory
#   ERROR: Service 'master' failed to build: failed to register layer:
#     open /var/lib/docker/aufs/layers/<container_id>: no such file or directory
docker rm -f $(docker ps -a -q)
docker rmi -f $(docker images -a -q)
sudo service docker stop
sudo rm -rf /var/lib/docker/aufs
# Removing the linkgraph.db fixed this error:
#   Conflict. The name "/jenkins_data_1" is already in use by container <container_id>.
#   You have to remove (or rename) that container to be able to reuse that name.
sudo rm -f /var/lib/docker/linkgraph.db
sudo service docker start
```
