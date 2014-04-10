<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
    <title>RecycleTracker</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <script src="https://code.jquery.com/jquery.js"></script>
    <!-- Bootstrap CSS -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

    <!-- Optional theme -->
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">

    <!-- Latest compiled and minified JavaScript -->
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>

    <!-- FontAwesome CSS -->
    <link href="<c:url value="/css/font-awesome.css" />" rel="stylesheet">

    <!-- RecycleTracker CSS -->
    <link rel="stylesheet" href="<c:url value="/css/recycletracker.css" />">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

    <!-- jquery d3js datejs-->
    <script src="https://labratrevenge.com/d3-tip/javascripts/d3.tip.min.js"></script>
    <script src="http://d3js.org/d3.v3.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/datejs/1.0/date.min.js"></script>

    <!-- basic royalslider stylesheet -->
    <link rel="stylesheet" href="../../js/royalslider/royalslider.css">

    <!-- skin stylesheet (change it if you use another) -->
    <link rel="stylesheet" href="../../js/royalslider/skins/minimal-white/rs-minimal-white.css">

    <link rel="stylesheet" href="../../js/slidebars/0.9/slidebars.min.css">
    <link rel="stylesheet" href="../../js/slidebars/0.9/slidebars-theme.css">

    <script src="../../js/slidebars/0.9/slidebars.min.js"></script>


    <!-- Main slider JS script file -->
    <!-- Create it with slider online build tool for better performance. -->
    <script src="../../js/royalslider/jquery.royalslider.min.js"></script>

    <!-- full screen mode for android devices with site launched from home screen -->
    <meta name="mobile-web-app-capable" content="yes">


</head>
<body>
<!-- Top Navigation Bar -->
<div class="sb-navbar sb-slide">
<!-- Right Slidebar control -->
    <div class="sb-toggle-right">
        <div class="navicon-line"></div>
        <div class="navicon-line"></div>
        <div class="navicon-line"></div>
    </div>
</div>

<div class="sb-slidebar sb-right">
    <ul class="sb-menu">
        <li><a href="login">Login</a></li>
        <li><a href="day">Add Data</a></li>
        <li><a href="admin">Admin</a></li>
    </ul>
</div>

<!-- Start Content -->
<div id="sb-site">
    <div class="container">
<!-- Begin Logo -->
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <img id="img-responsive" class="logo" src="/images/RecycleTracker_Icon.png" height="40px" width="auto" alt="RT Logo">
            </div>
        </div>
<!-- End Logo -->
<!-- Start Date and Trend Row -->
        <div class="row">
            <div class="date col-xs-3 col-sm-3 col-md-3 col-lg-3">
                <h4 class="datestyle fa" >April 10th, 2014</h4>
            </div>
            <div class="rolling col-xs-1 col-sm-1 col-md-1 col-lg-1">
                <h1 class="recyclepercent fa" title="This is the building's rolling average recycling rate for consumable goods.">32%</h1>
            </div>
            <div class="daily col-xs-1 col-sm-1 col-md-1 col-lg-1">
                <h1 class="recyclechange fa" title="Nice. You increased your recycling rate from yesterday">1%</h1>
            </div>
            <div class="mood col-xs-1 col-sm-1 col-md-1 col-lg-1">
                <h1 class="directionmeh fa fa-meh-o" title="Meh. You could still recycle better."></h1>
            </div>
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
            </div>
        </div>
<!-- Begin Left Side Content -->
        <div class="row">
<!-- Begin Chart -->
            <div class="col-xs-7 col-sm-7 col-md-7 col-lg-7">
                    <div id = "chartContainer">
                    </div>
            </div>
            <!-- End Chart -->
<!-- End Left Content -->
<!-- Begin Right Content -->
            <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                <div class="royalSlider rsMinW">
                <img class="rsImg img-responsive" src="../../images/rt1.png" height="350" width="auto" alt="Soda"/>
                <img class="rsImg img-responsive" src="../../images/rt2.png" height="350" width="auto" alt="Coffee Cup"/>
                <img class="rsImg img-responsive" src="../../images/rt3.png" height="350" width="auto" alt="Coffee Sleeve"/>
                <img class="rsImg img-responsive" src="../../images/rt4.png" height="350" width="auto" alt="Tip"/>
                <img class="rsImg img-responsive" src="../../images/rt5.png" height="350" width="auto" alt="Cup Holder"/>
                <img class="rsImg img-responsive" src="../../images/rt6.png" height="350" width="auto" alt="Napkin"/>.
                <img class="rsImg img-responsive" src="../../images/rt7.png" height="350" width="auto" alt="Styrofoam"/>
                </div>
            </div>
        </div>
<!-- End Right Content -->
<!-- Begin Footer -->
        <div class="row">
            <div class="col-xs-7 col-sm-7 col-md-7 col-lg-7">
                <p class="marquee h3 fa">"One Man's Junk Is Another Man's Treasure."</p>
            </div>
            <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4"></div>
            <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
                <img class="img-responive" src="/images/mmpilogo.png" height="50" width="auto" alt="Building Logo">
            </div>
        </div>
<!-- End Footer -->
    </div>
</div>
<script>
//Begin Carousel
jQuery(document).ready(function($) {
    $(".royalSlider").royalSlider({
        autoScaleSliderHeight: 350,
        controlNavigation: 'none',
        imageHeight: 350,
        imageScaleMode: 'fit',
        imageScalePadding: 2,
        arrowsNavAutoHide: false,
    	autoScaleSlider: false,
    	randomizeSlides: false,
    	transitionType: 'fade',
    	sliderDrag: true,
    	sliderTouch: true,
    	autoPlay: {
    		enabled: true,
    		pauseOnHover: true,
    		delay: 10000
    	}
    });  
});
//End Carousel

    $('#myFormSubmit').click(function(e){
        e.preventDefault();
        alert($('#myField').val());
        /*
         $.post('http://path/to/post',
         $('#myForm').serialize(),
         function(data, status, xhr){
         // do something here with response;
         });
         */
    });

    var data = [{"landfill":41.0,"recycling":36.0,"date":"Tue Feb 04"},{"landfill":52.0,"recycling":20.0,"date":"Tue Feb 05"},{"landfill":71.0,"recycling":13.0,"date":"Tue Feb 06"},{"landfill":55.0,"recycling":44.0,"date":"Tue Feb 07"},{"landfill":66.0,"recycling":36.0,"date":"Tue Feb 08"},{"landfill":80.0,"recycling":44.0,"date":"Tue Feb 09"},{"landfill":50.0,"recycling":22.0,"date":"Tue Feb 10"},{"landfill":77.0,"recycling":22.0,"date":"Tue Feb 11"},{"landfill":55.0,"recycling":44.0,"date":"Tue Feb 12"},{"landfill":99.0,"recycling":66.0,"date":"Tue Feb 13"},{"landfill":100.0,"recycling":66.0,"date":"Tue Feb 14"},{"landfill":55.0,"recycling":41.0,"date":"Tue Feb 15"}];;
    if(data != 0){

        var padding = {top: 30, right: 40, bottom: 40, left: 40};
        var parseDate = d3.time.format("%a %b %d").parse;
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
    }

    (function($) {
        $(document).ready(function() {
            $.slidebars();
        });
    }) (jQuery);
</script>
</body>
</html>