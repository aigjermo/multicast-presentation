# Long term solutions


## BGMP

*Border Gateway Multicast Protocol*

. . .

Based on the idea that there is a single logical root domain for every group.

. . .

Constructs bidirectional trees that are shared between domains and using a
single root.

. . .

A strict address allocation scheme is needed to avoid interdomain dependencies.


## RAMA protocols

*Root Addressed Multicast Architecture*

. . .

Attempts to make fundamental changes in the multicast model in order to address
issues such as security, billing and management.

. . .

The premise is that most applications are single-source or have an easily
identifiable primary source.

. . .

This source acts as the root of the tree, eliminating the need for RPs.


## Express multicast

is a single source protocol, which places the root of the tree at the source.

. . .

Group members send join messages along the reverse path to the source.

. . .

Specifically designed for subscriber-based systems, such as TV broadcasts, and
allows closed groups with low routing complexity.


## Simple multicast

is similar to Express Multicast, but offers multiple sources per group.

. . .

One source must be chosen as primary, and the tree is rooted at this node's
closest router.

. . .

Receivers send join messages to the primary, constructing a bidirectional tree.

. . .

Additional sources send packets towards the primary, but traffic is routed
down the tree as soon as it reaches a participating router.


