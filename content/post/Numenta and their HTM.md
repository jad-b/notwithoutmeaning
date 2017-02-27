+++
categories = ["machine learning"]
date = "2016-06-13T07:39:45-04:00"
tags = ["review"]
title = "Review - Numenta and their HTM"
draft = "true"
+++

Numenta[Numenta] is pursuing artifical general intelligence (AGI) through a _neuroscience_-based approach

<!--more-->

### [Foundation of Neocortical Reasoning]
* 75% of the brain is cortex, which is where all high-level thought occurs
* Common learning algo used for all sense-derived thought.
* The cortex isn't born specialized; it learns to work for all demands.
    * one piece of cortex could just as well become adapated for engineering as it could music
* All sensory streams use a common representation of action potentials.
* The brain creates vision, sound, feeling, etc. from _the models it enforces atop these patterns_
* We require change in input to build these models; such as your eyes rapidly shifting without our notice.
* Neocortex cells are organized in hierarchy
* Within a layer of the hierarchy, there are layers of cells
* Within the cell layers, the neurons are organized into mini-columns
* 90% of neurons are _away_ from the cell body (distal)
* These distal neurons require a threshold of neighbors to activate to create a _dendritc potential_, which travels back
  to the cell body.
* Synapses between neurons are being formed and going away all the time
* Numenta believes the patterns are inherently _time-based_, like melodies
* High-level constructs like concepts, ideas, can thus be _unfolded_ into things like speech or images by traveling
  _down_ the hierarchy
  * How can the body model time-based patterns through synapses
    * What if every time a synapse fires, it encourages synaptical growth nearby? If we consider the strength of
      synaptical groups by how tightly grown together they've become, then as one group grows stronger, nearby groups
      would trigger in response
        * This only makes sense if these assumptions hold true:
            1. The more tightly-bound synapses are, they lower their activation cost
            2. As groups trigger, they add to the action potential traveling along dendrites. This accumulation of
            charge would then allow for sequential triggering of low-to-hi threshold groups.
                * This raises a problem of triggering _all_ nearby groups, which would result in noise
* _H_ierarchical _T_emporal _M_emory

### [Science of Anomaly Detection]
* Supervised - requires a training set.
* Unsupervised -
* Data can be put in to context - time, space, or associational (spatial, temporal, semantic).

[Numenta]: http://numenta.com/learn/
[Foundation of Neocortical Reasoning]: (link req'd)
[Science of Anomaly Detection]: https://drive.google.com/open?id=0BwkS4AABLr63YnZ1ODhCTTR2dnc
[SDR Whitepaper]: http://arxiv.org/pdf/1503.07469v1.pdf
