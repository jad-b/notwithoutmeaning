+++
categories = ["code"]
date = "2017-05-31T09:25:35-04:00"
tags = ["programming", "data structures", "interview"]
title = "LinkedList"
draft = "true"
+++
# The Linked List

|Time Cmpx|Average|Worst  |
|=========|=======|=======|
|Access   |`$O(n)`|`$O(n)`|
|Search   |`$O(n)`|`$O(n)`|
|Insertion|`$O(1)`|`$O(1)`|
|Deletion |`$O(1)`|`$O(1)`|

A linked-list is a _linked_ (as opposed to contiguous) data structure, chained
together by the use of references within each node that point to the next (and
previous, in the case of doubly-linked lists) element.

It is suitable for situations where fast insertions/deletions are required, and
most access occurs at the head or tail of the list. Also if there is no way to
have _a priori_ knowledge as to the absolute structure of the underlying data,
so you must instead rely on local knowledge, such as ndoes within a graph.

Alternatively: A linked-list is a very boring graph, where the only edge
relation is that of `next` (or `precedes`, as in "Node A _precedes_ Node B").

## Behaviors
We will assume our list is made of Nodes that wrap actual data values, with
attributes `elem`, `next`, and `prev`. The elements are assumed to be comparable
on equality and orderable by their keys.

* `search(L, k)`: Return a pointer to the first element in `L` that contains `k`.
* `insert(L, x)`: Given an element `x`, add it to the head of the list.
* `delete(L, x)`: Given an element `x`, remove it from the list.
* `minimum(L)`: Find smallest-keyed element in L
* `maximum(L)`: Find the largest-keyed element in L.
* `successor(L,x)`: Assuming `L` is totally-ordered, return the next element
  after `x`.
* `predecessor(L,x)`: Assuming `L`  is totally ordered, return the next
  element smaller than `x`.
