+++
categories = ["data science"]
date = "2016-05-20T10:21:22-04:00"
tags = ["conference", "notes", "programming", "data", "machine learning"]
title = "ODSC 2016 - Friday"
toc = "true"
+++
__Goto__: [Saturday]({{< ref "post/ODSC2016 - Saturday.md" >}}) &
[Sunday's]({{< ref "post/ODSC2016 - Sunday.md" >}}) notes.

# Friday - Morning
## Building a Recommendation System
Speaker: [Chris Fregly](https://www.linkedin.com/in/cfregly)

### Spark

__On Spark & Tableau (or Redshift):__

When you're connecting Tableau to Spark, it's all going through one JVM, the HiveThrift
server (which converts SQL into Java talk).  You want to make sure you're pushding down as
much computation as possible to Spark, saving the HiveThrift server cycles. This way you
collect the results of your computation for display in your visualization engine.

__On Graph Analysis__
If you're doing network analysis using Spark, look at using GraphFrames over GraphX.
GraphFrames is fully supported in Spark2. Both are only good for offline graph analytics;
transactional graph queries should be loaded into a dedicated Graph DB like Neo4j.

People don't seem to test these systems! I suppose if you're already monitoring
performance and model prediction accuracy, you _are_ testing them. And it'd be easy enough
to mock up I/O for subsets to confirm functionality.

`Spark - Packages`: a marketplace for Spark packages

#### Spark 2.0
Big focus on codegen: A `map` followed by a `filter` will get re-written into a single method, reducing function calls.
Relies on [Project Janino](http://unkrig.de/w/Janino).

Lot of talk about
[Tungsten](https://databricks.com/blog/2015/04/28/project-tungsten-bringing-spark-closer-to-bare-metal.html),
to include new low-level data structures, code generation, and more.

Spark 2.0 will support exporting models as PMML. PMML is the common data representation of ML models.


#### Probabilistic data structures
Paco Nathan: Good work on probabilistic structures. https://www.linkedin.com/in/ceteri

When you allow the possibility of error into your queries, a 14 bit structure can store
1e9 counts, w/ an error of .81%,

* __HyperLogLog__
    * Particular hash function used by HLL guarantees the data will be uniformly distributed.
      Something about taking subsets of the data.
    * If you have guaranteed uniform distribution, you can check for a distinct number of
      users by only checking the beginning of the structure. Similar to Numenta's SDR
      bitmasks.
* __CountMin Sketch__
    * Creates a (# of hash functions, # of bits) table. Every item gets an entry in each
      row (per hash function). Each table cell is a count of how many times a hash
      function has created that bit value. When you want the count for an item, you hash
      it, and take the _minimum_ of all rows. You're guaranteed to always be >= the _true_
      count of the item. The `>` is due to overlap with other items.
* Also: [__Bloom Filters__](https://en.wikipedia.org/wiki/Bloom_filter)
* Size in Memory of 1e6 item
    * HyperLogLog: 16,472 bytes
    * Naive Array: 4,800,016 bytes
    * CountMin Sketch: 310,944 bytes

Came across this [overview](https://en.wikipedia.org/wiki/Bloom_filter) when looking up
info on HyperLogLog.

### Lessons from Netflix
> A logging company that also streams movies

Chris worked on the Netflix Streaming Services team as a Data Engineer, and his experience
there came up in many examples.

Stated "Netflix tends to build over buy"; if you take their [GitHub
repo](https://github.com/netflix) organization as a good representation of what they've
built, that's 111 repos worth of projects (as of 2016May23, using `curl` + `jq`). Of
course, they've already severly limited how much they have to build by heavily leveraging
the capabilities of AWS.

Noted they've been using [Presto](https://prestodb.io/), a ANSI SQL tool for querying
multiple datasources at once, for ad-hoc analytics. Presto replaces Apache Hive, as long
as you don't need fault tolerance, as it stores its intermediate results in memory.

As the number of microservices grew, breakages in one API tended to bring down a _lot_ of
services. Interestingly, [Adrian Cockcroft] mentioned these breakages
tend to show one-level away from the root of the problem in the _dependent_ APIs, which is
echoes a lesson learned in Athletic Training: Pain starts up the chain. To combat these
breakages, they developed [Hystrix](https://www.linkedin.com/in/adriancockcroft).
Hystrix implements the [Circuit Breaker
pattern](http://martinfowler.com/bliki/CircuitBreaker.html). I haven't dived into the
library well enough to know exactly, but I know it solved a few problems:

1. What broke?
2. What's the fallback?
3. Metric gathering on API requests.

Also: `Hystrix` can collapse multiple requests for the same object into one. Natural if
you've got a connector library going in between all of your API requests.

Has Hystrix been re-implemented in any other languages?

#### Data Pipeline

[Slideshare here, goto slide 104](http://www.slideshare.net/cfregly/dc-spark-users-group-march-15-2016-spark-and-netflix-recommendations)

1. v1 - Producers => Chukwa => S3 => EMR
2. v2 - Producers => Chukwa {=> S3 => EMR} & {=> Kafka => Stream Consumers & more}
3. v3 - Producers => Kafka => Router => {S3, ElasticSearch, {Kafka => Stream Consumers}}

Netflix runs a 10k node Memcached cluster that ML models get loaded into, amongst apparently everything else.

#### The Netflix Prize
Background: Given (movieID, userID, userRating, timestamp), improve predictions by 10%.
For a long time, the improvment was stuck around 7%. The key was when _timestamp_ got
incorporated into the predictive models. Essentially, they had to adjust for each humans'
bias. Some examples of said bias adjustments:

1. Alice effect: Alice rates lower than avg.
2. Inception effect: Certain movies always get rated above avg
3. Overall mean rating of a movie; high ratings encourage high ratings
4. # of people who've rated a movie
5. # of days since user's first rating
6. # of days since movie's first rating
7. Mood, time of day, day of week


# Friday - Afternoon
## Deploying & Serving models
[TensorFlow Serving](https://tensorflow.github.io/serving/) provides a means of deploying
and running predictions on the models.

`Dstream` is the RDD of Spark Streaming; the mini-batch that's just come in.
Holden Karrau - High Performance Spark talks about using RDDs in place of DataFrames

What he'd use in a Production-ready system today:

* Workflow: Airflow. Describe DAGs of tasks in Python.
* Extract-Transform-Load (ETL): PySpark. More Python than Java/Scala datasci people running around.
* Serving layer: Redis. Rock-solid, very fast.
* Data Stitching: nifi (maybe). Collects info from many many sources and convert into a single format.
* Storage: Elasticsearch to begin, and maybe forever. Scales well, good APIs; use it until you can't.
    * Spark-Elasticsearch connector is very advanced; takes advantage of data locality
    * Starting to tout itself as a GraphDB?
* Monitoring: Ganglia.
* Logging: ELK fo' sho'
* Queueing: Kafka, if you have the ops team to support it. Otherwise, check out AWS Kinesis.
* Streaming
    * Kafka Streams or Flink. May want to "write to the Apache Beam API" - came out of Google.
    * Storm is proven, but not getting a lot of new development. Twitter has written an API-compatible replacement
      called Heron.
    * Flink has a first-class processing for Complex Data Processing - whatever that
      means.
* Machine Learning: Depends on your language preference. If Python, then TensorFlow, sklearn, nltk.
* IDL: Spark is _all about_ Parquet. In-memory version is Apache Arrow.
    * SparkSQL is the most mature. Edit: A later speaker from Terabyte remarked on
      SparkSQL being the most _immature_, when compared to Apache Hive, Impala, Drill.
    * Any project Michael Armbrust is on is going to be developed well

## Good & Cool ideas
Spark's `new StandardScaler=(withMean=True, withStd=False)` lets you toggle how you feature scale.
PCA wants mean normalization, without std dev, but linear regression will want both.

`TextRank`: Finds the sentence that best summarizes the corpus.

Cluster density can be measured by WSSSE (Within Set Sum of Squared Errors); lower is better.

Speaker mentioned anecdotally that 2 or 3 friends in the last 6 months had ditched
Cassandra clusters in favor of ElasticSearch.

You don't want to be doing read-heavy analytics on your write-heavy Cassandra
cluster; either have two separate clusters and setup replication from W=>R, or
read the SSTable files off the disk.

StitchFix - Fill out preferences for clothes, then a stylist selects five items to ship you. Anything you send back you
fill out why you don't like it. NLP interpets the written response, neural nets learn the style, and they'll even ship
feedback to the designers saying what they've learned.

Interesting thing to note: Often mentioned new technologies as a "recruiting point".

skflow: A scikit-learn API compatible replacment with TensorFlow as a backend.

## Resources
"Jupyter notebooks for developers" & "Matplotlib for Developers" from O'Reilly.

[Adrian Cockcroft]: https://www.linkedin.com/in/adriancockcroft
[^Implicit Feedback]: Feedback unknowingly given, and thus not obviously given; did a user
    watch this movie.
[^Explicit Feedback]: Feedback knowingly given; having a user rate a movie 1-5 stars.
