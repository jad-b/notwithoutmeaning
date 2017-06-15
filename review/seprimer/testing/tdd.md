+++
categories = ["software engineering primer"]
date = "2017-01-09T10:34:58-05:00"
tags = ["testing"]
title = "Test-Driven Development"
+++

# Key Insights
* 70/20/10% split of unit/integration/system tests
* The scope/level of your tests should match the size of your questions about
  the work to be done.
* Behavior is easier to test than exectuion. Use black-box testing until you
  can't, then switch to white-box.


# Definitions
Testing
: An investigation conducted to provide stakeholders with information about the
quality of the product or service under test - [Wikipedia](https://en.wikipedia.org/wiki/Software_testing)

System Testing
:


## Your Level is Your Scope
Here's a picture:
![Google Testing Pyramid][Test Pyramid]

[Test Pyramid]:
    https://2.bp.blogspot.com/-YTzv_O4TnkA/VTgexlumP1I/AAAAAAAAAJ8/57-rnwyvP6g/s1600/image02.png "Unit:Integration:System in a 7:2:1 ratio"

## Unit Testing

## The Process
When writing code in a TDD fashion, you test outside-in, first identifying the
_scope_ of the work to be done, writing a test at that level, then repeating
recursively until you've isolated a Smallest Unit of Work[2]. Progress is then
made by popping the stack, fixing tests low-to-high until everything's passing.


This also makes TDD a fantastic design process when you don't know where to
start. Simply write a test that encapsulates the highest-level of interaction
you have questions about. If this is for an HTTP API, write end-to-end tests as
the client. If you are uncertain about the DB interactions, write integration
tests between API request handlers and the DB. If the UI gives you trouble,
well, that sucks - UI testing is the worst. But tools for such things exist.

A note on discipline

### Mocking
A brief tour of the different [levels of mocking]:

* A _Dummy_ satisfies an interface, but is("should") never be used in the tested
  code path.
* A _Stub_ extends the Dummy to offer a default, unchanging behavior.
* A _Spy_ extends a Stub to become aware of its own execution; recording its own
  invocations, for instance. It can introspect what it's doing, but it doesn't
  know why - this makes more sense when compared again...
* A _Mock_ extends the Spy to become aware of the test's _purpose_.
  "Mocks know what they are testing"[^1]. They have this knowledge by their
  inclusion of built-in assertions.
* A _Fake_ is different from the rest. A Fake is an actual implementation of
  real business logic. It has real, programmable behavior beyond that of a
  Stub's naive implementation. A good Fake needs its own tests.

[levels of mocking]: https://8thlight.com/blog/uncle-bob/2014/05/14/TheLittleMocker.html
[Mocks Aren't Stubs]: https://martinfowler.com/articles/mocksArentStubs.html
[Monitoring-driven Development]: https://news.ycombinator.com/item?id=9137021

[1]: https://8thlight.com/blog/uncle-bob/2014/05/14/TheLittleMocker.html
[2]: You may see this again.
[Martin Fowler's Test Pyramid]: https://martinfowler.com/bliki/TestPyramid.html
[Just Say no to More End-to-End Tests]:
    https://testing.googleblog.com/2015/04/just-say-no-to-more-end-to-end-tests.html
[Martin Fowler's Testing Microservices]:
    https://martinfowler.com/articles/microservice-testing/
