+++
categories = ["software engineering primer"]
date = "2017-02-07T11:02:48-05:00"
tags = ["software engineering"]
title = "Principles"

+++

## The 4 Golden Signals
Latency, Traffic, Errors, Saturation.

## The 3 Types of Output
A _page_ (Human fix now!), a _ticket_ (Human fix soon), or logs (Human look at
some day).

## Primitives
At its core, you have a timestamped key-value pair. The timestamp is essential
because it is used to provide a _total order_ across the metrics collection. The
Key is essential because data without context is useless. And the value is
self-explanatory. You can _move_ the context (Key) out of the data being sent
into the channel itself, for example by dedicating a stream to _just_ one kind
of metric, or having a protocol that divides what values are what. But you still
need it.

If we use time not just to order, but as its own dimension, we arrive at a truly
useful monitoring primitive that statistics has been using since _ever_: The
**histogram**.


## Making it happen
### Collection
If you're going to send using UDP, which doesn't guarantee message receipt, you
have to track how often UDP packets get dropped. Otherwise you're choosing to
live in ignorance, and that's definitely not included in anyone's definition of
Mastery.

#### Technologies
* [Snap](https://github.com/intelsdi-x/snap)
* [Statsite](https://github.com/statsite/statsite)

### Storage
* [OpenTSDB](http://opentsdb.net/)
* [Graphite/Carbon/Whisper]()

### Analysis/Processing/Visualization
* [Grafana]()

### End-to-end
* [Ganglia](http://ganglia.info/)

## Algorithms
* HyperLogLog
    * https://web.archive.org/web/20150323055945/http://research.neustar.biz/2012/10/25/sketch-of-the-day-hyperloglog-cornerstone-of-a-big-data-infrastructure/
    * http://stackoverflow.com/questions/12327004/how-does-the-hyperloglog-algorithm-work
    * https://research.google.com/pubs/pub40671.html
