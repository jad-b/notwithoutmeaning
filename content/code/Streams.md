+++
date = "2015-10-09"
title = "Streams"
tags = ["databases", "streaming"]
category = ["software engineering"]
draft = true
+++

Time to wrestle with streaming.

Postgresql has a "write-ahead log" (WAL) that captures the logical effects of SQL
statements upon its data. Given a starting point, such as a DB snapshot,
replaying the WAL re-creates DB state anywhere up to the present (prediction of
the future still not being a provided feature, even with extensions). The folks
over at Confluent, the corporate face of Kafka, say "Hey! What if, hear me out,
the WAL _wasn't_ just an implementation detail for replication and backups, but
rather a first-class citizen? What could we do _then_?"

> What does the Write-Ahead Log look like? Is it human-readable?

Well, _I_ think what it'd look like is a series of DB tables strung across time.
Here's a visualization: Picture a 2-D DB table floating in front of you. It
looks like a spreadsheet. Now, when you peer _behind_ it, you see another table,
differing only by the last transaction recorded in the WAL. And sure enough, you
can see a translucent connection between the row that changed due to that
transaction linking the two tables.

If you remove all those ethereal WAL connectors, and only look at the table in
front of you, you have the current state of DBs. But, if you remove all but the
most _recent_ table, and _keep_ that long chain of WAL events, you have
what the Confluent folks are talking about.

Now, why do we need to promote streams from a DB internal structure to a
user-facing capability? Well, scaling is hard, caching is good but sucks to
implement, applications always have specific use cases, requiring actual
processing of your underlying data. Martin Kleppmann says you get all the
benefits of event-sourcing, plus pub-sub, plus solving the basic problems of
caching.

> How do you handle out-of-order event arrival in streams?
Read "[The Log]" for insight into solving this problem.



[Making Sense of Stream processing]: https://www.confluent.io/blog/making-sense-of-stream-processing/
[Turning the DB inside-out]: https://www.confluent.io/blog/turning-the-database-inside-out-with-apache-samza/
[The Log]: https://engineering.linkedin.com/distributed-systems/log-what-every-software-engineer-should-know-about-real-time-datas-unifying
[Putting Kafka to Use, Pt. 1]: https://www.confluent.io/blog/stream-data-platform-1/
[lmax]: https://martinfowler.com/articles/lmax.html
