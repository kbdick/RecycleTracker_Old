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
    <div class="span6" id = "chartContainer" >
        <img src="<c:url value="/images/${trend}.png" />" alt="logo"> % ${percentage}
<script>
    var padding = {top: 20, right: 70, bottom: 80, left: 50};
    var parseDate = d3.time.format("%d-%b-%y").parse;
    var sourceData, xScale, yScale, line;
    var prevChartWidth = 0, prevChartHeight = 0;
    var updateTransistionMS = 750;

    var chartSvg = d3.select("#chartContainer").append("svg")
            .append("g")
            .attr("class", "chartContainer")
            .attr("transform", "translate(" + padding.left + "," + padding.top + ")");

    chartSvg.append("g")
            .attr("class", "x axis");

    chartSvg.append("g")
            .attr("class", "y axis");

    var data = ${data}

        data.forEach(function(d) {
            d.date = parseDate(d.date);
            d.weight = +d.weight;
        });

        sourceData = data;

        xScale = d3.time.scale()
                .domain(d3.extent(sourceData, function(d) { return d.date; }));

        yScale = d3.scale.linear()
                .domain([0, d3.max(sourceData, function(d) { return d.weight; })]);

        xAxis = d3.svg.axis()
                .scale(xScale)
                .orient("bottom");

        yAxis = d3.svg.axis()
                .scale(yScale)
                .orient("left");

        // declare a new line
        line = d3.svg.line()
                .x(function(d) { return xScale(d.date); })
                .y(function(d) { return yScale(d.weight); })
                .interpolate("linear");

        updateChart(true);
    function updateChart(init)
    {
        var chartWidth = document.getElementById('chartContainer').getBoundingClientRect().width - padding.left - padding.right;
        var chartHeight = document.getElementById('chartContainer').getBoundingClientRect().height - padding.top - padding.bottom;

        if ((prevChartWidth != chartWidth) ||
                (prevChartHeight != chartHeight))
        {
            prevChartWidth = chartWidth;
            prevChartHeight = chartHeight;

            chartSvg.attr("width", chartWidth + padding.left + padding.right)
                    .attr("height", chartHeight + padding.top + padding.bottom);

            xScale.range([0, chartWidth]);
            yScale.range([chartHeight, 0]);

            if (init)
            {

                chartSvg.select(".x")
                        .attr("transform", "translate(0," + chartHeight + ")")
                        .call(xAxis);

                chartSvg.select(".y")
                        .call(yAxis);
            }
            else
            {
                var t = chartSvg.transition().duration(updateTransistionMS);

                t.select(".x")
                        .attr("transform", "translate(0," + chartHeight + ")")
                        .call(xAxis);

                t.select(".y")
                        .call(yAxis);
            }

            var circle = chartSvg.selectAll("circle")
                    .data(sourceData);

            circle.transition()
                    .duration(updateTransistionMS)
                    .attr("cx", function(d) { return xScale(d.date); })
                    .attr("cy", function(d) { return yScale(d.weight); });

            circle.enter().append("circle")
                    .attr("cx", function(d) { return xScale(d.date); })
                    .attr("cy", function(d) { return yScale(d.weight); })
                    .attr("r", 3)
                    .attr("class", "circle");

            var lines = chartSvg.selectAll(".line")
                    .data([sourceData]);

            lines.transition()
                    .duration(updateTransistionMS)
                    .attr("d", line);

            lines.enter().append("path")
                    .attr("class", "line")
                    .attr("d", line);
        }
    }

    var resizeTimer;
    window.onresize = function(event) {
        clearTimeout(resizeTimer);
        resizeTimer = setTimeout(function()
        {
            updateChart(false);
        }, 100);
    }

    function mousemove() {
        var x0 = x.invert(d3.mouse(this)[0]),
                i = bisectDate(data, x0, 1),
                d0 = data[i - 1],
                d1 = data[i],
                d = x0 - d0.date > d1.date - x0 ? d1 : d0;
        focus.attr("transform", "translate(" + x(d.date) + "," + y(d.weight) + ")");
        focus.select("text").text(formatCurrency(d.weight));
    }

</script>
</div>
    <div id= "rightcontent" class="span6">
         Ads go here.
    </div>
</div>
<footer>
    <div id="footer"><img src="<c:url value="/images/recycletrackerlogo.png" />" alt="logo"></div>
</footer>

<script src="https://code.jquery.com/jquery.js"></script>
<script src="<c:url value="/js/bootstrap.min.js" />"></script>
<script src="http://labratrevenge.com/d3-tip/javascripts/d3.tip.min.js"></script>


</body>
</html>