+++
date = "2015-12-08"
title = "Writing Parallel-Aware Code"
category = ["programming"]
tags = ["whitepaper"]
draft = true
+++

Multi-core unoptimized code runs, on average 24x _slower_ (53x worst-case) than
parallel-aware, best-optimized code on the same system. The author's
demonstrate that using two techniques, parallel-optimizing compilers and three
key programming techinques, this gap can be reduced to 1.4x.

Read the paper
[here](http://dl.acm.org/citation.cfm?id=2766485.2742910&coll=portal&dl=ACM).

<!--more-->

As far as the compiler goes - I'll let you read the article. They're not a
particular interest of mine, and I'm satisfied to know that there are tools
available/being developed to combat this problem. Onto the programming
techniques:

### 1. Array of Structures => Structure of Arrays
Say you have a Point object:

```python
class Point:
    """I could also be a collections.namedtuple."""

    def __init__(self, x, y, z):
        self.x, self.y, self.z = x, y, z
```
To represent a 3-D object, you'd need vector of Point objects. To perform a transform, you'd need to iterate through all
your Points, gather their respective (x,y,z) coordinates, manipulate, them reassign their values.

Your vector of Point objects is an _array of structures_. It's very similar to a row-based database.

So what would a _structure of arrays_ be? It'd look a lot like a column-based database.

```python
class PointVector:

    def __init__(self, xs, ys, zs):
        """The suffixed 's' on the parameters is meant to indicate plurality.
        In Python, you'd be better off using the arrays module, as lists make
        no promises as to data locality.
        """
        self.xs, self.ys, self.zs = sx, ys, zs
```

Gone are the objects representing a single point. Instead, a Point is represented by its index across the PointVector;
to retrieve Point 566, you'd apply that index to all the internal coordinate vectors:

```python
    def get(self, idx):
        return (self.xs[idx], self.ys[idx], self.zs[idx])
```

### 2. Caching as Blocking
This one focuses on limiting redundant memory retrievals by loading _blocks_ of data at once. I think their
example of a double for-loop over a vector of length _n_ is great for understanding this concept.

```go
things = [...]
for i:=0; i < n; i++ {
    for j:=0; j < n; j++ {
        process(things[i], things[j])
    }
}
```

We compare every object in things to every other object in things (pair-wise comparison), as such, we have _O(n^2)_
time complexity.

Now, we're going to precede this loop by loading as many things into memory as the cache will allow. Then, in our inner
loop, we'll only loop over these items.

```go
things = [...]
// Setup a limit for the innermost loop to BLOCKSIZE; you'll see!
for j:=0; j < n; i += BLOCKSIZE { // O(n/BLOCKSIZE)
    // Exactly the same as before!
    for i:=0; i < n; i++ { // O(n)
        // Only work within the range of BLOCKSIZE
        for j2:=0; j2 < BLOCKSIZE; j2++ { // O(BLOCKSIZE)
            process(things[i], things[j+j2])
        }
    }
}
```
The time complexity will be the same as before: (n/B * N * B) = n<sup>2</sup>, but now our innermost loop only operates
on items in memory. Before, you'd have to have multiple memory retrievals as you loaded and discarded different
BLOCKSIZE chunks of data.

### 3. SIMD-friendliness
First off:

__SIMD__ Single-instruction multiple-data units. Don't ask...right now.

I'm going to deconstruct their MergeSort example. They only display the code for merging two lists together.

```go
func merge(x, y int[]) int[] {
    // size of the two lists
    nX, nY := len(x), len(y)
    // Return value: the merged output
    z := int[nX+nY]{}
    // current index within lists
    indexX, indexY, indexZ := 0, 0, 0

    for indexX < nX && indexY < nY {
        if (x[indexX] < y[indexY]) {
            z[indexZ] = x[indexX]
            indexX++
        } else {
            z[indexZ] = y[indexY]
            indexY++
        }
        indexZ++
    }
    return z
}
```

