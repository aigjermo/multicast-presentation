# Taxonomy

Categories:

- Tree type (CBT / SPT (shortest path))
- Service model
- Unidirectional vs. bidirectional
- Intra- vs. inter-domain
- protocol stack position
- dense vs sparse


## Service models

- Single source "broadcast"
- Multiple sources


## Dense vs. sparse

Dense mode protocols operate on the assumption that almost every node in the
network is interested, and therefore flood the network periodically.
As a result every router/node in the network must keep state regardless of
wether or not it has any receivers downstream.
If the network is not actually densely populated with receivers, a significant
(incredible) amount of overhead is the result.

Sparse mode protocols require clients to send control messages in order to
request data from a group, but does not flood the network.

MOSPF falls sort of between, since group membership information is flooded
throughout the network, but the data streams must be explicitly requested.
