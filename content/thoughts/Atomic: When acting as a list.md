+++
date = "2015-10-23"
title = "Atomic Round 1 - When acting as a list"
category = ["thoughts"]
tags = ["tasks", "priorities", "project management"]
draft = true
+++

Previously I'd talked about [the "complex unity" that makes up any
acoomplishable action.]({{ site.baseurl }}{% post_url 2015-09-24-on-tasks %}). I'd
concluded by stating any decent project management tool, from your basic Todo
list up to enterprise-level software like JIRA, would need its foundations on
these principles.

I started hacking around with something which I'm calling "Atomic". The
name comes from the definition:

> of or forming a single irreducible unit or component in a larger system

...which ties in nicely with the axiom that "all things are made of smaller
things", and effective and efficient action requires the determination of these
_atomic_ units of work.

After setting up a decent CLI using python's [`cmd`](https://docs.python.org/3/library/cmd.html)
module, I implemented basic stack operations. You can push, pop, rearrange, and
filter items within, and a `Todo` class lets you apply tags. The goal was to
start with the simplest notion, and see where it dead-ends, which it quickly
did.

Pretty early on, you want the ability to filter items, and operate on that
subset. But any operations you perform on that subset you want reflected in the
master list, which requires some Python trickery. And core to the idea of
`atomic` is a notion of composition, which requires hierarchy. Hierarchy in a
list looks like item attributes tracking a slew of edges/arcs with metadata as
to what the edge _means_. It's not that you _can't_ do these things, but it's
that you start to feel a list is the wrong data structure.

So what is the right data structure? A graph (network, if you will). I've come
across some interesting reading material[^reading], which I'm still
digesting. Hopefully a new approach will emerge soon; if only I knew where to
start...[^ha].








### Footnotes
[^reading]: The following have been educational:

    * A re-introduction to graphs: https://www.python.org/doc/essays/graphs/
    * A _really_ good review of graphs, at about the undergraduate level:
      http://www.python-course.eu/graphs_python.php.
    * A promising graph library: https://graph-tool.skewed.de/
    * Another promising graph library: http://networkx.github.io/

[^ha]: Get it? It's a Catch-22, because you need Atomic to figure out how to do
    Atomic...
