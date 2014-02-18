<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>RecycleTracker</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<!-- Bootstrap CSS -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>

<!-- FontAwesome CSS -->
<link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">

<!-- RecycleTracker CSS -->
<link rel="stylesheet" href="<c:url value="/css/recycletracker.css" />">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->

<!-- jquery d3js datejs-->
<script src="https://code.jquery.com/jquery.js"></script>
<script src="http://labratrevenge.com/d3-tip/javascripts/d3.tip.min.js"></script>
<script src="http://d3js.org/d3.v3.min.js"></script>
<script src="cdnjs.cloudflare.com/ajax/libs/datejs/1.0/date.min.js"></script>

<!-- full screen mode for android devices with site launched from home screen -->
<meta name="mobile-web-app-capable" content="yes">

<!-- jquery cycle -->
<script type="text/javascript">
    $(function() {
        $('#slideshowmain').cycle();
        function onBefore() {
            $('#title').html(this.alt);
        }
    });
</script>

</head>
<body>

<!-- start header includes logo -->
<div class="container">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <img id="img-responsive" class="logo" src="<c:url value="/images/recycletrackerlogo_large.png" />" height="50" width="auto" alt="RT Logo">
            <!-- switch image out for optimized size later -->
        </div>
    </div>
    <!-- start date and trend row -->
    <div class="row">
        <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
            <h4 class="date">${date}</h4>
        </div>
        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
            <h1 class="recyclepercent">${percentage}</h1>
        </div>
        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
            <h1 class="recyclechange">${todayPercentage}</h1>
        </div>
        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
            <h1 class="directionup">&#9650;</h1>
        </div>
        <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
            <h1 class="minibar">&#x1f4ca;</h1>
        </div>
    </div>

    <div class="row">

        <!-- Begin Chart -->

        <div class="col-xs-7 col-sm-7 col-md-7 col-lg-7">
            <div class="span6" id = "chartContainer">

                <script>
                    var padding = {top: 30, right: 40, bottom: 40, left: 40};
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
        <!-- End Chart -->
    </div>
</div>

<!-- Right Content -->
<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
    <img class="img-responsive" src="<c:url value="/images/coffeecup.jpg" />" height="350" width="auto" alt="Starbucks Cup">
</div>
</div>

<div class="row">
    <div class="col-xs-7 col-sm-7 col-md-7 col-lg-7"><marquee class="marquee h3"  behavior="scroll" direction="left">Optional, configurable message for the building for alerts and other info.</marquee></div>
    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4"></div>
    <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
        <img class="img-responive" src="<c:url value="/images/mmpilogo.png" />" height="50" width="auto" alt="Building Logo">
    </div>
</div>

</div>
</body>
</html>