+++
date = "2016-04-19T14:52:38-04:00"
title = "Testing Distributed Systems"
tags = ["programming", "distributed systems", "testing"]
categories = ["programming"]
+++

__TL;DR: Takeaways__

* Always, always, always handle errors appropriately. No `pass`, no `/* TODO
  */`. *Something* in the chain needs to verify it's handled.
* Using 3 nodes lets you reproduce 98% of error cases in distributed systems.
* 77% of catastrophic failures can be reproduced through unit tests
* Log aggressively, and on both sides of events (message passing).
* The big 5 error-ing events:
    1. Startup
    1. Writes from client
    1. Node down/unreachable
    1. Configuration change
    1. Node join
<!--more-->

As a work project involving multiple moving pieces begins the move from
proof-of-concept to preparing for production traffic, the various
pieces are beginning to knit into a whole. In particular, a client-driven event
requires that a list of registered services receive an update. Simple enough,
but failure in this system would result in bad API traffic routing, or worse,
all APIs becoming externally unavailable. Undesirable!

My previous experiences involved nothing more distributed than your basic
web-server=>DB setup, so I took this as an opportunity to learn from other's
mistakes. Searching around turns up the following advice:

### Simple Testing Can Prevent Most Critical Failures
A whitepaper[^whitepaper] out of the University of Toronto with some incredible
statistics on avoiding the worst-of-the-bad: catastrophic failures[^catfail]. They
attribute 92% of CFs to bad error handling, with a further breakdown of

* 35% due to
    * Catching but not doing anything about the error
    * Aborting on an overly-general error (java's `Throwable`, Python's
      `except:`)
    * A TODO/FIXME in place, but no handling
* And 23% on aborting on a non-fatal error (failed to delete a temporary file)

__77%__ of these failures they could reproduce using only unit tests. Admittedly,
this is their example unit test:

~~~java
public void testLogRollAfterSplitStart {
    // Create HBase cluster with 1 master and 2 Region Servers
    startMiniCluster();
~~~

...which may stretch your imagining of unit tests. I believe what they were
getting at is that the problems are testable within the scope of a single
function's setup/run/cleanup scope. Also, when your definition of unit test is
"code that I wrote", and the code that you wrote was HBase, that's quite the
scope.

Oh, and how about this: __98% of problems could be recreated using no more than
3 nodes__. Your 120 node Cassandra cluster's dying? Odds are, you only need
three players to recreate it locally.

An interesting point of difference the author's noted between distributed and
non-distributed systems was that distributed systems tend to have much better
logging. As such, 84% of the studied failures had their triggering events
logged. They logged so much that the author's recommended more advanced log
analysis techniques than a simple `grep ERROR`.

And to wrap this up: Starting up was the most dangerous time for a process, as
summarized under "Lessons Learned". More important is to take that list and mix
it up - 90% of the failures could be categorized as a permutation of only three
key events. Just two events interacting accounted for 50% of CFs.


#### Further reading
* ConfErr - tests configuration errors within a realistic range
* MODIST - Model checking for distributed system
* FATE and DESTINI - Framework for cloud recovery testing
* This looks interesting: KLEE - a code-coverage generator for C programs.
      Can't find any examples for Python though, which would be my use-case.


[^whitepaper]: https://www.usenix.org/system/files/conference/osdi14/osdi14-paper-yuan.pdf
[^catfail]: Failure of the system for a majority to all users.
