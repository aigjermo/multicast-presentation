# Interdomain Multicast

--------

Three main problems:

* Multicast routing
* Source discovery
* Interdomain tree construction

. . .

> MBGP/PIM-SM/MSDP


## MBGP

*Multiprotocol extensions to Border Gateway Protocol*

. . .

Allows multicast routing across domains by exchange of reachability information.

. . .

With MBGP each AS advertises the set of routes it can reach with associated costs.
Border routers can compute the set of ASs to traverse to reach any given network.

. . .

MBGP does not carry information about groups or sources, only reachable
multicast-enabled networks.


## MSDP

*Multicast Source Discovery Protocol*

. . .

Representatives (a RP) in each domain announce active sources.

. . .

Information is flooded, and each receiving peer uses RPF checks to avoid loops.


## PIM-SM (again)

PIM-SM can be used in order to join multicast trees in other domain.

. . .

A RP is needed in each AS, serving receivers within the domain.

--------

Additionally, the RP functions as a PIM receiver:

. . .

When a source is advertised, a join message is sent towards the source if the
RP has any members for the group.

. . .

Once data is received from the source, it is forwarded down the local shared tree.


## Remaining problems


## Join latency

SA messages are sent periodically, resulting in significant possible delay
from a when a receiver joins to they get the first packets.

. . .

This may be solved by having MSDP peers cache SA messages, at the cost of
extra complexity.


## Bursty sources

Sources sending short bursts of data with several minutes of silences.

. . .

The original packets may never reach receivers since forwarding state may not
yet be established.

. . .

Established state may be dropped between bursts due to timeouts.

. . .

The result is that no packets ever reach group members.


## Scalability

MSDP may not be particularly scalable given it's flooding strategy.

. . .

A few thousand active sources would result in a large number of SA messages
(with embedded data).

. . .

It was still seen as an acceptable short-term solution at the time.

