+++
categories = ["software engineering primer"]
date = "2016-12-20T11:18:47-05:00"
tags = ["software engineering"]
title = "Versioning"

+++
# Versioning

## Key Points
* Versions provide for human-readable ordering.
* Checksums provide _equality_-operations.
* Semantic Versioning is a great place to start. Use prerelease and build
  information to customize as to your team's own practices.


## Versions & Checksums
All of the Continuous Whatevers we're about to address is enabled by versioning,
and for a simple reason: Versioning provides _orderable_ definition of state.
Without it, you simply _can not_ efficiently reason changes to a codebase. And
if you don't know _what_ was, is, and will be running, how could you possibly
understand what's going on in your codebase?

A related topic is __checksums__. A checksum is a hash of the contents of
file(s) that gives you an absolute reference point; if _anything_ changes, the
checksum changes. This makes them fantastic for asking "are these two things the
same?", but gives you no information regarding which came first. You could
extend a checksum with an auto-incrementing integer, providing a notion of
sequence, but your VCS is already doing this for you.

I'll posit that versions should be _human_-readable, for a simple reason: a
person is needed for input, and a human consumes the output.
The information conveyed by a semantic version regarding major, minor, or patch-level
changes must be provided by a human[^1], and the output is a version
that _should_ influence a human as to how code is deployed. Remember: automation
is doing what a human said to do, given certain input.

## How to version
Semantic Versioning has become a popular standard for versioning across
open-source projects. It's intuitive, it supplies a standard set of meanings,
and is sufficiently extendable to generalize across different product's use
cases. As such, it's the basis of what I'll propose here.

Given a version such as `Major.Minor.Patch`, it breaks down to:

* `Major`: API-breaking changes.
* `Minor`: New functionality.
* `Patch`: Bug fixes.

`Patch` < `Minor` < `Major`, as far as ordering goes. If you bump the version by
`Major`, you zero out `Minor` and `Patch`; bump by a `Minor`, zero just `Patch`.
Simple. You start with `0.1.0` as your first commit, and go to 1.0.0 when
you're used by customers in production, your API has stabilized, or you already
have concerns about backwards compatbility.

### Extending the Version for Stages of Development
Few of us write code on production machines that live-reload the daemon every
time you hit save. We can consider any and all verifications and
validations[^2] as "stages" in a code change. With that rough definition, we can
easily imagine the following checks in committing a change to a web server:

1. Code builds, unit tests and static code analysis pass.
1. Functional tests pass against the server
1. Code deploys to a test environment & acceptance tests pass
1. Code deploys to a staging environment & acceptance tests pass
1. Code deploys to production & acceptance tests pass

And each stage can itself be composed of stages. Take the first step of building
code; it could go across multiple components, libraries, and even languages.
Unit tests exist for each component, and could have certain criteria for
coverage.  Static code analysis tooling could be anything from "best practice"
checks to dead code finders to static type checkers to AST optimizers to
what-have-you.

Point is, you may want to have your version indicate _where_ it is in this
gauntlet of quality control. Fortunately, SemVer provides for this through the
use of a `-` followed by any number of `.`-separated identifiers: `-alpha`,
`-dev3.rc1`, `a1.b2.c3`, etc. Let's say your team has three significantly
meaningful stages in your CI pipeline: I Changed Something (Local), Worked On My
Box (commit), Works Against Other People's Code (Integration), Works Against
Production (Staging). Let's assume the last tagged version was 1.2.3, and we
have a `minor` change worth of changes queued up. We could denote their
successful passage using extensions such as:

* Local:  1.3.0-local3+abc123 (Three commits past 1.2.3, read on for an
  explanation of the `+abc123`)
* Commit:  1.3.0-dev3
* Integration: 1.3.0-int3
* Staging: 1.3.0-stage3
* Production: 1.3.0

Note that we immediately go to `1.3.0`. Since only the `master` branch is tested
through our deployments, the pre-release modifiers uniquely identify which point
in `master`'s history we're talking about.

Since everyone's environments and practices will be different, you __must__
evaluate the important stages of your own team's development, and create your
own version extensions. Discuss it as a team, as ambiguity in a version defeats
its purpose.

What about the `+abc123`? That's a __build identifier__. When we're working
locally, your three commits past 1.2.3 will look different than my three
commits past 1.2.3. We can differentiate between the two using the build
information; in this, a selection of git's SHA1 commit hash works well. When we
commit to `master`, our work is forced to become ordered, and we no longer have
a version conflict. Build identifiers are useful for differentiating on
operations _outside_ of the code; repeated builds on your CI server come to
mind, perhaps during debugging or troubleshooting dependent services.

## Versioning and Test-Driven Development: A Good Match
We know what a version should _mean_, and how its pieces compose to convey that
meaning. But real life is messy, and exactly _when_ a version-worthy change goes
into effect can be messy. I propose a simple test that enforces good habits: A
change goes into effect when its corresponding test(s) passes. Simple, clear,
and meaningful.

## Putting it into practice
Write your code. When you go to commit your work into git, include metadata
within the commit message indicating what the work is for (work ticket number,
associated project ID, whatever). When the flagship test for your
feature-change/bug-fix passes, you cut your version. Even better, you include a
machine-readable directive within your commit message that tells your
auto-versioning function/build step/CI job to version _for_ you.

## Resources
* [SemVer](https://semver.org)
* A SemVer-compatible SemVer enabler: [setuptools_scm](https://github.com/pypa/setuptools_scm)

[^1]: As of today.
[^2]: Yep, those are two different things:
    https://en.wikipedia.org/wiki/Software_verification_and_validation
