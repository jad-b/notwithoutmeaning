+++
categories = ["code"]
tags = ["programming"]
draft = true
date = 2017-07-20T07:33:16-04:00
title = "Hash Set"
+++
The __Hash Set__ is an implementation of the _Set_ ADT, an unordered collection
without duplicates, powered by a _hash table_. The interface typically mimics
mathematical sets, primarily supporting operations on comparison amongst Sets.


## Behaviors
* `insert(S,x)`: Insert `x` into `S`, overwriting if already contained.
* `delete(S,x)`: Delete `x` from `S`.
* `contains(S,x)`: Return `true` if `x` is contained in `S`.
* `union(S,T)`: Combine two sets into a new Set.
* `intersection(S,T)`: Return a Set containing all elements found in both `S`
  and `T`.
* `difference(S,T)`: Return a Set with elements contained in _either_ `S` or `T` (XOR).
* `issubset(S,T)`: Is `T` a subset of `S`? Note that `issubset(S,S)` may return
  true depending on whether the implementation tests for proper subsets (sets
  with at least one fewer element than the set being compared against).

### Time Complexity
Where `$m,n = |S|,|T|$`.

Time Complexity|Average|Worst
---------------|-------|-------
Insert(S,x)       |`$O(1)$`|`$O(n)$`
Delete(S,x)       |`$O(1)$`|`$O(n)$`
Contains(S,x)     |`$O(1)$`|`$O(n)$`
Union(S,T)        |`$O(m+n)$`|`$O(m+n)$`
Intersection(S,T) |`$O(n)$`|`$O(n)$`
Difference(S,T)   |`$O(m+n)$`|`$O(m+n)$`
IsSubset(S,T)     |`$O(n)$`|`$O(n)$`

We benefit from the using the hash table for basic data operations
(insert/delete/contains) with its constant time expected behavior. However, the
completely unordered storage of the hash table means we're forced to use linear
scans to compare, often of both sets.

Using a structure that stored values in sorted order, like a balanced search
tree, would allow for taking shortcuts during comparisons. You just keep the
sorted order thing quiet, and don't make it part of the contract with the user
(unless you want to, but that reduces available set implementations down the
road).

## Layout
```julia
mutable struct HashSet{T}
    # Hash table. Bool is chosen due to it's small size (1 byte) in Julia, but
    # any similarly small value would work.
    dict::HashTable{T,Bool}

    # Number of elements in the set. Likely provided by the hash
    # table implementation, however.
    # size::Int
end
```

### Space Complexity
The same size as that of a hash table.

## Notes
None yet.
