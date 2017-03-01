+++
date = "2017-02-28T11:06:26-05:00"
title = "Lessons Learned: Docker"
tags = ["programming","software engineering"]
categories = ["software engineering"]

+++
Docker - I love you. But sometimes you hurt me. And when you do, you never want
to talk it out, and you force me to question and probe until the truth comes
out.

Burn me once, shame on me. Burn me twice, write about it on the internet.

Here are my (solved) problems with Docker.

> ERROR: Error processing tar file(archive/tar: invalid tar header):

You might not have permission to load files into the Docker build context.
Circularly, this may have been caused by Docker in the first place. Yay!

> error creating aufs mount to /var/lib/docker/aufs/mnt   /6c1b42ce1a98b1c0f2d2a7f17c196221445f1054566065d4c607e4f1b99930eb-init:   invalid argument

Fix: [Stack Overflow](http://stackoverflow.com/a/31467799)

Delete all containers and images

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
