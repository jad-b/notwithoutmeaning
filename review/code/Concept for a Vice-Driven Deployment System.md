+++
categories = ["programming"]
date = "2016-07-29T10:43:26-04:00"
tags = ["deployment"]
title = "Vice Driven Deployment"

+++

Here me out: we could totally write a deployment service that leveraged each of the seven cardinal sins.
Here's my take on it:

<!--more-->

* Pride - Deploys code
* Envy - Manages config
* Wrath - Runs functional/smoke tests
* Lust - External service integration. 'Cause it's, like, promiscuous.
* Sloth - Deployment automation. Depends on pride.
* Greed - Stream processing & data storage.
* Gluttony - Data visualization; "feast your eyes". Feeds off of greed.

Throw this behind a CLI & chat bot, and ta-da, you're a `vice pride deploy
<project>` away from releasing code.

In a little more detail:

Let's with deploy|pride. This tool needs to take code artifacts from _X_ and deploy them onto
system _Y_. Deploy is a simplified interface for triggering your configuration management, like
Ansible or Chef, or your container management, like Docker Swarm or Kubernetes. It restricts the API
to just deployment capabilities, so starting & stopping services. It concerns itself with applying
configuration to one of the aforementioned tools in a reliable manner.

But a deploy isn't enough; you need to verify it worked. That's where "verify|wrath" is used. Wrath
runs a set of acceptance tests against your system, and its output can be used as feedback to the
deploy. It can also be scheduled to run _all_ the time, effectively mimicing customer traffic. Bonus
features: replayability of transaction sequences for debugging and probabilistic traffic generation.

Deploying and testing generates useful data, data that can be used to audit your infrastructure,
monitor changes, and trigger events. That's why it all has to get fed into "dataproc|greed", the
stream processing & storage backend. Essentially, dataproc takes events as input, and either 1)
transforms them for storage into whatever storage backends there are, or 2) triggers an integration.
In fact, 1) could be viewed as a special case of 2. The use of events as the system primitive
provides an umbrella abstraction for both of these, which make it so powerful, but more on that
later.
    With great systems like Kafka for this, it wouldn't make a lot of sense to try to beat it at
its own game. What dataproc can offer is a `vice`-tuned processing layer either before or after it
hits a system like Kafka. Or maybe you don't want to run kafka just to use `vice`; a simple built-in
model could suffice.

As far as "trigger an integration", that falls under "lust|notify", and the possibilities are
endless. Certainly you'll want notifications for chat services, maybe emails, possibly updating
issues in your project management software of choice. But you could trigger an AWS Lambda function,
or kick off a data analysis job, or a fresh slew of "wrath" tests, or a custom binary/script - we
can only guess as to the needs of the future. "lust" would provide at most a framework, and maybe as
little as an interface for hooking into `vice`.

With great data, comes the need for pretty pictures. It's a poor system that gives you little
insight into how things are running. This piece gets delivered by `gluttony|dataviz`. Enough said?
It's a dashboard. Enough said.

"config|envy" sits in interesting contrast to "dataproc|greed"; if "dataproc" is for data
_generated_ by the system, "config" is for data _given_ to the system by the users. After all, you
have to store configuration and secrets somewhere. "config" would be responsible for isolating and
retrieving data in the correct format.

Between retrieving configuration, code artifacts, executing configuration software, and running
verification tests, every project is likely to become its own snowflake. "auto|sloth" speaks to the
need to script and automate your deployments. Behind the scenes, all of those actions can be viewed
as a graph, where each vertice represents an action, and the edges represent the flow of data.

Let's talk for a minute about events. At a minimum, information sent to "dataproc" needs to be
encoded as messages/event notifications. However, I'm not convinved the entire system must be
event-driven. For one, I don't believe each of the above seven services would be a running service.
In the case of I am open to the possibility of using them throughout, and perhaps experience will
show this to be best.

### But why?/This is silly.
Deploying and operationalizing code is often harder than writing the code in the first place. And it
when it comes to monitoring the state of your infrastructure, it feels like you're trying to
interrogate a child you've entrusted all of your production configuration too: "What are the
versions running for this service?" met by "I want candy! Also, that'll be a for-loop followed by
grep piped to sed piped to cut..." What the hell? The information's there! But you either never made
it machine-consumable, or you never taught the machine how to consume it.

### Postface.
Now, I'm going to be partial to this because I'm in love with the cleverness of
my own ideas.  You'd have to make it good, and you'd have to make it
future-proof. This is how I'd do it:

Write the interface first. If you've mastered the deploy of _any_ piece of
reasonably complex software (a.k.a. greater than just `scp`-ing files to a
box), you know what you want from a deployment assistant. Code up that
interface, and stub out the functionality as you go. I'd want something like:

    # Retrieve configuration for the deploy; could subsume within the next step
    vice envy <options...> <project>
    # Deploy our project!
    vice pride deploy <project>
    # Run our post-release smoke tests
    vice wrath <project> <options...>
    # Visualize how our deploy went
    vice gluttony report <project>
    # See how _all_ our projects are looking
    vice gluttony report <saved dashboard name>
    # Drop a message in Slack about the release
    vice lust project -m "Everything's looking good, guys"
    # Backup our deploy data into S3
    vice greed backup <options...> <S3 URL>

Which means I'd need a way of making `vice` (I guess the collective name of
this tool is `vice`? Is now.) aware of `<project>`. Communication is either
push- or pull-based, so it's either that `vice` know's how to find projects, or
projects register themselves with `vice`. But, you know what? _That_ matters
far less than what I want my interaction with `vice` to be like. Both models
would work, just like Chef and Ansible work. If one's better than the other,
and we start with the lesser, it'll be our good engineering practices of
writing loosely-coupled, modular code that saves us headaches during the refactor.

Which brings me to modularity. If you want code to survive over time, it has to
be modular, which in this context means we need to be able to write new
backends for emerging technologies that satisfy the same functional interfaces.
Was that a mouthful? Try this: We want `vice` to be compatible with new tech.
Not in an auto-magical "`vice` will work with _any database ever_" way, but
rather we know what data storage requirements we'll have for `greed`, which
means we can write adapters to hide whether we're storing it in Postgresql,
DynamoDB, a file system, or HDFS.

Maybe we won't be able to completely satisfy our DataStorer interface with each
backend - that's okay! Do a `raise NotImplemented`, and allow your calling code
to deal with partial interfaces in non-critical functionality. Obviously you
need to read & write data, but maybe you can't provide the same level of
searching you'd like across all backends. Okay. Life is a moving target. Choose
your trade-offs, and above all stay flexible through modular code.
