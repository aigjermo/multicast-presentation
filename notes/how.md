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
- More complex operation, less optimal paths


## (M) Open Shortest Path first

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


## Bidirectional forwading

Adds complexity and is hard to control (loops)


## GLOP - Global addressing scheme

Assigns address spaces to AS (265 per)
Small space is problematic

