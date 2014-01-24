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
    var margin = {top: 20, right: 50, bottom: 30, left: 50},
            width = 960 - margin.left - margin.right,
            height = 500 - margin.top - margin.bottom;

    var parseDate = d3.time.format("%d-%b-%y").parse,
            bisectDate = d3.bisector(function(d) { return d.date; }).left,
            formatValue = d3.format(",.2f"),
            formatCurrency = function(d) { return "$" + formatValue(d); };

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
            .attr("width", width + margin.left + margin.right)
            .attr("height", height + margin.top + margin.bottom)
            .append("g")
            .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

    var data = ${data};

    data.forEach(function(d) {
        d.date = parseDate(d.date);
        d.close = +d.close;
    });

    data.sort(function(a, b) {
        return a.date - b.date;
    });

    x.domain([data[0].date, data[data.length - 1].date]);
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
            .text("Price ($)");

    svg.append("path")
            .datum(data)
            .attr("class", "line")
            .attr("d", line);

    var focus = svg.append("g")
            .attr("class", "focus")
            .style("display", "none");

    focus.append("circle")
            .attr("r", 4.5);

    focus.append("text")
            .attr("x", 9)
            .attr("dy", ".35em");

    svg.append("rect")
            .attr("class", "overlay")
            .attr("width", width)
            .attr("height", height)
            .on("mouseover", function() { focus.style("display", null); })
            .on("mouseout", function() { focus.style("display", "none"); })
            .on("mousemove", mousemove);

    function mousemove() {
        var x0 = x.invert(d3.mouse(this)[0]),
                i = bisectDate(data, x0, 1),
                d0 = data[i - 1],
                d1 = data[i],
                d = x0 - d0.date > d1.date - x0 ? d1 : d0;
        focus.attr("transform", "translate(" + x(d.date) + "," + y(d.close) + ")");
        focus.select("text").text(formatCurrency(d.close));
    }
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