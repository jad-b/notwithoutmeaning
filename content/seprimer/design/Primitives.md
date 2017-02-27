+++
categories = ["software engineering primer"]
date = "2016-12-08T14:21:50-05:00"
tags = ["data structures"]
title = "Primitives"
+++
## Queues
The importance and pervasiveness of queues is underplayed. The concept of a
queue warrants only a brief mention in data structures courses before getting
into the implementation details of creating a stack, or priority queue, or
linked list. Yet you can't even leave build a kernel without implementing
queues for CPU stack management and NIC I/O buffers.

So how should we think about queues? I'll posit queues are present anytime the
ratio between Input and Output differs from 1:1. Too much input? Buffer it for
the next time a worker is available. Too much output? You've got a queue of
workers. From that assumption, queues exist, whether explicitly or implicity, in
any system with data I/O. Now, this definition includes counting words in a
file; your word-counting function can ultimately only look at one word at a
time, so we can think of the remaining yet-to-be processed file as "queued".
Similarly, we can think of the output of that function as queued for a
yet-to-be-known next-in-line procedure. With this viewpoint, the only time data
_isn't_ queued is the moment it's being processed.

How is this useful? Eliminates blind spots for where queues could be useful. It
also aids in thinking about data as a stream (potentially a stream-at-rest).

More thoughts to come. Mo' coffee, mo' thoughts.
