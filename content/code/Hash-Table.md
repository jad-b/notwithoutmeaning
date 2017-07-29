+++
categories = ["code"]
tags = ["programming"]
date = 2017-07-02T16:54:10-04:00
title = "Hash Table"
+++
A __hash table__ is an array where __keys__ are assigned integer indices by
means of a __hash function__. Presumably, the keys have a related set of data,
usually called the __value__, for which they provide a identifier.

A major dichotomy in hash table implementations is in how they deal with
collisions.  __Chaining__ treats each array slot as a bucket for a linked list.
Keys which hash to the same index are pushed onto the list. __Open addressing__
uses a deterministic procedure, called _probing_, to search for open array
slots. Chaining is conceptually simpler, but uses quite a bit of space in the
overhead of storing _n_ linked lists. Open addressing minimizes the overhead,
often only having a couple helper variables for tracking statistics about the
table. However, it is more complex to code, and vulnerable to the creation
of long sequential runs of values which inflates search time, a problem referred
to as _clustering_. The quality of the probing procedure plays a major role in
fighting clustering.

It is a particularly efficient implementation of the __dictionary__ ADT,
providing average-case `$O(1)$` operations on `insert`, `delete`, and `search`.
All hash tables risk `$O(n)$` in the worst-case, as you could theoretically have
_n_ elements all hash to the same location, leading to a full-table search every
time you went to search for a value or space to insert into. However, good hash
functions make this extremely unlikely.

Instead, more care should be put into determining the correct table size.
Chaining, and the expandable nature of linked lists, means that a table can
continue to add keys & values as memory permits. A useful statistic to track
performance is the _load factor_, which is calculated as `$\alpha =
\frac{m}{n}$`, where `$m$` is the number of elements in the hash table, and
`$n$` is the size of the backing array. Open addressing, since it contents
itself with only the space provided by the array, means that the array must be
resized to accomodate growth. This can be implicit, in which case every element
must be rehashed, or explicitly by the user creating a new, larger hash table
and importing elements from the old.

> What's an ideal load factor?


## Behaviors
* `insert(h, k, v)`: Insert the key `k` and value `v` into the hash table `h`.
* `delete(h, k)`: Delete the key `k` and associated value from the hash table `h`.
* `search(h, k)`: Search the hash table `h` for the key `k`. If found, return
  its associated value.

`minimum(h)` and its converse, `maximum(h)` can be implemented by maintaining
the current min/max as an attribute on the hash table, updating with O(1) cost
during insertions and amortizing the O(n) of finding the new min/max within
deletions. However, if the access pattern is to repeatedly remove the min/max
value, which is common, this degenerates into `$O(n^2)$` perormance.

### Time Complexity

Time Complexity|Average|Worst
---------|-------|-------
Search   |`$O(1)$`|`$O(n)$`
Insertion|`$O(1)$`|`$O(n)$`
Deletion |`$O(1)$`|`$O(n)$`

## Layout
The goal is to associate keys with values in an access-efficient manner. You can
either bundle the keys & values next to each other within a tuple or record, or you can
maintain them in separate arrays with matching indices, e.g. `keys[i] =>
values[i]`.

This sample implementation uses chaining, so each key-value pair lives within
the same linked list node.

```julia
#
mutable struct HashTable{K,V}
    # Our array of linked lists. If the List's Nodes don't have a `key`
    # attribute, the keys & values will need to be packaged together before
    # passing them to List methods.
    data::Array{List{K,V},1}
    # Our hash function, presumably with a sensible default provided in the
    # constructor. It needs to accept a K and output an Integer for indexing
    # into `data`.
    hash
    # The number of elements stored in the hash table.
    count::Integer
    # (Optional) The minimum value. Expensive to re-calculate, as it requires a
    # full table scan.
    minimum::V

    # Hash tables using open addressing might also keep variables such as:
    # (Taken from Julia's Dict implementation)

    # The longest-seen probe run to insert an element. Knowing this, we can
    # cut-off searches longer that this threshold.
    maxprobe::Integer
    # The first `k` index containing values, saving `k` time when performing a
    # linear scan
    idxfloor:Integer
end
```

### Space Complexity
We store `$n$` keys and values, so storage is ultimately `$n$`. However, we also
pay the overhead of our linked list implementation, so very large tables can
save on `$n$` pointer space by only using a singly-linked list.

## Notes
Double-hasing is the most commonly recommended algorithm for probing in an open
addressing implementation (refs-needed). Briefly, it uses two hash functions.
The first acts to calculate the initial position, and the second is combined
with the first's value to create a non-linear sequence of indices. Formally: `$
h(i,k) = (h_1(k) + i \dot h_2(k)) $`
([Wikipedia](https://en.wikipedia.org/wiki/Double_hashing)).

For an interesting expansion of what hash tables can be made to do, check out
[Distributed Hash Tables](https://en.wikipedia.org/wiki/Distributed_hash_table).
