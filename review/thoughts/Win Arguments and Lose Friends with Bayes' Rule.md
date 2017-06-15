+++
categories = ["math & statistics"]
date = "2016-06-02T10:35:23-04:00"
tags = ["bayesian statistics", "intuition"]
title = "Win Arguments and Lose Friends with Bayes' Rule"
draft = "true"
+++

I recently had a "conversation" with a co-worker over the quality of a piece of
software being developed in-house. I was not a fan of this work; every
interaction we had with it seemed to have a negative outcome.  He was arguing
that it had been getting better. And then I realized that if I used math I
could both A) totally win this argument, and B) never be talked to ever again,
which is great for personal productivity. So that night, math I did.

Bayes' Rule seems to has maaaaaany introductory write-ups on the internet, but
until you've worked through a couple examples, it just won't click. In applying
it to above scenario, as we'll step through below, it really started to come
together. I also had an intuition that may help others come to terms with
Bayes' Rule even faster, so let's start with that.

First off, the common form of Bayes' Rule:

<div>$$
P(A|X) = \frac{P(A)P(X|A)}{P(X)}
$$</div>

Where:

* `$P(A)$` is your belief in event A.
* `$P(X)$` is the probability of X, a relevant incoming piece of data, occurring
* `$P(X|A)$` is the probability X could occur if A is true.
* `$P(A|X)$` is your belief in A being true _if_ you see X occur. We're trying
  to figure this out by using the rest of the information.

`$P(A)$` is what you start with, and thus gets called the _prior probability_.
It gets replaced by the calculated value of `$P(X|A)$`, which we call the
_posterior probability_, as it's what we believe _after_ we've seen some data;
_after_, thus _posterior_. Likewise, `$P(A)$` comes before, and thus is
_prior_.

The intuition is we use `$P(X|A)$` and `$P(X)$` to update our prior, `$P(A)$`,
into our posterior, `$P(A|X)$`. When the next piece of data, X, comes in, we set
`$P(A) = P(A|X)$`, and calculate a new posterior, `$P(A|X)$`. By pulling
`$P(A)$` by itself in the equation, I think this gets a little clearer:


<div>$$
P(A|X) = P(A)\frac{P(X|A)}{P(X)}
$$</div>

Let's look at `$\frac{P(X|A)}{P(X)}$`; what does that actually mean? First off,
whatever the division of those two values produce is what determines whether we
adjust our prior up or down. In English, we could write it as "The ratio
between our belief X could happen in a world where A is true, and the
possibility X could happen at all." When the data confirms our belief,
`$P(X|A)` is higher than `$P(X)$`, it evaluates to a value greater than 1, and
leads to our posterior increasing over our prior (proportional to the ratio we
just calculated). When it's lower, such as when data comes in that's
inconsistent with our belief in A, it decreases our posterior proportionately.

Let's step-through the scenario I detailed above: Is this software good?

* A is the event the software is good.
* X will be a positive or negative experience with the software
* P(A) is our _belief_ the software is good, represented as probability. Since
  we have no idea, we'll give it a 50/50 chance, thus .5.
* P(X) will be the probability a postive|negative experience could happen
  with any piece of software. There's a way to calculate this based off our
  event A, but for now we'll say there's a 50/50 chance of having a good or bad
  experience as well, so .5.
* P(X|A) is the probability we have a positive|negative experience given the
  software is good, so there's two values here. We'll say P(Positive|Good) is
  an 80% chance, and thus P(Negative|Good) is 20%.
* P(A|X) is our posterior, and what we'll calculate as we collect experiences
  with the software.

Let's build an artificial list of experiences. As I said, my opinion is there's
been more good than bad, so I'll mock it up as such: [N, Y, N, Y, N, Y, N, N,
Y, N], or 3:2 negative to posttive. We'll step through the first two examples
to see how a negative and positive data change the prior, and then we'll view
the output as a table.
