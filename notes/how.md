# Algorithms

## *Flood and prune*

- Does not scale (Obviously!)


## Reverse Path Forwarding

- Send control (join) messages using ip forwarding towards the source (or RP in CBT mode)
- Traffic received from source is forwarded to links with members
- Traffic received on other interfaces is dropped

Goal is to avoid loops


## Core Based Tree

- Single root, sigle tree means less state information
- More complex operation, less optimal paths


## Shortest path first

- Multiple trees means scalability issues (data)
- More optimal paths


## Bidirectional forwading

Adds complexity and is hard to control (loops)


## GLOP - Global addressing scheme

Assigns address spaces to AS (265 per)
Small space is problematic

