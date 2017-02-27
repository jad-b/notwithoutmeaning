+++
date = "2016-05-05"
title = "Learning Machines"
categories = ["thoughts"]
tags = ["learning", "Machine Learning", "AI"]
draft = "true"
+++

## Why to learn about AI & Machine Learning (The Motivation)
More and more of computer science is becoming generalized. We are continuously finding ways to reduce boilerplate code.
I feel we'll continue to make tighter and tighter adaptations between descriptions of data (REST APIs, DB
schema, Objects in OOPs) until one can largely auto-generate the others. In that world, all a software engineer is left
with is the processing of the retrieved data, the actual algorithmic work to be done. With such reduction of mindless
data retrieval and storage, this would seem to be a promising world for engineers - more time to be spent on the
interesting work, less on mundane data I/O.  However, as data becomes easier to work with, we are rapidly out-stripping
innate abilities to comprehend it, much less actually leverage it towards a meaningful purpose.

<!--more-->

The only clear solution is to augment our natural analytic abilities with computers. The fields of AI and Machine
Learning in particular have had the capability of augmenting human thought for years.  Artificial Intelligence is a
broad field[SO AI Overview]. It can optimize, _prove_ logical constructs, and deliver probabilistic analysis, the last
of which is machine learning's specialty.



### Key Concepts in Machine Learning

> ...and what matters most is Understanding. And Understanding starts with "What Matters". - [Quora: Forays into AI]

### Curriculae, by topic

This section performs two roles: an _unstructured_ stash point for interesting resources I come across, with an emergent
_structured_ outline for orderly consumption, as I consume them myself.

Caveat to the self-thought prodigies: Don't skip the introductory material. And if you do, prepare to come back to it.
There's a _huge_ temptation to skip to the high-level, "good" parts, but that's a fallacy for two reasons. One, the most
important concepts, the key takeaways in the field, live lower down the hierarchy. Two, building understanding equals
building a foundation, and going to the grad textbook is like trying to build a house by starting with the roof. If you
aim for the moon on this one, you won't end up in the stars; you'll miss (get confused), succumb to gravity
(frustration), and crash-land in some over-fracked oil field in the central US[^caveat to that caveat]. Don't skip the
introductory material.


* General introductions:
    1. [Andrew Ng's Course](https://www.coursera.org/learn/machine-learning)
    1. [Machine Learning: A Probabilistic Perspective](https://smile.amazon.com/Machine-Learning-Probabilistic-Perspective-Computation/dp/0262018020/ref=sr_1_1)
       People say it's meant for the advanced undergraduate/starting graduate, and I suppose those with a stronger math
       & statistics background would be fine. I'm learning a ton, but it's slow-going. Each exercise seems to take my
       30-60 minutes, so I sense I'm in it for the long haul.

* Bayesian Machine Learning
    1. Obviously Bayesian Statistics is going to be required at
       some point.
    1. [Model-based machine learning](http://www.mbmlbook.com/index.html)

* Neural networks
    * Taken from Karpathy's blog post of using RNN's to evaluate selfies:
        1. [Michael Nielsen's Tutorials](http://neuralnetworksanddeeplearning.com/chap1.html)
        2. [Andrew Ng's Course](https://www.coursera.org/learn/machine-learning), Weeks 4 & 5
        3. [Stanford's CS213n course of Convolutional Neural Networks](http://cs231n.stanford.edu/)
        * By this point you should fairly well-trained on NNs. For advanced review:
            1. The upcoming [Deep Learning book](http://www.deeplearningbook.org/)
                * Yoshua Bengio is one of the Big 3 who developed NNs back in the 80s, along with
                  Geoffrey Hinton and ???.
            2. [Hugo Larochelle's NN course](https://www.youtube.com/playlist?list=PL6Xpj9I5qXYEcOhn7TqghAJ6NAPrNmUBH)



## Resources
[SO AI Overview]: http://stackoverflow.com/questions/2156958/what-all-goes-in-learning-artificial-intelligence#answer-2157280
[Quora answer]: http://www.quora.com/How-do-I-learn-machine-learning-1
[Andrew Ng's Coursera Course]: https://www.coursera.org/learn/machine-learning/home/info

[caveat to that caveat]: If you know yourself well enough to manage that frustration, this trial-and-error approach is a
_great_ way for figuring out unknowns, but emotional management skills are a must.
