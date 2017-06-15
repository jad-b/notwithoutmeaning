+++
categories = ["software engineering primer"]
date = "2016-12-17T12:20:35-05:00"
tags = ["software engineering"]
title = "Planning Your Project"

+++

## Prototyping
The goal of prototyping is to answer questions. How will component A talk to
system B? What will deployment look like? The end-user's non-technical - what
will their interactions look like? Is having the DB in a different datacenter
going to noticeably slow things down to the point we care?

That last point is especially important - how will people use this thing? If
you're writing a chat bot, what kind of interactions feel "natural" to the user?
If you have _something_ they can query, you don't have to wonder, you can simply
find out.

Is this an MVP? I say it's not. The difference being people often think you
iterate upon your MVP, where as a prototype __needs to be thrown away__. Its
purpose isn't to be built upon, it's to answer questions. If you made it good
enough to keep around, you spent too much time on it. Maybe, on a mature team
with mature tooling, there won't be much change between your prototype and the
final product - OK. But now is the time for speed and discovery; if it slows you
down, don't do it now.


## Iterating
Alright, you've watched it work, and answered a slew of questions along the way.
But you have to run the commands manually, the whole thing's actually three
shell scripts, and you'd be ashamed to let anyone you respect see your work. In
other words, you nailed the prototype. Now build it.

Again, I recommend ignoring what you've coded so far. Whereas before you
stitched five libraries together to do what you want, maybe you reach for the
heavier-weight framework that does it all for you. Good job! You figured out
using that framework was worth the lock-in and opinionation using it entails.
