+++
date = "2015-12-13"
title = "Basic Probability Combinatorics"
category = ["math"]
tags = ["probability"]
draft = true
+++

After I left my stats class in college, I've never been able to keep basic
probabilities straight. Let's fix that.

Given a list of five numbers (1,2,3,4,5):

1. What's the probability of choosing a 3?
1. What's the probability of choosing a 3 three times in a row?
1. How many _combinations_ of four numbers can you make?
1. How many _permutations_ of four numbers can you make?

<!--more-->

##### Probability of randomly choosing a 3: 20%
A 3 repsesents `$\frac{1}{5}$` options from the list, thus 20%.

#### Probability of choosing three 3's in a row: \$$ 20^{3}% = .8% $$
The first thing to realize is that our scenario (three random selections from
the list results in three 3's) is actually _three_ sub-scenarios chained
together; ``triple(x) = random(x) && random(x) && random(x)``. Each `random(x)`
has five possible outcomes; said another way, the _sample space_ of a single
`random(x)` trial has a five _sample points_. The likelihood our `trial` of
using `random(x)` results in a 3 is 20%. Within that 20% likely scenario, the
likelihood of selecting a 3 again is still 20%, but it's already only 20%
likely we're in a world where we selected a 3 the first time. Thus, it's 20% of
20% = 4% probability. And to go for a third 3, it's 20% * 20% * 20% = 0.8%.

##### # of four-length combinations: `$ \frac{5!}{4!} = 5 $`
First of all, some definition:

* _combination_ Unordered collection.
* _permutation_ Ordered collection.

If there is repeteated items in the collection, then that changes the math. Our
example doesn't have any for now.

A collection's number of permutations is larger than its possible combinations.
`[(1,2), (2,1)]` are both valid permutations, but this is equivalent to a
single combination: `[(1,2)]`.

Out of `5` choices, we want to select 4. Said another way, from _5_, choose
_4_ (n choose k).

`5!` represents _all_ possible permutations of five non-repeating choices..
If we want four out of five choices, then we're not considering a sample space
of 1!; this happens to equal 1, so we're not missing out on much.

`$ \frac{5!}{(5-4)!} $`

This gives us all the permutations, but now we need to weed out all of the
identical combinations inside of those permutations; remember, `(2,1) == (1,2)`
when looking for combinations.

How many identical combinations are there? Well, how many permutations can you
find for a collection of `[1, 2]`? 2!, that's how many! If we want to filter
out all the four-item combinations from a list of four-item permutations, we'll
need to divide by 4!.

<div>$$ \frac{5!}{4!(5-4)!} $$</div>

This _n choose k_ is so common, it is formally known as the _binomial
coefficient_, and has a shorthand: `$ {5 \choose 4} $`

##### References
[Combinations & Permutations](https://www.mathsisfun.com/combinatorics/combinations-permutations.html)
