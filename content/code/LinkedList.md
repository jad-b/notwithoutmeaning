+++
categories = ["code"]
date = "2017-05-31T09:25:35-04:00"
tags = ["programming", "data structures"]
title = "The Linked List"
+++
A linked-list is a _linked_ (as opposed to contiguous), _recursive_ data structure.
Values are stored within nodes chained together by references to the next (and
previous, in the case of doubly-linked lists) node. It can be used to
efficiently implement *Stacks*, *Queues*, and *Bags*.

<!--more-->

Time Cmpx|Average|Worst
---------|-------|-------
Access   |`$O(n)`|`$O(n)`
Search   |`$O(n)`|`$O(n)`
Insertion|`$O(1)`|`$O(1)`
Deletion |`$O(1)`|`$O(1)`

It is suitable for situations where fast insertions/deletions are required, and
most access occurs at the head or tail of the list. Also if there is no way to
have _a priori_ knowledge as to the absolute structure of the underlying data,
so you must instead rely on local knowledge, such as ndoes within a graph.

Alternatively: A linked-list is a very boring graph, where the only edge
relation is that of `next` (or `precedes`, as in "Node A _precedes_ Node B").

## Layout & Behaviors
We will assume our list is made of Nodes that wrap actual data values, with
at least a pointer to the next Node in the list; doubly-linked lists also have a
pointer to the previous node.

The elements are assumed to be comparableA on equality and orderable by their
__keys__, which could be explicit attributes _or_ derivable from the Node's
data. Think of how many object-oriented languages will have some form of an
`equals` method defined on all objects, like Python's `__eq__` or Java's
`equals`.

A sample doubly-linked list implementation might look like such (in no
particular language):
```
struct Node
    # Keys must be comparable for Equality, and Orderable if sorting or
    # minimum() is required
    key
    # Actual data held by the node.
    data
    next::Node
    prev::Node
end

struct List
    head::Node
    tail::Node
end
```

### Invariants
* `last.next == nil`
* `head.prev == nil`
* If `len(List) == 0`, then `head == nil && tail == nil`
* Only two pointers exist to a Node in a doubly-linked list, unless sub-lists
  are being "shared".


[Edm08] lists
* `search(L, k)`: Return a pointer to the first element in `L` that contains the key `k`.
* `insert(L, x)`: Given an element `x`, add it to the head of the list. If `L`
  is sorted, it must support inserting at the head, the tail, or in the middle
  of the list.
* `delete(L, x)`: Given an element `x`, remove it from the list.

So far, there is not much difference from the Dictionary ADT. [CLRS09] and
[Ski12] remind us that Lists may also be expected to support operations that
require order. Personally, I think of these as _linearizing_ operations, in that
they impose/require a linear structure.

* `minimum(L)`: Find smallest-keyed element in L
* `maximum(L)`: Find the largest-keyed element in L.
* `successor(L,x)`: Assuming `L` is totally-ordered, return the next element
  after `x`.
* `predecessor(L,x)`: Assuming `L`  is totally ordered, return the next
  element smaller than `x`.

Again, explicit keys may not be necessary if the key can be derived from the
object. On the surface, this may seem to render an operation like `search`
useless, as it sounds like you'd be supplying the object you're looking for in
order to retrieve it from the list, but in many cases, not all fields of the
stored data may be tied to its uniqueness or ordering. For instance, often only
or two fields get used as a primarry key in database tables. So you could search
using a skeleton object containing only enough information to compare upon,
getting the full object in return.

## Notes
The use of sentinel, or dummy records, can simplify `null`-handling logic
([Man89], [CLRS09]). [CLRS09] offers an implementation where there `nil` is
replaced by a single dummy record that both `head.prev` and `tail.next` always
point to, creating a circularly-linked list joined by nothingness. Poetic.

If lookups tend to group temporally (occur multiple times in close succession on
the same node), an optimization may be used: Every `get(L,x)` moves the
retrieved Node to the head of the list. Since this implies the list isn't
sorted, you might as well insert at the head of the list too. [Ski12] refers to
this as a "self-organizing list".

Linked lists sacrifice some space to storing pointers. If `size(data) >>
size(pointer)`, then this is unlikely to be a concern. However, when dealing
with smaller values like ints or floats, you could easily double the total
storage size. [Ski12].

If there's no need to maintain a sorted order, insert wherever's easiest.
Probably the head. [Ski12].

The "Runner" technique: Iterating two (or more, conceivably) pointers with
different offsets through a list at the same time, , can help in processing a
list in odd ways [CTCI16]. For instance, turning
`$ n_1 \rightarrow n_2 \rightarrow  \ldots \rightarrow n_{n-1} \rightarrow n_n $` into
`$ n_1 \rightarrow n_{\frac{n}{2}} \rightarrow \ldots \rightarrow n_{\frac{n}{2}-1} \rightarrow n_n $` can be
accomplished by running two pointers through a list, one moving one node per
iteration and the other moving two nodes per iteration, until the second pointer
reaches the end. At this point, the first pointer is halfway through (assuming
the list is of even size), and you can weave the nodes back-and-forth through
one more pass.

## Problems
Solid problems for practicing your linked-list fu:

* [CLRS09] 10.2-7, 10.2-8

## References
For some reason, Hugo/BlackFriday is _not_ turning these into hyperlink
references. Oh well.

[CLRS09]: Cormen, Thomas H.; Leiserson, Charles E.; Rivest, Ronald L.; Stein,
    Clifford (2009) [1990]. Introduction to Algorithms (3rd ed.). MIT Press and
    McGraw-Hill. ISBN 0-262-03384-4
[Man89]: Udi Manber's Algo book
[Edm08]: something something algorithms
[Ski12]: Skiena's Algorithms
