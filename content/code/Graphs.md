+++
title: "Graphs"
date: 2017-08-11T13:18:58-04:00
categories = ["code"]
tags = ["programming", "data structure"]
draft = true
+++

### Terminology
Node/Vertice
: A value within the graph

Edge
: A connection between two nodes. More generally, edges represent some form of
relation between those nodes.

Order
: The number of vertices in a Graph.

Size
: The number of edges in a Graph.


## Layout
There are two dominant means of representing graphs: as a matrix, where the
value at row _i_, column _j_ holds the value of the edge `$(i,j)$`, or where
every node holds a list of its outgoing edges.

The latter is commonly called the _adjacency list_ representation, and is
generally preferred, as it's more flexible. In simple terms:

```rust

```





## Behaviors
By itself, graphs provide very rudimentary data operations. Adding a node or
vertice takes near constant time, as nodes are typically referenced by a unique
(within the graph) ID, and edges are referenced by their two node IDs. Thus,
addition and searching for nodes by ID quick. Deletion can be much more
expensive, depending on how edges are stored. Often, edges are indexed by
their source node, but when deleting, you need to find all edges which have
the deleted node as the _destination_.

### Searching/Traversal
While not a behavior _of_ graphs, without efficient means of traversal all
you've really done is make a very confused linked list. Thus enters
__Depth-First Search__ (DFS) and __Breadth-First Search__ (BFS). Both, as their
name imply, search through the vertices in a graph until their predicate is
satisfied. The difference lies in how each algorithm determines which node to
visit next.

In DFS, once processed, it gets marked "processed" and its children are pushed
onto a stack. This means the next node to be processed _is a child of the
current node_. When visualized, this gives "deep" (get it?) linear runs in the
graph, preferring to go further away ("deep") from the starting node versus
looking at its siblings ("wide").  In contrast, BFS once a node is processed,
its children are pre-marked and _enqueued_ (BFS uses a queue, if that was too
subtle).

### Depth-First Search
It is simple to track *how* we got to a vertex by keeping an index of
nodes->parents. Once finished searching, we can follow the indexs back to a root
(no parent); the reversal of that string is our forward path.

Detecting cycles uses a similar tact. We're going to explicitly track which
nodes are currently on the recursion stack. If we encounter a node already on
the stack, we've hit upon a cycle. If we've been keeping track of our parents,
we can output the cycle.

Since a DFS will touch every vertice in a Graph exactly once, we can use it to
produce an ordering for the graph. Interestingly, we get different orders
depending on if we use a queue to record seeing the vertice before or after we
recurse (pre or post-ordering), or if we push the vertex on a stack after we
recurse (reverse post-order) [Sed11].

#### Topoplogical Sorting
Awesomely, reverse post-order produces an order where nodes are always listed
before their dependencies, called a _topological sort_.

### Weighted Graph Traversal

TODO: Dijkstra's Algorithm
TODO: All-Pairs Shortest Path
TODO: Minimum Spanning Tree Prim/Kruskal
TODO: Union/Find (Separate page)

## Notes
If all edges in a graph have equal (or no) cost,  the first time a BFS
encounters a node is the shortest path to that node.

[Ski12] recomends LEDA and Boost as his top-two best general-purpose graph
implementations.

### Additional Reading
* [Wikipedia on Graph DBs](https://en.wikipedia.org/wiki/Graph_database)
