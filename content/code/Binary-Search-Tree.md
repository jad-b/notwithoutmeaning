+++
categories = ["code"]
draft = "true"
tags = ["programming", "data structure"]
date = "2017-07-12T08:40:42-04:00"
title = "Binary Search Tree"
+++
A __Binary Search Tree__ (BST) is a _recursive_ data structure composed of
nodes with up to two edges pointing to child nodes. They are an extension of
_binary trees_ in that the left child holds a value less than or equal to that
of the parent's, while the right child holds a value greater than the parent's.

Being trees, they are a specific kind of graph; namely, one that is _connected_
(every node has a path between it and every other node) and without _cycles_ (no
path includes the same node twice).

### Terminology
Complete
: All non-terminal depths filled with nodes, and leaves are filled left-to-right.

Full
: Every node has 0 or 2 children.

Perfect
: All leaf nodes at the same depth. Is also _full_ and _complete_.

Balanced
: No leaf is more than a certain amount farther from the root than any other
[Source](https://xlinux.nist.gov/dads/HTML/completeBinaryTree.html).


## Layout
At its core, a BST is a Node than can link to two other nodes, with each link
subject to a different invariant (`<=` or `>`). Having a third pointer back to
the node's parent greatly saves time when performing `delete`

```julia
# Umbrella type for empty and actual nodes
abstract type BSTNodeType end

# Represents null values within the BST
struct EmptyBSTNode <: BSTNodeType end

mutable struct BSTNode{T}
    value::T
    parent::BSTNodeType{T}
    left::BSTNodeType{T}
    right::BSTNodeType{T}
end
```
The edges linking parent-to-child nodes are usually just represented by
pointers, and not full-fledged Edge objects, presumably because they aren't
typically used to store much additional information about the edge, such as type
(implicit in the variable, a la `parent` or `left`), nor specific edge
attributes themselves.

## Behaviors
Here I use an OOP-convention for keys & values, assuming that for the object's
stored as values, there exists a function that uses a subset of the object's
attributes to form an indentifying key.

* `search(T, k)`: Search the BST for the key `k`, returning its associated
  value.
    * Starting at `T`, recurse by following the left/right invariants until you
      locate a matching value or run out of nodes.
* `insert(T, v)`: Insert the value `v` into the BST `T`.
    * Starting at `T`, recurse by following the left/right invariants until you
       encounter an empty child.
* `delete(T, v)`: Delete the value from the BST `T`.
    * Starting at `T`, recurse by following the left/right invariants until you
      find the node `x` owning `v`. Three cases emerge:
        1. `x` is a leaf => delete without remorse.
        2. `x` has a child => Replace `x` with that child.
        3. `x` has two children. Make a decision to replace `x` with either its
           predecessor (right-most node along its left subtree) or its
           successor(vice-versa. We'll assume successor, and refer to it as `y`:
            1. If `y` is _not_ already the right child of `x`
                1. Replace `y` with its right child (can be null)
            2. Replace `x` with `y`
* `minimum(T)`: Return the minimum value.
    * Return the left-most value in `T`.
* `maximum(T)`: Return the maximum value (the right-most value in the tree).
    * Return the right-most value in `T`.
* `traverse(T, callback)`: Walk the the tree, start at `T`, executing `callback`
  on every node. There's three options for the walk: inorder, pre-order, or
  post-order, where the in|pre|post refers to when `callback` is executed on a
  node with respect to its children. The callback can be an accumulator if it
  is a function closure and uses a captured variable to store state.

### Time Complexity
Time Complexity|Average|Worst
---------|-------|-------
Search   |`$O(log\,n)$`|`$O(n)$`
Insertion|`$O(log\,n)$`|`$O(n)$`
Deletion |`$O(log\,n)$`|`$O(n)$`
Minimum/Maximum|`$O(log\,n)$`|`$O(n)$`
Predecessor/Successor|`$O(log\,n)$`|`$O(n)$`

When a BST is well-balanced , all operations take `$lg\,n$` time to complete.
This is due to the recursive halving of options as you descend from the root to
the target node, hence `$lg\,n$` time. In the worst, most-unbalanced scenario,
nodes are added to the BST in sorted order, creating a [linked list]({{< relref
"LinkedList.md" >}}). Thus, maintaining a balanced tree is worth the effort,
and can be done using a red-black tree, AVL tree, and or some _k_-ary trees.

## Notes
BST's are conceptually simple, but tricky in the details. It becomes important
to maintain a balanced tree to keep the average-case time complexity, so in
actuality you'd never use just a BST, instead employing one of its
self-balancing brethren.

Deletion from a binary search tree takes some reasoning to convince yourself of
its correctness (or should, if you want to correctly implement it). The
important thing is to maintain the parent node's invariant of `$n.left <= n <
n.right$`. This rears its head when deleting a "full" node with two children.
You must choose to replace the node with either its predecessor or successor.
Alternating between each can be helpful in maintaing a more balanced tree
[src](https://en.wikipedia.org/wiki/Binary_search_tree#Deletion).
