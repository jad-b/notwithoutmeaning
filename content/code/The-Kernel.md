+++
title: "The (Linux) Kernel"
date: 2017-08-17T11:34:26-04:00
categories = ["code"]
tags = ["programming"]
draft = true
+++
I've never understood the OS kernel to my satisfaction. _Exactly_ where do its
responsibilities begin and end? Where does it fall within the boot sequence?
How does it differ from the bootloader? From the OS? What makes up "the kernel"?

I've started collecting resources and learnings here, slowly pulling together
an understanding.

## Notes on _le kernel_
The kernel starts the OS's init system, it's "pid 1". It also handles socket and
filesystem buffering, cgroups, and some level of event notification.
[Rethinking PID 1]

[Rethinking PID 1]: http://0pointer.de/blog/projects/systemd.html

Doing is a well-known way of learning. Why not [write an OS kernel in
Rust](https://os.phil-opp.com/multiboot-kernel/)?
