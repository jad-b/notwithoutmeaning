+++
date = "2015-10-10"
title = "On Learning"
categories = ["thoughts"]
tags = ["learning", "metalearning"]
+++
## A Succinct Version of This Book
To save you some time, here's everything you need to understand:

* Effective, efficient learning is finding the answers to your questions.
* Learning + creation = Understanding.

If that completely jives with you, then you may wish to skip to the reference
guides for the sake of comparing notes on implementation.

If the above two points raise questions, then read on. If they don't raise
questions and you're not a "completely jives" person, then it's good that you're
reading this. You don't know how to learn.

## Why Learn How to Learn?
Why spend time learning _how_ to learn, instead of just learning what you want?
What are the problems we overcome when learning? What are our goals?
What are the short and long-term benefits from optimizing how we learn?

## What is Learning?

## The System: Discover, Understand, Remember

#### Lessons Learned
* Don't learn faster than you can review
* Doing problems is insufficient as a review, but, for some reason, critical for
  developing a complete understanding.

### Study Template
By following the below template, you perform the critical actions needed to
enhance your understanding.
```
##### Before
What's the problem)

Why is this a problem?)

**Action: Skim material**

Theme of HW Problems)

Initial Questions)

##### During
**Action: Start timer**

Key Concepts)

Relationships)

Notes)

Questions)

Unknowns)

##### After
**Action: Stop timer**

Review Questions)

Feynman)

```

### Doing Problems

### Apply
1. Begin by conducting a Review.
1. Solve problems or build something
    1. Use a timer to focus.
1. Cap at 30 minutes. If still unsolved, look up the solution, but reschedule as
   it like any other problem.
1. __Q.__ Scheduling: How often should problems be worked? Re-worked?


#### On Homework Problems
I remember spending the summer before my senior year doing hundreds of chemistry
problems, as assigned to me by my AP Chemistry teacher. For weeks straight, I
spent hours a day churning through them. Did I come to understand stoichoimetry?
Uh huh. And it's with experiences like this, and the continuing assignment of
homework in school, that makes me think doing homework _does_ increase
understanding. But where do the diminishing returns lie?

Ever since hearing Ben Vigoda mention off-hand during an OSCON 2015 presentation
on probabilistic programming that research has shown humans can learn to
recognize a new object after about 3-5 exposures, I've wondered if there's a bit
of magic to that range. Coupling that with phenomenon like Spaced Repetition for
studying, can we arrive at an approximately-optimal solution for studying?

I think we can. Say you're reading a textbook split into chapters, with sections
within those chapters. I propose a schedule like this:

* Day one) Read the first section of the first chapter.
* Day two) Read the second section, and do 2-3 problems from the first section.
* Day three) Read the third section, do 2-3 problems from the second section,
  and 1 problem from the first section.
* Day four) Read fourth section; 2 problems from third, 1 problem from second
* Day five) Chapter's finished; do 2 end-of-chapter problems, 2 fourth section
  problems, 1 third section problem.

You can view the schedule as a table, with rows of topics, columns of dates, and
cells holding the action you took to learn. The action could be solving a
problem, reading a section, or reviewing your notes; intuitively, it makes sense
to read the material, work on some problems, and save review for the long game.

The problem's been defined; how can we automate? At its simplest, we have an
ever-growing queue of work that needs to be scheduled at some point in the
future. There's also a hierarchy amongst topics that we'll want to leverage; obviously
the sections of a chapter are grouped together for a reason. Come a year from
now, we want our review to be focused on the _chapter_, not on problem 4.2-5.
Indeed, the problems are simply tools for the much more valuable concepts they
engage us with.

SuperMemo has a distinction between _topics_ and _items_ which I think applies
here. To a point, we can treat the structure recursively; scholarly fields keep
their information in textbooks, which have chapters, which have sections. At the
lowest point, we must distinguish between the tools we use to learn at the
topics we wish to learn.

## Quick Reference
1. Learn
    1. Warm-up
        1. What is the problem? Why does it matter?
        1. (If Applicable) Review problems.
        1. Come up with additional questions.
        1. Skim material or warm-up with alt. introductory material
    1. Set a timer
    1. Write down questions and unknowns.
    1. Work through difficult sections by hand
1. Review
    1. Write-up what you learned
        1. Attempt to recall from memory
        1. Outline key concepts to assist.
        1. Use Feynman Technique
    1. Summarize previous reviews.
    1. Note relationships to other topics
    1. Lookup answers to questions
    1. Create Anki cards.
1. Apply
    1. Perform a review
    1. Set a timer

## How Do You Know?
### How Do We Know What We Know? Episotmology nutshelled.
### How Do We Know When We Know It? Taking the Measure of Ourselves
* Reading
    * Topic of section/chapter/textbook
    * Time spent reading
    * Number of pages read
    * % comprehension
* Watching
    * Time of video v. time spent watching
    * % comprehension
    * Topic of video/video series
* # of notes taken
* # of questions raised
* # of unknowns
* Quality of material (1-10 ranking)

           (pages read / time spent) * % comprehension = pg/min


# Good Quotes

> ...and what matters most is Understanding. And Understanding starts with "What Matters" - [Quora:
> Forays into AI]

> because we get better with practice as we get more experience, which is a
> hallmark of any Intuition based skill - [Reductionism Considered Harmful]

> This is another hallmark of Intuition based skills: they cannot be taught as
> high level rules, they have to be experienced bottom up. This is,
> incidentally, also the difference between Teaching and Coaching - [ibid]

> Forgetting what you've learned from a class is not the course's fault. Without
> spaced, repetitive recall, no memories will be formed. - [me]

## Burning Questions
Is true understanding better represented by the quality of question you can ask,
as opposed to the answer you can give?

Can you "not go home" when re-reading a book, i.e. no one reads the same book
the same way twice?

[^1]: Ref needed.
[grounding]: to give (something abstract) a firm theoretical or practical basis
[Quora: Forays into AI]: http://www.quora.com/How-do-I-get-started-in-Artificial-Intelligence
[Reductionism Considered Harmful]: http://syntience.com/rch.pdf
