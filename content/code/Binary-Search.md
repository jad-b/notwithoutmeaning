+++
title: "Binary Search"
date: 2017-08-11T13:41:36-04:00
categories = ["code"]
tags = ["programming", "algorithm"]
draft = true
+++
Binary search locates an element (or lack of) within a monotonically increasing
sequence of size `$n$` in `$lg\,n$` time. It does so by establishing a bounds
upon the search space, comparing that space's midpoint to the target element,
and then eliminating half of that space for each comparison. It is very fast,
easy to understand, and incredibly versatile.

## Implementation
```rust
fn binarySearch(A, x, lo, hi) {
    if lo > hi {
        return None
    }
    mid = (lo + hi) >> 1;
    if A[mid] == x {
        return mid;
    } else if A[mid] < x {
        return binarySearch(A, x, mid + 1, hi)
    } else {
        return binarySearch(A, x, lo, mid - 1)
    }
}
```



## Notes
Kudos to this [TopCoder article on Binary
Search](https://www.topcoder.com/community/data-science/data-science-tutorials/binary-search/)
for demonstrating how binary search applies to any monotonically increasing
sequence, and thus generalizes above searching within a defined array.
