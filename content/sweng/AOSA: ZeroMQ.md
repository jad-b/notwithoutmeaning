+++
date = "2015-10-29"
draft = true
title = "AOSA - ZeroMQ"
categories = ["programming"]
tags = ["networking", "distributed systems", "notes"]
+++

# [ZeroMQ](http://www.aosabook.org/en/zeromq.html)

ZeroMQ is a messaging system. It was born for speed-optimized messaging in stock trading.

Its development cycle looked like this, per year: architecture and how to benchmark, writing the code, and improving usability and its API.

After trying to make the AMQP protocol fit there needs for years, they realized the client-server model for messaging was broken. Messaging servers introduce an additional message hop, introduce single-point of entry bottlenecks, and fragment across organizational boundaries. This is "smart server, dumb client".

The ZeroMQ team decided to go with a library, creating a "smart endpoint, dumb network" topology. They claim it to be faster and more flexible, as you get away from the hub-and-spoke client-server model. This is very exciting, as it suggests an alternative to the client-server model seen in so many, many systems.

When acting as a library, you must avoid global state. Multiple uses of the same library in a process lead to undefined behaviour, which is right out. ZeroMQ makes you define a _context_ per library user, which is unique to the library, and can be passed about within the program as needed.

They started off with two primary benchmarking metrics: latency and throughput. Latency is the number of messages sent per time (messages/seconds), while throughput is the amount of time taken to send all the messages (seconds/messages).

They found that these two metrics are _not_ simple inverses of each other. Latency requires both the start and end point of the system to calculate; there is no latency from the sender or receiver alone. Also, each message has its _own_ latency. When you talk about the latency of a stream of messages, you're talking about their average, not an intrinsic value.

Throughput has a flipped set of characteristics. You can only measure throughput at a single point: it took sender A this long to send these messages. Also, you can only measure throughput as a group; there is _no_ such thing as the throughput of one message. It'd be instantaneous!

Their moral to this part of the story is to really come to terms with what it is you're trying to solve. Had they not questioned their basic assumptions as to how to measure their system, they could've built something that looked good on paper and utterly failed in real-life, or built way more complexity into their system. It's easy to see how complexity could've arisen by not understanding latency can only be measure between multiple nodes, while throughput can only be measured at a single point.

The ZeroMQ team took a similar approach to optimizing their critical path, being the highest-calling frequency code in the codebase. They determined that memory allocations for actual messages were slow; so they implemented a reusable message buffer. Under steady conditions, this dropped their memory allocations to almost zero. Elsewhere, they don't bother to optimize memory usage at all, such as during string modifications.


### Allocating Memory

Copying small messages is cheap; copying big messages is expensive. Copying here means copying memory into preallocated memory chunks. Large messages are better allocated once, and then to have a pointer passed around.

The ZeroMQ library has an opaque handle to all messages. Small messages are included directly, and thus get copied as they get passed around. Large messages are represented by a pointer, pointing back to the once-allocated memory block.

Their takeaway: Sometimes sub-problems require unique solutions. What's nice is that the end-user doesn't see the unique handling. To them, it's still the same `message.handle` field in the struct.

### Batching

Biggest takeaway: Batch at the top-most level, and only batch when you're outstripping your medium's (TCP connection, what-have-you) connection.

If you're under-capacity, send when you can. Once you're at sending capacity, move the batching/queuing logic away from the NIC, system kernel-level algorithms.
You're better off smartly queueing at the application-level, and then batching messages as you can.

## Architecture
![ZeroMQ Architecture Diagram](http://www.aosabook.org/images/zeromq/aosa9.png)

User interacts with the ZeroMQ API via a `socket`.
ZeroMQ runs multiple worker threads to handle the async aspects of communication.

Bottom-up self-pruning tree: You can only close a sub-tree of the ZeroMQ object tree if all child nodes have closed. This ensures all messages are sent.

Session/Engine: Sessions deal with 0MQ socket interactions, but you have an engine per type of connection (TCP, IPC, PGM, WebSocket, SCTP, ...).
Each session has an in & out pipe for passing messages from/to the Socket (like two Go channels).

```go
type Message struct {...}

type Listener struct {
	session Session
	engine Engine
}

type Engine interface {
    func Send(msg *Message) error
    func Recv(msg *Message) error
}

type Session struct {
	engine *Engine
	in chan *Message
	out chan *Message
}

type Context struct {
    // Holds global state
}
```

### Summary
Users interact with a Socket object. The Socket object creates a listener for
managing connections. Socket-to-Connection messaging is handled with two pipes,
while Connection-to-Network is handled by an Engine. This nicely decouples the
client-side interface (Session) from the implementation (Engine instance).

### Concurrency Model

ZeroMQ needed to take advantage of the multi-core CPUs. Traditional
multi-threading can be even slower than single-threaded applications, due to
context switching and blocking.

The author's went with an Actor model; they go so far as to say it's the _only_
option for high performant concurrent systems. Some characteristics of this
model include:

* Event-driven objects
* Scheduler required <--Is this like Python's Async loop?
* Objects become state machines - not sure what this means. Is it anything more
  than associating enumerted states with objects?

The most surprising complexity came from the shutdown process. They recommended
tackling that early on, and ideally using a tool such as ZeroMQ or Erlang to
natively handle that difficulty.

### Lock-Free Algorithms

Before we get to locking algorithms, it's important what the ZeroMQ team
avoided unnecessary locking, and that's by ensuring a 1:1 writer:reader per
queue. The writer never has to contend for write access to the queue, and the
reader never fights for read-access. It actually ends up looking at lot like
NSQ's topic->channel model, except I don't think writer's publish to _every_
reader, just the target queue.

Lock-free algorithms ditch kernel-level sync primitives, like semaphores,
mutexes, etc, in favor of hardware-level locking operations, like an atomic
integer compare-and-swap in the CPU. There's still locking, it's just faster.

However, it can still not be fast enough. Locking on every potential message
didn't fit the ZeroMQ data model; why lock ten times for ten pieces of a single
packet, when the data only made sense in its entirety? They got around this by
batching the messages before writing/reading to/from the queue. It was
implemented by a pre-write and pre-read section of the queue to which only the
writer or reader had access to.


### The API

In its first life, ZeroMQ's API exposed an attempt at forcing AMQP concepts on
a decentralized messaging system. It came from a whitepaper, and it was thought
of us complex messaging software for use by big banks.

When the authors decided to rewrite the API to mimic the FreeBSD Sockets API,
adoption took off. A few important lessons were learned here:

1. The interface, whether it be the GUI, CLI, or library API, determines more
   than anything the success of failure of the project.
1. By mimicing a known interface, it made integrating with exisitng systems
   simple.
1. By using well-known, we leverage people's exisiting knowledge, greatly
   lowering the learning curve.
1. By using well-vetted tools, we benefit from the design decisions made by
   those author's, whether _we're aware of them or not!_

The FreeBSD Sockets API had been in use for three decades at that point. The
numerous attempts at replacing it had gone to prove its sound foundations.

### Messaging Patterns

Messaging patterns in a sense of pub/sub, request/reply, parallel pipelines.

ZeroMQ opted for a two-fold approach. First, abstract the general problem into
an interface layer. Second, provide multiple implementations of that layer,
which, critically, _have no intersection of interactions with one another_.
They give the example of Internet protocols: You have the IP network layer as
your generic interface layer, and then you specific implementations like TCP,
UDP, DCCP, SCTP providing tightly-defined solutions.

By not allowing the implementations to interact, you provide both
backward-compatibility and future flexibility. If you wished to add a new
network layer protocol, call it JDB, then you can do so without breaking TCP,
UDP, etc.

The alternative they contrast this model to is a monolith, specifically AMQP.
It provides everything to everyone, with complete configurability. However,
this forces you to have a full working comphrehension of the available options
right off the start. If you were debating between network protocols, you could
instead figure out which fits your use-case (persistent acknowledged
connections), select the right one (TCP), and only have to know about TCP.
