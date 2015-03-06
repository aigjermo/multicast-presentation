# Further problems with MBone

--------

Multicast networks have had a flat topology, built out of tunnels between
nodes in different ASs, leading to a number of problems.


## Scalability

Large number of routes became a big problem for MBone, peaking at over 10k routes.

. . .

To manage larger networks, route aggregation and hierachical routing is needed.

## Manageability

Lack of central management and formal procedures resulted in many cases of
sub-optimal routing, such as a high number of tunnels routed over the same link.

. . .

There was no protocol to manage information across domain boundaries, causing
routing problems to spread throughout the topology.


