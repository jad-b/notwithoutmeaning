+++
date = "2016-04-02T14:57:03-04:00"
title = "The Light Fantastic"
draft = true
+++

Let's make an audio-reactive equalizer, using an Arduino and some LEDs.
<!--more-->

## Some Background on Audio Signals

Given _N_ samples, we can find the value of frequency _k_ with:

<div>$$X_{k} = \sum_{n=0}^N-1 x_{n} * e^{i\pi * \frac{2kn}{N}}$$</div>

Where
* `$x_{n}$` is the signal value for sample _n_
* `$e^{i\pi}$` is the point along the circle
* `$\frac{2kn}{N}$`
    * _k_ is the frequency we're calculating, limited up to (N-1) Hz.
    * _n_ is our sample in time.
