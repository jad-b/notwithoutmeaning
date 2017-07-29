+++
categories = ["code"]
tags = ["programming"]
date = 2017-07-17T08:19:03-04:00
title = "Binary  Heap"
+++
A __Binary Heap__ is a binary tree where every parent "dominates" its children
"Dominate" here means the parent comes out the winner in whatever comparison
function it's given, typically `<` or `>` when measuring against keys. This
relation between a parent and its children within a heap is referred to as the
_heap property_. It offers very efficient operations for finding the most
"extreme" value, such as the minimum or maximum, and re-calculates that value
in logarithmic time if its removed. This makes heaps an excellent choice for
_priority queues_.

### Key Points
* Can be implemented space-efficiently using an array [Ski12].
* Building a heap can be as simple as passing in an unsorted array of  `n`
  elements and calling `heapify` on elements `$H[Midpoint] => 1$`.

## Complexity

Time Complexity|Average|Worst
---------|-------|-------
Insert   |`$O(lg\,n)$`|`$O(lg\,n)$`
ExtractMinimum|`$O(lg\,n)$`|`$O(lg\,n)$`
FindMinimum|`$O(1)$`|`$O(1)$`
BuildHeap|`$O(n)$`|`$O(n)$`

A binary heap, implemented as an array, takes only _n_ space for _n_ elements.

## Behaviors
Being a heap, it supports a the priority queue operations: Insert, Find-Minimum,
Extract-Minimum. Intriguingly, with a Heap, just Insert'ing every value followed
by Extracting every value sorts the values.

* `insert(H, x)`: Insert the value `x` into the heap, `H`.
* `heapify(H, i)`: Move the value at heap index `i` downwards until the heap
  property is satisfied. A.k.a "bubble-down", or "demote".
* `heapsort(A)`: _In-place_ sort an array by turning it into a heap, then moving
  the max value to the end of the heap and re-heapifying the remaining values.
* `extract(A)`: Return the root value, and backfill it in using heapify.
  Typically suffixed as `extract-min` or `extract-max` for the type of heap it
  is.
* `increase-key(A,x,k)`: Increase the key value of `x` to `k`, and move it
  upwards through the heap if necessary.

## Layout
```julia
mutable struct BinaryHeap{T}
    data::Array{T,1}
    """
    Comparison function, such as '<' (min heap) or '>' (max heap).
    This is typically backed into the implementation, but I had a fun time
    making it configurable.
    """
    cmp
    "Number of elements in the heap"
    size::Int
end
```

## Notes
Building a heap from an array takes linear time, by calling `heapify` on the
first half of the array.

While other sorts prove a little faster in practice, if the data fits within
main memory `heapsort(n)` is a viable option [Ski12].
