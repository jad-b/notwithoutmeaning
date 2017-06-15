+++
date = "2015-12-18"
title = "Your Atomic Assistant"
category = ["thoughts"]
tags = ["tasks", "priorities", "project management"]
draft = true
+++

Still mulling over Atomic. I haven't found a better data model for thoughts,
potential action, and action than that of a graph.  [networkx][networkx] was
interesting to play around with; very capable, and I have no doubt it would
suffice for a good long while as a graph backend. If it could seamlessly act as
a driver on top of a dedicated graph database, now _that'd_ be something, but
that's a problem I don't yet have.

If you got all this data, a digital map of what your thoughts, actions, and
potential courses of action, what could you do with it? You could predict; in
our case, prediction looks like optimal resource scheduling. Given _x_ things
to do, how can I get the most accomplished? I have 30 minutes, what can I get
done? What if some tasks can only be accomplished at certain locations, or
around certain people?

This sounds highly reminiscent of the same problems encountered by resource
schedulers, such as Apache's YARN, or whatever the hell is powering Kubernetes
or Docker Swarm. Their jobs are our tasks. Where they have constraints of
memory and CPU cores, we have limits of location, personnel, time, and money.
Where they have workers, we have only ourselves - unless we have a
team[^ai-managers].

### Scheduling Happiness
Getting work done is good. Getting lots of work done is better. Getting all the
work done and knowing you're doing so as efficiently as possible is the best.
But a productive life does not mean a happy one. Can we schedule happiness as
well? Let's deconstruct.

To do so, we'd need to know what makes you happy. Depending on your
self-awareness, that may be very clear or a total unknown. But we do know, in
general, what makes people happy[^happy]. So we have a starting point. And it's
conceivable that you could provide feedback, saying how happy you are at the
moment, and the machine would learn what things you like, and what things you
don't. It'd have a hard time correlating that you liked working this morning
because you were listening to a new song you just found, or that you hated
Thursday afternoon because you were worried about your sick dog, but given a
big enough sample size, the [truth will out](https://en.wiktionary.org/wiki/truth_will_out).

So yes, theoretically, we could know what makes you happy. Now we can quanity.
And we can optimize what we schedule. Some may find this dystopic, but I find
it hopeful. History shows that, on average, we're not any happier now than we
were decades ago<sup>[how-much-is-enough](feedme)</sup>. How have humans made progress?
Technology. The answer isn't too keep computers out, it's too make it safe to
welcome them in.








### Footnotes
[^ai-managers]: It's been predicted that AI will replace managers before they replace the cashiers,
    and these musings support that thinking.

[networkx]: http://networkx.github.io/documentation/latest/overview.html
