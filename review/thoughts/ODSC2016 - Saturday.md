+++
categories = []
date = "2016-05-21T09:30:59-04:00"
tags = []
title = "odsc saturday"
draft = "true"
+++

## keynotes
#### Julia co-founder - Stefan Karpinski

> ousterholt's dichotomy
    System languages vs. scripting languages

This two-language split has significant drawbacks

* Forces vectorization everywhere
* Creates a social barrier between the elite programmers who can write the effective yet complex performant code and
  those who use the code
    * Example: numpy has a simple Python interface, but its internals are low-level C; using numpy doesn't teach you how
      to develop on numpy

Provided a measurement of speed vs productivity by the stand-in of (LoC, Performance Relative to C)

#### rapidminer founder & CTO - ingo mierswa Gartner predicts by 2018 >50% of large industries will be disrupted by the
application of data science.

> Whenever you find out nobody cares, go the extra mile. Figure out what you can do to _change_ the future.

* Four paradigms of moving quickly
    1. Visual Paradigm. You reach more people.
    2. Wisdom of Crowds. Let people tell you what works.
    3. ML and data prep automation. If you can automate it, oh _hell yeah_, automate it.
    4. Code-optional. Whenever you need to, you should be able to insert code.
       Let me code the hard stuff. But not the things we know how to do.

RapidMiner is open source, and supports community modules.

#### Data Science Guru - Kirk Borne [Collection of Spurious Correlations](http://tylervigen.com/spurious-correlations)

#### CEO of Crowdflower - Lukas Biewald Use active learning. Boom.


### BayesDB
http://probcomp.csail.mit.edu/bayesdb
http://empirical.com

Many good points about data science as a whole.

* Google paper about the high maintenance cost of a ML model once deployed
    * http://research.google.com/pubs/pub43146.html
* Each question ends up requiring a different model, and then each model ends up needing a data scientist to maintain it

Back in the 1980s, they faced the same issue with building repots.  Initially they thought it'd just require throwing
huge manpower resources to out-manual labor the problem. Instead, SQL came about. Side note: OpenSQL appeared to be
"magic AI" when it was first conceived.

BayesDB lets you make predictions
* Old: What products did customer X buy last year
    * Returns subsets and aggregates
    * Physical independence
    * SQL
* BayesDB: What products will customer X probably buy this year?
    * Returns distributions of outcomes
    * Model and inference independence
    * BQL: `SIMLUATE a, b, c FROM tabel GIVEN d=1, e=2, f=3, etc.` - Awesome!

### Workshop: Network Analysis
As I only managed to sneak in the back of the room for 20 minutes before the next talk, I'll just leave a link to the
speaker's GitHub repo: https://github.com/ericmjl/Network-Analysis-Made-Simple

### Tamr
ETL is an unsolved problem.

Data curation paper from MIT CSAIL: https://cs.uwaterloo.ca/~ilyas/papers/StonebrakerCIDR2013.pdf

A vendor-independent metadata repository

> Data should be treated like websites; it should be crawled, indexed, have machine learning applied to discover common
> patterns and make recommendations.

> If you do this data unification and collection very, very well, the output looks _simple_.

Asking a CIO what you'd ask a CFO:
Where does your data come from, what data do you have, and where are you using it?

### Ben Vigoda - A Tour of Probabilistic Programming
http://probcomp.csail.mit.edu/venture/

Probabilistic Program beat Deep learning on a recent handwriting recognition over a 1 data-point sample; Science 2015

"Stochastic Lambda Calculus" - actually been around for awhile. Turing-Complete way of describing all probability
distributions. Offers the promise of a 3-5 training learning curve.

`chimpy` probprog language taht sits on top of Python.

WebPPL - Stanford site

### Bayesian Bandits
https://github.com/bgalbraith/bandits

Applications
* Website Optimization
    * Instead of purely using an A/B split, you offer the button you _think_ they will want, then learn from their feedback.
      Lets you customize the offering on the fly.
* Packet Routing - where to go to
* Recommender Systems
    * Goal: Suggest a new song.
    * I think I know what you want. Here's something random. Tell me how far off I am.
* Comment Ranking
    * _Exploit_ highly-rated comments to get the party started, then _explore_ other related comments.

Bandit Solutions
1. Estimate the rewards from our actions
2. Decide on an action; needs a policy for taking action
3. Observe result of action and incorporate feedback.

#### Reward Estimation
Maximum liklihood value-estimation, .e.g mean of all observed rewards

`$ reward = sum(trials)/len(trials) $`

Or use a
`$ r_{a_{n+1}} = mean(r_{a_{n}}) + \alpha(r_{a} - mean(r_{a_{n}}) $`

Where `$\alpha$` lets us weight newer values more heavily (or discount them, for a slower update).

#### Decision strategies
Maximize reward/ minimize regret; balance expliotion and exploration

Softmax = Transform a vector => vector with values [0,1]

https://e76d6ebf22ef8d7e079810f3d1f82ba1e5f145d5.googledrive.com/host/0B2GQktu-wcTiWDB2R2t2a2tMUG8/

### Bayesian Statistics Made Simple
Speaker: Allen B. Downey f/ Olin College
Website: https://sites.google.com/site/simplebayes/home/odsc-east-2016

