+++
tags = ["programming"]
categories = ["code"]
date = "2017-07-27T07:24:03-04:00"
title = "Trie"
draft = true

+++
The __trie__ is a _symbol table_ specialized for string keys. It is a _tree_
where every node represents a single symbol within the string, thus each string
is represented by a path of nodes. Values are only stored at nodes which
represent the last symbol of a valid string. This means every sub-path within a
path represents a prefix to a valid string, making the Trie very efficient for
operations upon string prefixes.

A.k.a "prefix tree".

## When should I use it?
* You can represent your data as a large string or lots of strings
* You need to test for valid substrings
* You need to find valid words, given a prefix.

## Layout
As a tree, the root node represents the empty prefix. Since it's a tree, every
node can be treated as the root of a new Trie, with a starting prefix of all
nodes along the path to that node. As such, there is no need to explicitly have
a wrapper Trie structure around the nodes, unless additional data related to the
entire data structure is being stored.

Tries typically have an array of pointers to their child nodes. The size of the
child array is determined by the size of the alphabet the strings are drawn
from, typically represented by `$R$`, and the entire Trie may be referred to as
an R-way Trie.  Unfortunately, the need to have `$R$` at each node greatly
increases memory usage.

Trie nodes do not actually need to store the symbol they represent. Since the
alphabet is finite, each symbol can be indexed within the alphabet, at least by
some arbitrary order. Since we have a map of symbol `<=>` integer, this gets rid
of the need to actually store the Symbol in the node.

As mentioned, only Trie nodes that represent the last symbol in a valid string
will have a value. This is a conceptual shift from other trees, but all goes
back to the Trie maximizing on speed of (partial-)key lookups over compact
storage.

```julia
struct Trie{K,V}
    "The value stored at key `k`, if there is one."
    value::Nullable{V}
    "_R_ pointers to child nodes, where _R_ is the size of the string alphabet."
    children::Array{Nullable{Trie{K,V}},1}
    """
    (Optional, but likely) The number of strings found at or below this node.
    Storing the count of strings _below_ the node minimizes the amount of work
    to know how many strings satisfy a prefix, including the empty prefix (the
    total number of keys within the Trie).
    """
    count::Int
end
```
In a Trie with `$N$` nodes, and an alphabet of size `$R$`, and `$w$` is the
average key length, a Trie requires between `$RN$` to `$RNw$` space. Every node
has `$R$` links. If every key character is different in each word, then you need
`$Nw$` nodes.

## Behaviors
Function signatures are written in Haskell; suck it. To save space, the type
signature will be `(Trie t, String k, V v, String pattern)`.

* `search:: t -> k -> Maybe v`: Return the value stored at
  key `k`.
* `insert:: t -> k -> v -> Trie k v`: Insert a value at key `k`.
* `traverse:: t -> f -> [t]`: Visit all nodes within the Trie. The following
  methods depend on this method. This signature has it returning a list of Trie
  nodes, but no return value is required.
    * `longestPrefix:: t -> k -> k`: Find the longest prefix of the given
      string, which could be the string itself.
    * `keysWithPrefix:: t -> k -> [k]`: Find keys with a given prefix.
    * `keysThatMatch:: t -> pattern -> [k]`: Find keys with keys that satisfy
      the provided pattern.

### Time Complexity
Where `$L$` is the length of the search key, `$n$` is the number of nodes in the
Trie.

Time Complexity|Average|Worst
---------|-------|-------
search |`$O(L)$`|`$O(L)$`
insertion|`$O(L)$`|`$O(L)$`
Deletion |`$O(L)$`|`$O(L)$`
traverse|`$O(n)$`|`$O(n)$`

## Check on Learning
Why do Tries not need to store the key in their nodes?

How much space does an R-way Trie require?

## Notes
Ternary Search Tries (TSTs), invented by Sedgewick, use three pointer: less
than, equal to, or greater than the current symbol in the string key. Using a
hybrid approach where the root node is an R-way Trie and all other nodes are
TSTs takes a best-of-both worlds approach.
