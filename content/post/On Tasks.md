+++
date = "2015-09-24"
title = "Gettings Things Done"
category = ["thoughts"]
tags = ["project management", "tasks", "priorities"]
draft = true
+++

You have (many) things you would like to do. We'll call them _accomplishments_,
as the definition of _accomplish_:

> achieve or complete successfully

...feels about right.

"Doing" them means physically acting out all of their sub-steps.

__Axiom:__[<sup>axiom</sup>][] All accomplishments are made up of smaller accomplishments[<sup>1</sup>][].

Some things can't be completed before others. They _require_ the previous steps
to be accomplished before they/it can be accomplished.

__Axiom__: All potential accomplishments have a required external state, pending their
accomplishment.

This state may already be present, in which case it doesn't *feel* like a
requirement to us. Maybe it was you waking up this morning, whatever. Point is,
just because we don't *think* about it doesn't mean their aren't certain
preliminaries[<sup>2</sup>][].

Some of these accomplishments may be inter-connected. Project managers have
these great terms for laying out the fine-grained dependencies: start-start, start-finish,
finish-start, finish-finish. Those are all a sub-set of "These things are
directly related. One can not be completed without the other."

So there's a graph[<sup>3</sup>][]. Each accomplishment is a node, which divides into
(infinitely, but we're ignoring that) sub-nodes. It is _accomplished_ when there
are no more nodes of work to be completed. It is _ordered_ by the nature of
requirements between the nodes. It is _parallelizable_ by the _lack_ of
requirements between _all_ nodes. It is _stateful_ by the requirement on internal system
state[<sup>4</sup>].

If you want a really, really good Todo list, it's got to take all of those
things into consideration.


## Glossary
[<sup>axiom</sup>]: a statement or proposition that is regarded as being established,
accepted, or self-evidently true.

## Endnotes:
[<sup>1</sup>]: Yep, inifite sub-division. Acting across time, with time being
continuous, means we could keep sub-dividng each moment smaller..and
smaller..and smaller. However, that's pretty much useless from a practical
point of view, so we'll worry about the *atoms* of action, and not about the quarks.
[<sup>2</sup>]: Imagine a freshly-`fork`'d AI program. It's unique, in that it has no baked-in
heuristics (models), and instead it builds its own. It does so by looking at
the world, and trying to unravel all the cause-and-effects it finds. Now
pretend it gets put in charge of launching nuclear missiles in the event of
cataclysmic, "oh yeah well fuck _you_" vengeance against an enemy. There is
a _ton_ of necessary _state_ that goes into that decision. Possibly including
whether or not whoever originally gave the order of retribution is still around
and calling the shots.
[<sup>3</sup>]: Example graph:
```
a->c-=>f->h*
    /
b->e

d->i->j+++=>n*
draft = true
         /
g*      /
       /
k->l->m

o*

p->g*
```
Order of creation from top-bottom is alphabetically chronological; the letter
corresponds to the time of creation of the task, as well as its placement in
the graph, e.g. `g` was conceived of after `d`, but before `h`, but since it
has no (unsatisfied) dependencies, it exists between the chains started by `d` and `h`.
[<sup>4</sup>]: The system being "the world". Internal being "that which
affects you." Yeah, have fun drawing that distinction on your own in the
five minutes a day you tell yourself you'll write down your list for the day.
This is why optimally accomplishing your accomplishments bascially, ney
_absoultely_,  cries out for some computational assistance. Your primate mind,
spongy and mysterious and highly evolved as it is, isn't going to handle the
checking all the ins-and-outs of "Is this task accomplishable _right now_?"
