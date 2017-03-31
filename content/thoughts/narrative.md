+++
categories = []
date = "2016-07-26T07:58:40-04:00"
tags = ["journal"]
title = "narrative"
draft = "true"
+++

# 2016, August
* 03
    * Looking for a watch-and-build tool, that would mimic my experience with Gulp, but for Go &
      Python as well. Doit looks the least clumsy of what I've come across, and it wouldn't support
      browser live-reload out of the box. I may try out Gulp again, and see how it treats me for
      non-front-end work.

# 2016, July

* 28
    * Read up on Bayes Nets some more, at [kmurphy's great tutorial](http://www.cs.ubc.ca/~murphyk/Bayes/bayes.html).
    Makes loads more sense after struggling through the more formal write-up in ML:aPP, Ch. 10.
* 27
    * Problem 10.2 in ML:aPP
    * Retain parent label's in child node's name in label tree (matchwell)
* 26
    * Wrestled with Expectation-Maximization algorithm, which in term led to Maximum Likelihood &
      refreshing on the Chain Rule.
        * https://people.eecs.berkeley.edu/~pabbeel/cs287-fa13/slides/Likelihood_EM_HMM_Kalman.pdf
    * Came a little more to terms with how to do multilabel classification in sklearn. Need to rewrite the
      `util.build_prefix_tree` to include the full path at each node; this provides namespacing for later lookup and
      decreases node name collisions.
