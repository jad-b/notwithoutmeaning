+++
date = "2016-04-05T07:35:57-04:00"
title = "Running OpenVPN in Docker"
draft = true
categories = ["programming"]
tags = ["openvpn", "docker", "networking"]
+++

Use OpenVPN running in a Docker container to connect to the home network behind
your router.

<!--more-->

The basic layout looks like this:

```
|Client        |Router        |Docker Host      |OpenVPN Server
|==============|==============|=================|==============
|tun0:10.8.0.14|192.168.0.1/24|192.168.0.80:1194|10.8.0.1/24
```

* `10.8.0.0/24` is the private network provided by the OpenVPN server.
  When a client connects to the VPN, it gets a `tun0` interface with an IP
  addrses on this subnet.
* `192.168.0.0\24` is a stand-in for your home network provided by your router.
* Your `Docker Host` is the box behind your home network that's running the
  OpenVPN container in Docker. Thus, it needs to have the OpenVPN ports (such
  as 1194) mapped to the host: `-p 1194:1194/udp`.

Two problems must be solved:

1. The Router must forward port 1194 to the Docker host running OpenVPN. This
   is solved by basic port forwarding, and won't be covered here.
2. The OpenVPN server needs to route incoming traffic for 192.168.0.1/24 to
   _other boxes on your home network_.

This is tricky, because the OpenVPN server is running in Docker, and thus
isn't aware of the home network at all.

We'll need to:

1. Tell the Router to send requests for 10.8.0.0/24 to the Docker Host
1. Push routes to the clients that tell them how to talk to other hosts on the
   router's network (192.168.0.0/24)

## Resources
[Routed
LANs](https://community.openvpn.net/openvpn/wiki/RoutedLans#ROUTESTOADDOUTSIDEOFOPENVPN)

![Have your Router send VPN traffic to a container](https://secure-computing.net/wiki/images/graphviz/e49135615ed3644f7ac4586d82348e8f.png)
