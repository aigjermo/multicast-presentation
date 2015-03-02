# Algorithms

## Distance Vector Multicast Routing Protocol

*Flood and prune*

- Does not scale (Obviously!)
- Prune state kept at each router
- Sends prune message back towards the source if it is a leaf router without
  receivers, or if prune messages are received on all interfaces.
- Tries to avoid unneccessary traffic by employing RPF checks to discard
  traffic from routers it would not route through to reach the source.
    - May or may not return prune messages on those interfaces
    - Router may skip interfaces because a failed RPF check is expected
      from the other end.

## Reverse Path Forwarding

- Send control (join) messages using ip forwarding towards the source (or RP in CBT mode)
- Traffic received from source is forwarded to links with members
- Traffic received on other interfaces is dropped

Goal is to avoid loops


## Core Based Trees

- Sparse mode protocol
- Single root, single tree means less state information
- Bidirectional trees avoids sending data back from the core towards the source.
    - additional complexity, hard to control.
    - Risk of loops.
- More complex operation and less optimal paths compared to OSPF


## (M) Open Shortest Path First

- Dense mode protocol (group info flooded to all routers)
- Shortest path tree is constructed for each group, based on receiver info.
- Multiple trees means scalability issues (more data to store at each router)
- Has more optimal paths than core based trees


## Protocol Independent Multicast

- Sparse and dense mode versions
- Uses existing unicast routing table as basis for RPF checks.

### PIM-DM

- Similar to DVMRP, except:
    - Uses unicast lookup table
    - Sends on all interfaces (except receiving), does not try to eliminate

### PIM-SM

- Much more widely used (as of 2000) than CBT
- Tree construction mechanism similar to CBT, but:
    - Core is called Randezvous Point
        - May be different for each group
    - All routers learn about RP's through bootstrap/discovery protocol
        - Not specified in v1
        - Selection of alternative RP in case of failure included
    - Receivers send join packages toward RP, routers create forwarding
      state along the way.
    - Senders initially encapsulates the data stream in unicast packets sent
      towards the RP.
      The RP strips the encapsulation and sends down the tree on the interfaces
      it has forwarding state for.
      The RP may also return a join message to the source in order to request
      that the source drops the encapsulation.
      If the RP has no forwarding state (no receivers) it may request that the
      source stops sending.


## GLOP - Global addressing scheme

Assigns address spaces to AS (265 per)
Small address space is problematic for large AS

