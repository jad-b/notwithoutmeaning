+++
categories = []
date = "2016-05-22T15:35:49-04:00"
tags = []
title = "ODSC Sunday"
draft = "true"
+++

### Doing NLP with Spark MLLib
Frank Evans
slideshare.net/frankdevans
github.com/frankdevans <-- Contains some NLP code demonstrating these concepts.

> Spark is only a way of formatting and structuring you data to communicate
> with the engine

At it's base, a RDD is an array of things.

Spark is also a library, that uses its own data structure, the RDD.

Topic Modeling has 5 discrete steps:
1. Raw Text
2. Wrangling & Cleaning
3. Model
4. Extract
5. Visualize|Communicate

#### Raw Text
It's incredibly messy

#### Wrangle
Remove punctuation, get rid of very common words, stemming (or lemmatization).
Lemmatization instead converts words to their most common form: {enjoys,
enjoyed} => enjoy.

We _have_ to end up with a Document Term Matrix, a (DocID, WordID) table.

A common method for keeping more context is n-grams. But really, we just want
to track a very _small_ set of n-grams, such as "economic recovery" vs.
"accident recovery". Instead, try a "frequency merge": if two words appear
together by a tunable threshold, you can search (replace?) those n-grams to
avoid "noise", where a common word (like recovery) mistakenly groups two
documents together.

#### Model
Speaker performs to think of modeling as clustering. Trying to find an
effective way to cluster those documents. In n-topic modeling, each document
belongs to _all_ topics by a %

#### Extract
Pulling out the hyper-parameters, the metadata of the data and the model
itself.
For everything single document, if you say give me five topics, the model
produces a five-item array indicating how much that document belongs to each
topoic. Also, for every term, how much does that term indicate the owning
document belongs to that topic.

> A communication layer to be able to _capture_ that model, and to be able to
> use it in visualizations.

#### Visualize
Word clouds are viewed as kind of stupid, due to their lack of insights.

t-SNE for documents? Shows how related each document is to one another, using
euclidean distance between the Extract-phase arrays saying which

Try growing the # of topics: 2, 4, 8, etc. Now you can drill down into finer &
finer granularity, as one topic out of 2 is variably composed of the four
models it decomposes into.
