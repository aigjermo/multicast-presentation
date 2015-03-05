# Layers of multicast


## IP multicast

~~~ { .graph }
{
    "nodes": [
        { "type": "orange", "count": 4 },
        { "type": "member", "count": 6 }
    ],
    "links": [
        { "type": "ip", "source": 0, "target": 6 },
        { "type": "ip", "source": 0, "target": 5 },
        { "type": "ip", "source": 1, "target": 7 },
        { "type": "ip", "source": 2, "target": 7 },
        { "type": "ip", "source": 2, "target": 9 },
        { "type": "ip", "source": 3, "target": 4 },
        { "type": "ip", "source": 4, "target": 6 },
        { "type": "ip", "source": 4, "target": 7 },
        { "type": "ip", "source": 4, "target": 8 },
        { "type": "ip", "source": 5, "target": 7 },
        { "type": "ip", "source": 5, "target": 9 },
        { "type": "ip", "source": 5, "target": 6 },
        { "type": "ip", "source": 6, "target": 7 },
        { "type": "ip", "source": 6, "target": 9 },
        { "type": "ip", "source": 7, "target": 8 },
        { "type": "ip", "source": 8, "target": 9 }
    ],
    "tunnels": [
    ]
}
~~~

--------

DVMRP, MOSPF, PIM-DM/SM, CBT

. . .

"Native multicast"

. . .

High cost of deployment


## Application layer

~~~ { .graph }
{
    "nodes": [
        { "type": "orange", "count": 4 },
        { "type": "other", "count": 6 }
    ],
    "links": [
        { "type": "no", "source": 0, "target": 6 },
        { "type": "no", "source": 0, "target": 5 },
        { "type": "no", "source": 1, "target": 7 },
        { "type": "no", "source": 2, "target": 7 },
        { "type": "no", "source": 2, "target": 9 },
        { "type": "no", "source": 3, "target": 4 },
        { "type": "no", "source": 4, "target": 6 },
        { "type": "no", "source": 4, "target": 7 },
        { "type": "no", "source": 4, "target": 8 },
        { "type": "no", "source": 5, "target": 7 },
        { "type": "no", "source": 5, "target": 9 },
        { "type": "no", "source": 5, "target": 6 },
        { "type": "no", "source": 6, "target": 7 },
        { "type": "no", "source": 6, "target": 9 },
        { "type": "no", "source": 7, "target": 8 },
        { "type": "no", "source": 8, "target": 9 }
    ],
    "tunnels": [
        [0,6,4,3],
        [1,7,4,3],
        [2,7,1]
    ]
}
~~~

--------

End System Multicast, NICE, ALMI

. . .

Offers ease of deployment and moves intelligence to the edge of the network.


## Overlay multicast

~~~ { .graph }
{
    "nodes": [
        { "type": "orange", "count": 4 },
        { "type": "member", "count": 2 },
        { "type": "other", "count": 4 }
    ],
    "links": [
        { "type": "no", "source": 0, "target": 6 },
        { "type": "no", "source": 0, "target": 5 },
        { "type": "no", "source": 1, "target": 7 },
        { "type": "no", "source": 2, "target": 7 },
        { "type": "no", "source": 2, "target": 9 },
        { "type": "no", "source": 3, "target": 4 },
        { "type": "no", "source": 4, "target": 6 },
        { "type": "no", "source": 4, "target": 7 },
        { "type": "no", "source": 4, "target": 8 },
        { "type": "no", "source": 5, "target": 7 },
        { "type": "no", "source": 5, "target": 9 },
        { "type": "no", "source": 5, "target": 6 },
        { "type": "no", "source": 6, "target": 7 },
        { "type": "no", "source": 6, "target": 9 },
        { "type": "no", "source": 7, "target": 8 },
        { "type": "no", "source": 8, "target": 9 }
    ],
    "tunnels": [
        [4,7,1],
        [4,3],
        [4,6,5],
        [5,0],
        [5,9,2]
    ]
}
~~~

--------

Scattercast, Overcast, RMX, AMCast, OMNI

. . .

Somewhere between, where some nodes act as gateways

. . .

Offers more flexibility and lower cost of deployment than IP.

## Comparison

  Metric                  IP   ALM   OM
  ---------------------- ---- ----- ------
  Ease of deployment     low  high  medium
  Multicast efficiency   high low   medium
  Control overhead       low  high  medium
