/* globals Reveal:false, d3:false */

(function (d3, reveal) {
    'use strict';

    // default
    var width = 850,
        height = 500,
        link_distance = 100,
        link_strength = 0.2,
        node_attraction = -500;

    // active layouts

    var drawSvg = function () {

        // get element
        var e = d3.select(this);

        // get embedded data
        var data = JSON.parse(e.text());

        // clear element text
        e.text("");

        // add svg
        var svg = e.append("svg")
            .attr("width", width)
            .attr("height", height);

        // layout
        var layout = d3.layout.force()
            .charge(node_attraction)
            .linkDistance(link_distance)
            .linkStrength(link_strength)
            .size([width, height])
            .nodes(data.nodes)
            .links(data.links)
            .start();

        var link = svg.selectAll(".link")
            .data(data.links)
            .enter().append("line")
                .attr("class", function(d) { return "link " + d.type; });

        var node = svg.selectAll(".node")
            .data(data.nodes)
            .enter().append("circle")
                .attr("class", function(d) { return "node " + d.type; })
                .attr("r", 5)
                .attr("cx", width/2)
                .attr("cy", height/2)
                .call(layout.drag);

        // update positions
        layout.on("tick", function() {
            link.attr("x1", function(d) { return d.source.x; })
                .attr("y1", function(d) { return d.source.y; })
                .attr("x2", function(d) { return d.target.x; })
                .attr("y2", function(d) { return d.target.y; });

            node.attr("cx", function(d) { return d.x; })
                .attr("cy", function(d) { return d.y; });
        });
    };

    var drawgraph = function () {


        var e = this;

    };

    var changed = function (e) {
        d3.select(e.currentSlide)
            .select(".graph")
            .each(drawgraph);
    };


    var init = function () {

        d3.selectAll(".graph").each(drawSvg);

        Reveal.addEventListener('slidechanged', changed);
    };

    if (Reveal.isReady()) {
        init();
    } else {
        Reveal.addEventListener('ready', function (e) {
            init();
            changed(e);
        });
    }

})(d3, Reveal);
