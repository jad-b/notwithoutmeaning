+++
date = "2015-10-10"
title = "On Learning"
categories = ["thoughts"]
tags = ["learning", "metalearning"]
+++
# How to Learn

## Burning Questions
Is true understanding better represented by the quality of question you can ask,
as opposed to the answer you can give?

Can you "not go home"; no one reads the same book twice the same way?

## Why Optimize Learning?
Why spend time learning _how_ to learn, instead of just learning what you want?
What are the problems we overcome when learning? What are our goals?
What are the short and long-term benefits from optimizing how we learn?


## Figuring Out What to Learn
1. Guess at a topic
1. Overreach
    1. Identify what you're confused by.
        * Write down every word, concept, and reference you don't understand.
    1. Find the prerequisite concepts for what confuses you.
1. Repeat until you're on known ground.
1. Gather resources
    1. Identify at least three resources. Each should take a different
       approach: different wording, different examples, different formats
       (slide deck, pdf, video, q&a).
    1. Scope the material
        1. Table of contents from textbooks
        1. Syllabus from a college course
        1. Progression of a YouTube video series

## How to Study

### Learn
1. What do students often get caught up on?
1. (Optional) These may help in getting more out of a session.
    1. Guess at Why it matters, and What problem it solves.  1. Look at some problems beforehand 1. Come up with questions
    1. Warm-up by skimming the material, or reading a higher-level resource like
       slides or an introductory text.
1. Begin
    1. Note your start time.
    1. (Optional) Set a timer. This can help focus you on the task at hand.
       You may want to set enough time aside to perform a wrap-up of your notes.
    1.  Note questions and missing prerequisites as you go.
        * Jargon you need to define, statements you don't understand, completely mysterious
          concepts.
    1. Write, like with a pen, down difficult sections to work through. Writing
       shows superior assistance in retention over typing[^1].
    1. Consume material until confused (%50 comprehension), or out of time.
        1. Note your end time, and calculate your adjusted velocity:
            (pages read / time spent) * % comprehension = pg/min

### Review
1. Attempt to recall material before referring to external resources.
    1. Outlining key concepts can assist in reminding you what you learned.
       It can also help for classifying the concept.
1. Every review, attempt to re-summarize what you wrote previously. Eventually
   contain it down to a sentence or two.
1. Use your list of questions you built while learning to lookup answers.
1. Indicate relationships to other topics.
1. Use a system, like Anki SRS, for long-term memorization
    1. <http://rs.io/anki-tips/>
    1. <https://www.reddit.com/r/medicalschool/comments/4ocdyb/a_list_of_anki_tips_and_suggestions_that_i_wrote/>

### Lessons Learned
* Don't learn faster than you can review

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
## How to Apply

### Lessons Learned
* Doing problems is insufficient as a review, but, for some reason, critical for
  developing a complete understanding.

### Doing Problems
1. Discovery: Read the problems, w/o attempting to solve them.
1. Understanding: Read the problems, and solve them in a high-level way.
1. Remembering: Solve the problems which you deem to give you the most value.

Apply the five methods from CCtI:
1. Examplify: Write out examples, look for the pattern
2. Pattern Matching: What is the problem similar to?
3. Simplify & Generalize: Solve a simpler version of the problem, then abstract
   it to solve the larger case.
4. Base Case & Build: Solve the problem for a single element. Think "recursion".
5. Data Structure Brainstorm: Try to apply every data structure you can think of
   until something sticks.

### Apply
1. Begin by conducting a Review.
1. Solve problems or build something
    1. Use a timer to focus.
1. Cap at 30 minutes. If still unsolved, look up the solution, but reschedule as
   it like any other problem.
1. __Q.__ Scheduling: How often should problems be worked? Re-worked?


### Talking to myself

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
studying, can we arrive at a approximately-optimal solution for studying?

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

## How to Measure

### Data Collection
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

# Other Methodologies

## How to Read a Book

### Discover (Inspectional)
1. Discern the _structure_ by reading the key elements
    1. Generate questions
    1. Highlight what _seem to be_ key points
1. Answer key questions
    1. Who is the author?
    1. What are the book's arguments?
    1. What is the evidence that supports these?
    1. What are the book's conclusions?
1.
### Understand (Analytical)
1. Re-read, taking more time.
1. Attempt to answer questions from the Discover phase
    1. *What* is it about?
    2. *How* is the book making its arguments?
    3. Is what it's saying *true*?
    4. *So what?*

In more depth, Adler presents the sub-rules for analytical reading:

1. What is the book about?
    1. Classify the book
    1. Briefly summarize the entirety of the book
    1. Enumerate and connect major parts of the book
    1. Define the problems the author sets out to solve
1. Interpreting the book
    1. "Come to terms" with the author's key words
    1. Locate his argument's propositions
    1. Know his arguments
    1. Decide his level of success in arguing
1. Criticize the book
    1. Complete your outline and interpretation
    1. Stay objective
    1. Support critical judgment with reasoning
        1. Uninformed?
        1. Misinformed?
        1. Illogical?
        1. Incomplete?

### Remember
1. Consolidate your notes about the assumptions, arguments, evidence, and
   conclusions. Sort of like a Feynman, but with more detail.
1. Create a __rehearsal schedule__, using notes that _you've_ determined to be
   key from your readings.
[How to Read a Book, v5.0]: http://pne.people.si.umich.edu/PDF/howtoread.pdf
[tcu.edu summary]: http://faculty.tcu.edu/grant/30643/HOWTOREADABOOK.PDF

## Tim Feriss' DiSSS
Tim Ferriss is a pop culture meta-learner, and present his own manifesto for
"Learning how to learn" in his book, _The 4-Hour Chef_(4HC). Whether he is yet
another salesman of the Good Life or the epitomy of Generation X meta-learning
life hackery I leave to the reader.

The 4HC proposes learning is best accomplished by the identification and
application of high-reward material and studying strategies. The "DiSSS" system
helps readers in reducing an opaque subject into primitives, prioritizing the
value of each component in regards to the reader's goal of understanding the
subject, and arranging the study in order of prerequisites (the final S has to
do with motivation). He also provides the CFE acronym for developing study
programs and aids, emphasizing summarization techniques, providing guidelines
for setting a study routine, and tricks for boosting learning by association.

### Key Words
"Deconstruct" has particular significance to Ferriss, which I interpret to mean
"objective reduction".  Reduction simply meaning "making smaller things out of
bigger things"; in this case, it's the discovery of sub-concepts or techniques
within larger subjects, such as shooting a basketball, or braising a roast.
"Objective" is used here to mean "universal", as opposed to the local nature of
subjectivity. A reduction is objective if it applies universally, and any
thinking person could logically agree on a similar decomposition; note that this
doesn't exclude _different_ decompositions, as long as they are done rationally.

### The Method
DSSS CFE - "DiSSS CaFE"
1. Deconstruction
2. Selection
3. Sequencing
4. Stakes
5. Compression
6. Frequency
7. Encoding


#### Deconstruction
Deconstruction seeks to teach you how to reduce the topic into learnable chunks.
He provides four methods for doing so: Reducing, Interviewing, Reversal, and
Translating. Reducing is confusing, as that's essentially an synonym for
deconstructing, but I believe he uses it here more to mean "What are the
essential parts?" His example being Japanese characters, of which there are
thousands, which reduce into distinct spatial regions called _radicals_, of
which there are 214. We have now found the primitives that make up all
higher-level structures.

> What are the essential parts?

Interviewing has the same goal, but leverages other people to do the work
for you. The downside is that they may have so heavily internalized their elite
knowledge that they no longer understand how to look at it from a bottom-up
perspective; hence, you ask questions to help them dissect their performance.
The idea of Inversion shows up here in the form of questions of "What should I
_not_ do?" There is some work to do on establishing credibility, as if the
interviewee's methods haven't been proven reliable, there's a large risk in
setting up a false expert.

> Who/What else is good? Are *you* good? What shouldn't I do? What should I do?
> In what order should I do that?

Quite frankly, I find his section on "Reversal" to be near-useless in terms of
teaching the concept. See my notes on Inversion under [Final
Thoughts](#final-thoughts).

The bit on Translation boils down to "leverage association by relating it to
things you already know", in his case, your existing learned languages, and
memorize just enough that you can begin to apply. The first principle deserves
more care than I'm going to give it here. The second is more interesting, as it
drives at answering the question "When should I put the book down and start
doing?", with the response, "As soon as you've learnt enough to do something." I
interpret his anecdote/assignment about learning how to taste as a story on
bottom-up learning.

> How much of this do I have to learn before I can do something with it?

#### Selection

What physical practice teaches you the most conceptually for the time
investment? Once you've identified the fundamentals, you need to look at the
surface area covered by fundamental within the master topic itself. It is
essentially the deconstructed fundamentals by descending ROI, and taking from
the start of the list. I'm highly reminded of the model __Efficiency vs
Effectiveness__.

> Are you studying __effectively__ before you maximize __efficiency__?

#### Sequencing

Much of "Sequencing" reads as an additional example to "Deconstruction";
deducing the key parts of the skill. Besides emphasizing the importance of
learning high-level concepts, a couple interesting points arise from reading
between the lines. Ferris' anecdote about learning the female "follow" before
the male "lead" serves as a moral of how the better you understand the problem,
the stronger and swifter your understanding of the solution will come to you.
He also alludes to a phenomena of finding a physical practice that teaches a
broad swath of concepts. For him, focusing on footwork brought along lessons on
the principles of posture, foot position, and weight shifting. While this could
simply be taught in terms of ROI, I sense a stronger tie between a physical,
practiceable action and the multitude of essential concepts it brings together.
For Ferriss, practicing footwork provided an initially simple entry into the
skill that expands endlessly, regardless of training age.

> Choose your practice wisely. Find the balance between complexity of
> intermingled concepts and immediate simplicity of practice. Find your
> "simplex" skill.


#### Stakes
I'm not covering Stakes. It has to do with maintaining motivation by threatening
yourself with monetary. The one interesting memory in me is to that of
Stoicism's negative visualization, but instead of using it to reduce stress and
worry by confronting your fears, you use it to _enhance_ motivation by
visualizing how you'll feel/be if you _don't_ carry through. Hell, maybe you
could even make a checklist for motivation: Bargain a time-limit, negatively
visualize *not* doing what you should, positively visualize doing what you
should...there's probably something else. Anyway, I'm not covering Stakes. Next!

#### Compression
Whew. Are we done? Almost. We've made it through Ferriss' DSSS, skipping one
'S'.

Having found, prioritzed, and ordered your fundamentals, Compression focuses on
finding an effective representation. Ferriss sets a limit of what can fit on
one page, and lays out two kinds of compressions: the top-down, deductive,
"presciptive" one-pager that outlines principles & rules, and the bottom-up,
inductive, "practice" one-pager that provides you examples & implementations.
This is easy to see the value in; if you can't summarize the high-level
principles that underly the topic, you probably don't understand it, and we all
know the value of seeing the right example at the right time.

If you cross-breed my ideas of "write your own book" and "recursive expansion",
you arrive at something similar. I do like Ferriss' split approach between
top-down and bottom-up information. This common theme between both types of
information shows up so often that it deserves to be recognized. I would go one
step further and recommend this 1-pager be rewritten periodically. What you
believe summarizes the topic one week into the field is very different from what
you'll believe after one year of study.

#### Frequency
Frequency starts off with some anecdote about doing a 48-hour crash course on
professional cooking side-by-side with a professional chef. It seemed more
applicable to the Deconstruction/Selection The only moral I
took away from this regarding learning was you can learn a lot from paying a
professional to be your personal tutor for a weekend. Whould've thought?

Then he opens up his more pertinent-section on long-term learning frequency with
another seemingly unrelated anecdote, this time about Y Combinator. Apparently
their start-up timeline looks eerily similar to Ferriss' timeline for
learning. How this distinction "proves" Ferriss' take on learning over time
isn't clear. Laying gripes about _non sequitur_ intro stories aside: Ferriss'
timeline has an initially steep learning curve (that's a __good__ thing, means
rapid knowledge/skill acquisition). This is followed by a drop in performance
due to operator confusion as they attempt to apply their new knowledge. Then
improvement as the confusion resides and skills solidify. The operator stays at
this solidified level for some time, roughly as long as it took from the
beginning of their education to reaching the plateau, and then an inflection
point is reached at their skills take-off towards mastery. Keep in mind, the
Y-axis of this graph is (appears?) total mastery of the skill, although
confidence is also conflated? It's not clear.

A student applies this graph as such: Choose your objective and timeline. Apply
DSSS, and budget your learning blocks to fit your time window. Now, learn. As
you progress through your milestones, the learning graph helps you to expect
setbacks, and look for when things should "start to come together".

It is difficult to judge how much I believe this works, probably because there
is single data point of Tim Ferriss saying "this is what I've noticed." With
such limited evidence, it's anecdtoal at best. Interestingly, the Y Combinator
start-up success chart, whose y-axis we must guess to be something like "How
much things don't suck", seems more believable with its lack of the post-peak
valley, instead settlingly into a nice long grind towards progress. Ferriss'
chart looks possibly correct if you're graphing the human emotional rollarcoster
ride that you want _right now_. Things often start out a lot of fun, and then
the novelty wears off and they start to feel like work. Better is to learn to
enjoy the process, taking enjoyment in the practice of it all, and watch small
continuous gains. You know what it looks like? Compound interest. And _that_
feels right.

I guess this is a long way to say I didn't learn anything about learning from
"Frequency", but it did give me a chance to muse.

#### Encoding
I'm also doing Encoding. It's focused on memorization techniques, which I don't
care about. I'm chasing understanding, not rote memorization.

### Final Thoughts
Interestingly, Ferriss's sample interviews questions from the "Deconstruct"
section re-confirms a guideline I first came across from Charles Munger through
Farnam Street Weekly: "Avoiding stupidity is easier than seeking brilliance."
This is applicable to the counter-arguments against mimicing "classic" top
performers, labeling them as a group of people who succeed despite of their best
efforts, due to innate gifts and beneficial environment. They produce optimal
output from sub-optimal training.

*BEGIN BOOK CRITIQUE* A word on the misuse of "inversion": it is the practice of turning the
_problem_ inside-out, not the approach. Inverting the goal of becoming a better
swimmer transforms it into "how can I _not_ be a _bad_ swimmer"? Inverting
training methodology, as suggested by the Arthur Jones quotes on page 32, can
produce a dangerous loop. For example, inverting popular wisdom on marathon
training equates to running short distances which low frequency. But
_re_-inverting that leads you right back to high-frequency long-distance
training. However, inverting the question of into "What does a bad marathon
runner do, so I don't do those things" consistently produces the same result.
As such, inversion is useful for applying underlying principles and arriving at
clear practices, but the examples given by Ferriss of weight lifting, building a
fire, and others, do more to obscure what the model of Inversion is and how it's
applied than to provide take-home knowledge. *END BOOK CRITIQUE*.

Another point worth mentioning is Ferriss' emphasis on __margin of safety__,
which I've interpreted to be the skill's difficulty. Essentially, it is Ferriss'
justification for focusing on the Low Difficulty, High Reward quadrant of
learning.  Said quad chart would be an interesting exercise in the Discovery
phase of skill learning, and may prove practical before selecting where to
begin.

A lot of Ferriss' writing follows the pattern of Name-Drop, Personal Anecdote
of Wild Success, Now You Do It But I Won't Quite Explain Why It Actually Works
For You To Understand It Yourself. Much of the insight I've gleaned from this
review has come from carefully reading between-the-lines and noting the
hints to other's thoughts and methodologies. With his lack of depth, I can't
properly evaluate his methods, and thus I can't evaluate whether or not these
ways truly work as well as he claims. And maybe that's how he likes it to be.
Paradoxically, I understand now why I always felt incapable of putting Ferriss'
methods into practice: there's not enough here to understand them in the first
place. To give his method a fair judging, they deserve their own book.

## SQ3R:
The SQ3R system is an acronym for the steps Survey, Question, Read, Recite, and
Review. As we'll see, it shares the same basic structure as How to Read a Book.

Surveying is your inspectional reading; you are getting the subject matter to
divulge its structure, and its boundaries. Tackling a chapter on
electromagnetism, you would see the chapter and sections titles form an outline
of key concepts, essential terms are highlighted, and important experiments are
shown in diagrams. Importantly, the limits of the subject matter begin to come
into focus.

> Survey the material to learn its structure and limits.

At the limits of our understanding, we can ask Questions. Student-led question
generation comes up often as a valuable learning technique (that Asia learning
group article, HtRaB in its entirety). Intuitively, it makes sense; we ask
questions to gain information. Perhaps one day we'll be able to visualize
neuron growth be potentiated by the formulation of a question, giving us a more
concrete explanation of the value of having a question. I believe having the
reader generate the question is more useful than being given them is due to
every learner being in a different learning state, with different levels of
fact, understanding, and associated learning to bring to the table. Facts you
take for granted may be beyond me, and thus our questions look different.

Thought experiment: Let's say you and I begin a class on astrophysics together.
We'll assume that our initial questions _will_ differ significantly from each
other's early on in the class, but of course be fundamentally related by the
nature of the generating material being the same (astrophysics). We both love
the subject, and go on to get PhDs in the field. While TA'ing a class on
astrophysics for undergrad studnets in the same position we were at the start of
this paragraph, we try to generate questions to help the students learn. How
different will these questions look now? Will our understanding have
_converged_, and thus our representative questions of it as well? Or does our
initial state leave a persistent impression in our understanding?

> From what you've surveyed, question the material. How would you know this? Why
> would it matter? What does _x_ mean?

Now, we __Read__. Surely we know how to (do this by now)[#how-to-read-a-book].
The emphasis within SQ3R while reading is to seek answers to the questions
from the previous step, your "early research". The SQ3R descriptions I've found
only seem to focus on answering your previous questions, but obviously you go as
deep as you can afford to. This, by the way, equates to the Analytical Reading
of HtRaB.

> Read for understanding, answering your questions as you can.

The step of __Recite__ is a pleasantly unexpected nod of recognition towards the
importance of creating the knowledge in your words. This is something that HtRaB
touches on, but gets lost in its depth and breadth of instruction. Essentially,
you need to word your own answers to the questions you've created. The idea of
saying this out loud comes up repeatedly, and if you've never had a good
conversation with yourself, you _are_ missing out. I expect you'd see similar
performance improvement from writing/re-(re-...)writing your answer until
satisfied. This is the natural place for the use of the Feynman Technique.
Berkely's PQ4R makes a superficial division of the other SQ3R's Recite step into
Recite/Review, but it comes out to the same: Answer the question(s).

> Answer in your own words. Aim to improve on the canonical answer.

We done? Almost, almost. We must __remember__ if anything is to come of our
efforts.  I see advice such as: review your notes cumulatively. Review often,
in small batches. Re-perform the entire process, adding in what you missed the
first time around. The Berkeley article states a student should be spending 2-3
times studying as they do in class, a significant amount of time (given the intent of
this research, I hope to improve drastically on that). No specific advice is
given regarding how _often_, or what that format should look like. But you get
the idea:

> You can't just read it once.

### Final Thoughts
SQ3R is a fine framework for a learning system. I believe it would give a
generic efficiency to the approach of a new topic, especially compared to no
system at all.  It is a bit light on implementation, so it beckons the reader's
experimentation.

It's remarkable how we're uncovering the same pattern: Discover the subject.
Seek understanding. Review to remember. It leads me to believe I'm either a)
approaching the underlying form of how we learn, or b) everyone's reading the
same books I am.  And the latter is a very real concern, so finding some more
unorthodox sources would be beneficial. Maybe this is a Western thing, so
books resources from Eastern or African cultures.

[SQ3R: A Reading Technique]: https://www2.cortland.edu/community/outreach/ace/sq3r-a-reading-technique.dot
[SQ3R Learning/Study System]: http://www.atmo.arizona.edu/students/courselinks/spring99/atmo336-hahmann/336study.html
[How Students Learn -- and How We Can Help Them]: http://socrates.berkeley.edu/~kihlstrm/GSI_2011.htm

# What Can We Learn From Teachers?

## Harvard University's Teaching for Understanding/Project Zero

## Berkely: The [How Students Learn] Project
[How Students Learn]: http://socrates.berkeley.edu/~kihlstrm/GSI_2011.htm

For practice, let's apply SQ3R.

### Survey
Defines learning, different types of learning. Focuses on teacher-led
instruction, as you'd expect from work by Berkeley, a teaching institution.
Significant sections on improving understanding and retention.

### Questions
* What kinds of memory are there?
* How are elaboration and organization different?
* How does memory work?
* How should people be taught?
* What is mastery learning, and is it different from regular learning?
* What are the most effective techniques for understanding? For remembering?
* How much more effective is learning when you incorporate testing?
* Is it more effective to lead a horse to water or help the horse find the water
  on its own, when it comes to understanding & remembering?
* Is their a universally "best" way to learn?
* Why is it we _want_ to learn?

### Review
> we learn best when we learn progressively, building new knowledge on old
> knowledge

* Encoding
    * Elaboration - association with existing knowledge
    * Organization - grouping knowledge together
* Knowledge
    * Procedural
        * Motor
        * Mental
        * Famous by the 10k hour rule
    * Declarative
        * Episodic - events in time
        * Semantic - abstract knowledge

* Grouping items aids in learning (organization). It also decreases interference
  in recall later.

* Multiple-choice tests help in cueing recall, thus easing pain initially. This
  is a huge problem for MOOCs.
* Multiple encodings per memory enhance its ability for recall later; more edges
  to the same node.

> Learning proceeds best when the student already has some background, on which
> he or she can build, and which can provide a framework for generating
> expectations and questions.

* Pre-testing helps set the stage. This is a Catch-22 when you're self-learning,
  unless there was an external repository of questions...I imagine the prompts
  would need to be fairly rich in contextual information. Otherwise, "thin"
  questions coupled with lack of background schema would be difficult to relate
  to.

**Left off at PQ4R**, which is a system that dates back to 1972! Why are these
methodologies not taught more broadly? Why must I seek them out?

We primarily think of learning by experience. Observational learning is when we
leverage other people's experiences to learn from them. We learn by example much
as a child does when it observes its parents, and we learn by precept when we
are taught from experience by proveyors of this knowledge.

> There is no more efficient way for students to learn, I think, than from a
> well-organized course of lectures accompanied by a well-written textbook

Mastery learning progresses a student when sufficient skill is demonstrated,
instead of a timeline. The proctor (teacher) determines course
structure, dividing course content into related modules or chunks, and sets the
progression. The teacher then becomes a passive resource, answering questions
and pointing out mistakes. The student progresses once they've tested highly
enough on a module. See the paper "Good-Bye, Teacher", 1968.

Distributed testing and practice testing stands as the two most productive
learning techniques. What's impressive is the generality of the positive impact
testing has. Testing immediately after study helps, and so does testing a week
after. Testing improves performance even without feedback as to what you got
wrong. Testing improves memory over re-reading. Testing beats
mind(concept)-mappping the material. Interestingly, the effect may be subtle,
too subtle for conscious awareness - the "test" group under-reported the benefit
they'd received from testing compared to the cramming and concept-mapping group.
A moral for self-doubt and objective measures.


> We learn by being tested, or by testing ourselves.

> Testing improves retention, even more than extra study, and this is true even
> when subjects don't get any feedback from the test

Spaced repetition is far more effective than cramming; heard that enough. The
authors estimate that the optimal spacing is "5-10% of the study-test delay"(?).
Interleaved problem types makes _practice_ feel more difficult, but improves
test performance (so hopefully real understanding as well). So mix it up
(interleave). But not too much (Skinner's PSI course modules). The author has a
short rebuttal to complaints against "teaching to test", where he argues that if
the test is good, that's exactly what we want! Curriculums _should_ change to
teach the test; "what gets measured, gets improved".

- "What Works, What Doesn't" Scientific American Mind, Oct, 2013.
- Rohrer & Pashler (2010) - Test effetiveness
- Cepeda et al., 2008 - Spaced repetition


**So what makes a good test?**. The questions should be obviously related to the
material (Face validity). They should be  a representative sampling of the
knowledge body (Content validity). They should correlate with some form of
external performance (empirical validity). And question performance within a
test should correlate to each other (Internal Consistency).

Repeatedly, the notion that "testing is hard" appears and re-appears (and
re-appears, and re-appears). But, I begin to wonder if one's
mastery/understanding is _best_ demonstrated by the ability to generate tests?
It almost seems paradoxical, but I expect its more a progression: A better mind
generates better questions. You learn best by testing, at first taking tests,
and then writing them. It forces you to re-re-re-think the essence of the topic,
trying to tease from it ever-more accurate abstractions and concepts.

Cumulative final exams are probably the best test you can take, due to forcing
students to re-study the entire body of knowledge under one context.

When creating a test, or even a question, make clear the following: What exactly
is it you want the student to do? What is the pedagogical purpose behind the
task? How will you evaluate the quality of the work?

When comparing self-directed discovery learning to direct instruction by a
teacher, the only middle-ground you arrive at is one which is shared
appropriately _between_ the two strategies. Discovery learning promotes skills
of inquisition, peer-learning, lengthens retention, and encourages following
threads that lead in surprising but rewarding directions. However, diret
instruction maximizes efficiency of instruction, provides feedback in the form
of tests and on-the-spot corrections, and provides curated progressions into the
topic. Ultimately, the researchers behind the paper these facts were taken from
recommend alternating, beginning with discovery then following up with
instruction.

This, to me, strongly parallels the findings that pre-testing, and pre-study
question generation (the Q in SQ3R) enhance your study. It also shows up
constantly in HtRaB, having a conversation with the author by interrogating
right through the words on the page. It is an unnatural feeling to stop and ask
questions about something you presumably know little about. This is something I
am eager to learn more about.

> if we monitor and control our learning, we can learn more, better, faster, and
> have it last longer.

- Lee and Anderson (Annual Review of Psychology, 2013)

Meta-cognition about memory goes by the name **metamemory**, and we are bad at
it. Beliefs like cramming and highlighting are effective ways to learn are
proven to be far less useful than things we detest, like steady, deliberate
practice over time and testing ourselves before, during, and after (aargh!).
Metamemory does have a number of interesting aspects for investigating itself:
Encoding, which breaks down into ease-of-learning judgments (how hard will this
be?) and judgments of learning (how well is this going?); Storage, evaluated by
feeling-of-knowing judgements (have you mastered it?); and retrieval, made of
source-monitoring judgments (where did you learn this?) and confidence in
retrieved answers (are you correct?).

- "Factors affecting the self-regulation of learning", Bjork et al. (2013)

I greatly enjoyed learning that there is practically _no_ empirical evidence
backing the notion of different learning styles. The left-brain-right-brain
hyptohesis, the visual/verbal/kinesthetic hypothesis, the Myers-Briggs Type
indicators - all have yet to be supported by science as to whether someone
learns more effectively based off their approach. Only the simplest hypothesis
by David Kolb, his **cycle of learning**, seemed to offer any guidance, and that
argues we all share the _same_ pattern of learning, not individual responses.
For reference sake, here it is: Immediate Concrete Experience, Observation and
Reflection, Theory and Deductive Inferences. We experience something,
we think about it, we make generalizations _ad infinitum_. This is practically
philosophy; actually, this _is_ philosophy: epsitomology. If you see the devil,
tell him Descartes says "Hi"...I will love reading that again, one day.

Kihlstrom finishes the discussion of the "learning styles" school of thought
on a salient note: Even _if_ there was a measurable benefit to tailoring
education plans to individual learning styles, would the cost of rolling out
such a plan _en masse_ overwhelm whatever benefits students would reap?

### Cognitive and Non-Cognitive Factors
We move onto non-cognitive factors of learning; that is, what  happens _around_
teaching/learning.

- P.H. Winne and J.c. Nesbit in "The Psychology of Academic Achievement" (Annual Review of Psychology, 2010)

Students prefer firm deadlines for getting work done; if a final paper is due,
require an outline and draft before to faciliate progress. It is a way of
imposing "best practices" on the work as well. And externally imposed deadlines
are more effective than self-imposed ones; I agree most whole-heartedly. Many a
best-intentioned objective towards my most fervent dreams has gone by, leaving
me enraged at my own apparent lack of self-control. But I am not alone (and
neither are you). Negotiating with oneself in the form of rewards for good
behavior can be effective. Kihlstrom does not say explicitly, but I believe this
is also taken from the Ariely and Wertenbroch (2002) paper.

### Sleep
Not much new information. One fact about slow-wave (Stage NREM) sleep being
especially important regarding memory consolidation.

## Implicit Theories of Learning
Originally, post-behaviorist theories on learning supposed that reward drove
learning. Then we saw that animals learned because they were alive; a monkey
will solve a puzzle because it likes solving puzzles, regardless of the reward
on the other side.

> monkeys love Fruit loops

Why do we want to learn so badly? Epistemic curiousity argues its inborn; Need
for Closure states we hate being fuzzy on the details. Which leads into Dweck's
"Growth Mindest". In short: we constantly develop beliefs about the world
through experience. These beliefs kind-of look like scientific theories, except
light on the science; psychologists call them "implicit theories". One such
common theory we all seem to have, according to Dweck, regards our own
competence. Entity theorists view intelligence as a fixed entity; you got it or
you don't. Incrementalists, our growth mindsetters, view intelligence as a
living, malleable thing; feed it, and it shall grow. Fascinatingly, if you're an
entity theorist, you're primarily motivated to look smart over gaining
knowledge. In the long term, this will make you an obnoxious prick to be around
(my words, not his/hers). Being told "you're smart" can undermine efforts
towards _becoming_ smart(er), and increase avoidance of mistakes (which would
threaten their world-view of being smart!) and increase reliance on that innate
brilliance everyone keeps talking about. Imagine being told you're very strong
while growing up (there's got to be a Twilight Zone about this). And maybe you
_are_ somewhat strong, courtesy of your environment, parents, genetics, and the
hobbies you fell into. But you fail at truly impressive feats of strength, and
those failures _threaten your entire concept of who you are and what you're
capable of_. This, obviously being a bad feeling, negatively reinforces you to
_not_ try again, especially if people are still telling you you're strong. This
goes off into how much of our personal concept of ourselves is formed by
people's reactions to us, and how much that is a good/bad thing. Back to work.

### Intrinsic Motivation

> Monkeys will work for grapes, but they'll also work for poker chips with which
> they can purchase grapes.

This section _really_ talks about the effect of reward upon intrinsic
motivation. Fascinatingly, it shows how incentives can perversely
_de_-incentivize the behavior you're trying to increase, at least over the long
run. Rewarding children for coloring, an act of play, leads to reductions in how
much they do it! Giving money in exchange for performance creates performance
proportional to what you pay someone - no more, no less. But, and this is an
important 'but', only if the reward is _expected_. Surprising someone with a
reward _does_ reinforce behavior. As to why, it's believed that the expected
reward comes off as controlling, that someone is trying to blatantly get you
to do something.  On the other hand, an informational reward, i.e. feedback as
to how you did, tends to maintain or increase motivation. So feedback, delivered
neutrally, is motivating, as is the occasional postive second-order effect (a
reward).

These points remind me of research on the Flow state. Some of the key pillars of
Flow are having the right amount of challenge and fast feedback. If you're doing
well, seeing your performance go up is reinforcing; if you're doing worse, the
desire to improve is motivating. You can't lose! Unless, apparently, someone
starts paying you to do it. This speaks to the oft-heard anecdote that once
your hobby becomes your job, it's no longer as fun as it used to be.

Harackiewicz also, thankfully, tackled what we all feel but I've been dying to
see empiricized (word?): how much does knowing _why_ you're learning something
affect how _well_ you learn it? Said another way, does the relevancy of
information affect your ability to learn? Yes, yes it does. But first, an
important fact to internalize - you lose interest over time.  Even the things
you really, really like. I already knew this, you already knew this, but maybe
the science can make this hit home. There _is_ good news, and its pretty damn
good - you can stop the decline. Students who tested well on the midterm saw
their interest level out at the pretty-high mark (4.5 out of 6). Even better, students who
wrote on _why_ what they were learning was relevant to their lives, e.g. why
they should care about what they're learning, _also maintained the same level of
interest_ (4.5/6)!. By contrast, students who didn't do so hot on the midterm
and didn't reflect on the benefits of the course continued to lose interest for
the rest of the semester. This was a one-time essay, only a couple paragraphs,
halfway through a semester (so six or eight weeks in).

The takeaway is __feeling what you're learning is relevant matters__, no matter
how obvious it may seem. Many Achieve Your Dreams programs have you do some kind
of goal-setting at the start of your endeavours. From this research, more
important are the reasons behind why you're setting the goal in the first place.
Personally, concrete goals demotivate me. I'll probably overestimate what I can
do, then feel bad when I can't hit it. If you can't _directly_ influence the
metric, it will just drive you crazy. Track it, by all means, and track the
second/third/deca-order behaviors that you think will lead to changing that
primary metric; a little bit of statistics will give you correlation measures,
if you're having a hard time figuring out what's working. But if you stop
caring at all, there's little hope of getting what you want.

## What Are We Trying to Teach?
Here Kihlstrom speaks, almost as an aside, setting Empiricism down and picking
up the hat of Intuited Wisdom, on the underlying moral principles (he borrows
the term "intellectual virtues") of learning. The list includes Love of Truth,
Perseverance, Humility, Empathy. It resonates. Anyone who truly sets down this
path of self-learning _must_ learn how to decide what is true for themselves,
understand how truth is relative, know their current limits (how else would you
know not just what to learn, but whether or not you _have_ learned?), how to
persist in the face of daunting progressions, the ability to hold objectively
(to the best of our ability) multiple arguments at once, and so, so much more.
You __can not__ teach these directly, but I believe you inspire a __want__ for
these virtues. Of course, inspiration requires a belief it can be done, and what
better a way than to make yourself the living example others need to believe in?

## What is to be Done?
Kihlstrom kindly summarizes himself:

1. Distribute study. Each concept needs to be hit at least twice, separated
   by weeks.
1. Use examples _and_ problems; shifting weight from the former to the latter.
1. Illustrate where you can.
1. Back the abstract with the concrete. Your top-down must connect to your
   bottom-up.
1. Testing promotes learning. I'll strengthen this statement: _questioning_ is
   effective learning.
1. Time management matters. Mastery is difficult to measure in the moment.
   Topics need to be revisited, a progression through the material needs to be
   presented, testing and projects need to be carefully interspersed if  we're
   to maximize the return on our expended time.
1. Ask deep questions. Rote memorization, I've come to view, is a means to the
   end. We memorize for the purpose of _doing_ something with it. Even
   professional memorizers who specialize in speed-memorizing the order of decks
   of cards or the digits of pi do so because they view themselves as pushing
   the limits of human memory, not because that particular card order was
   meaningful to them.
1. Know why you're learning what you're learning. Learning for the sake of
   learning is fine to start with. It's fun. Monkeys may love Fruit Loops, but
   they also just like solving puzzles. But I bet a monkey put in a cage to
   solve a new puzzle, day after day _ad nauseum_, would start to lose interest,
   if not outright depression. You do things for a reason, however they may
   change. Keep the dream alive; learn consciously.

- "25 Principles of Learning", http://home.umltta.org/home/theories/25p
- "Studying Practice Guide", https://ies.ed.gov/ncee/wwc/PracticeGuide/1

## Resources

[Working Group and Speaker Series]: http://gsi.berkeley.edu/programs-services/hsl-project/hsl-speakers/
[Active Learning AND Testing]: http://gsi.berkeley.edu/programs-services/hsl-project/hsl-speakers/shimamura/
[Learning to Think Mathematically]: http://gsi.berkeley.edu/programs-services/hsl-project/hsl-speakers/schoenfeld/

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

[^1]: Ref needed.
[grounding]: to give (something abstract) a firm theoretical or practical basis
[Quora: Forays into AI]: http://www.quora.com/How-do-I-get-started-in-Artificial-Intelligence
[Reductionism Considered Harmful]: http://syntience.com/rch.pdf
