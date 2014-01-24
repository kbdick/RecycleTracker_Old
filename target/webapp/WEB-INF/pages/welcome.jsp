<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>RecycleTracker</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="<c:url value="/css/bootstrap.css" />"/>
    <link rel="stylesheet" href="<c:url value="/css/recycletracker.css" />"/>
    <link rel="data" href="<c:url value="/res/data.tsv" />"/>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<script src="http://d3js.org/d3.v3.min.js"></script>
<div id="header"><h4>${logoUrl}</h4></div>
<div class="row">
    <div class="span6" id = "leftcontent" >
<script>
    var margin = {top: 20, right: 20, bottom: 30, left: 50},
            width = 750 - margin.left - margin.right,
            height = 390.625 - margin.top - margin.bottom;

    var parseDate = d3.time.format("%d-%b-%y").parse;

    var x = d3.time.scale()
            .range([0, width]);

    var y = d3.scale.linear()
            .range([height, 0]);

    var xAxis = d3.svg.axis()
            .scale(x)
            .orient("bottom");

    var yAxis = d3.svg.axis()
            .scale(y)
            .orient("left");

    var line = d3.svg.line()
            .x(function(d) { return x(d.date); })
            .y(function(d) { return y(d.close); });

    var svg = d3.select("#leftcontent").append("svg")
            .attr("width", parseInt(d3.select('#leftcontent').style('width'), 10) + margin.left + margin.right)
            .attr("height", height + margin.top + margin.bottom)
            .append("g")
            .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

    d3.tsv("<c:url value="/res/data.tsv" />", function(error, data) {
        data.forEach(function(d) {
            d.date = parseDate(d.date);
            d.close = +d.close;
        });

        x.domain(d3.extent(data, function(d) { return d.date; }));
        y.domain(d3.extent(data, function(d) { return d.close; }));

        svg.append("g")
                .attr("class", "x axis")
                .attr("transform", "translate(0," + height + ")")
                .call(xAxis);

        svg.append("g")
                .attr("class", "y axis")
                .call(yAxis)
                .append("text")
                .attr("transform", "rotate(-90)")
                .attr("y", 6)
                .attr("dy", ".71em")
                .style("text-anchor", "end")
                .text("Weight (tons)");

        svg.append("path")
                .datum(data)
                .attr("class", "line")
                .attr("d", line);
    });

</script>
</div>
    <div id= "rightcontent" class="span6">

    </div>
</div>
<footer>
    <div id="footer"><h4>recycletracker.net</h4></div>
</footer>

<script src="https://code.jquery.com/jquery.js"></script>
<script src="<c:url value="/js/bootstrap.min.js" />"></script>
<script src="http://labratrevenge.com/d3-tip/javascripts/d3.tip.min.js"></script>


</body>
</html>