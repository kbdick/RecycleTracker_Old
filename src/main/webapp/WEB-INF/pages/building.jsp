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
            <img id="img-responsive" class="logo" src="/images/RecycleTracker_Icon.png" height="30px" width="auto" alt="RT Logo">
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
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
                    <!--<div class="span6" id="chartContainer">-->
<div id="graph" class="aGraph" style="position:absolute;top:0px;left:0; float:left;"></div>

<script>
/* implementation heavily influenced by http://bl.ocks.org/1166403 */
		
		// define dimensions of graph
		var m = [80, 80, 80, 80]; // margins
		var w = 1000 - m[1] - m[3]; // width
		var h = 400 - m[0] - m[2]; // height
		
		// create a simple data array that we'll plot with a line (this array represents only the Y values, X will just be the index location)
		var data = ["landfill":41.0,"recycling":36.0,"date":"Tue Feb 04"},{"landfill":52.0,"recycling":20.0,"date":"Tue Feb 05"},{"landfill":71.0,"recycling":13.0,"date":"Tue Feb 06"},{"landfill":55.0,"recycling":44.0,"date":"Tue Feb 07"},{"landfill":66.0,"recycling":36.0,"date":"Tue Feb 08"},{"landfill":80.0,"recycling":44.0,"date":"Tue Feb 09"},{"landfill":50.0,"recycling":22.0,"date":"Tue Feb 10"},{"landfill":77.0,"recycling":22.0,"date":"Tue Feb 11"},{"landfill":55.0,"recycling":44.0,"date":"Tue Feb 12"},{"landfill":99.0,"recycling":66.0,"date":"Tue Feb 13"},{"landfill":100.0,"recycling":66.0,"date":"Tue Feb 14"},{"landfill":55.0,"recycling":41.0,"date":"Tue Feb 15"}];
 
		// X scale will fit all values from data[] within pixels 0-w
		var x = d3.scale.linear().domain([0, data.length]).range([0, w]);
		// Y scale will fit values from 0-10 within pixels h-0 (Note the inverted domain for the y-scale: bigger is up!)
		var y = d3.scale.linear().domain([0, 10]).range([h, 0]);
			// automatically determining max range can work something like this
			// var y = d3.scale.linear().domain([0, d3.max(data)]).range([h, 0]);
 
		// create a line function that can convert data[] into x and y points
		var line = d3.svg.line()
			// assign the X function to plot our line as we wish
			.x(function(d,i) { 
				// verbose logging to show what's actually being done
				console.log('Plotting X value for data point: ' + d + ' using index: ' + i + ' to be at: ' + x(i) + ' using our xScale.');
				// return the X coordinate where we want to plot this datapoint
				return x(i); 
			})
			.y(function(d) { 
				// verbose logging to show what's actually being done
				console.log('Plotting Y value for data point: ' + d + ' to be at: ' + y(d) + " using our yScale.");
				// return the Y coordinate where we want to plot this datapoint
				return y(d); 
			})
 
			// Add an SVG element with the desired dimensions and margin.
			var graph = d3.select("#graph").append("svg:svg")
			      .attr("width", w + m[1] + m[3])
			      .attr("height", h + m[0] + m[2])
			    .append("svg:g")
			      .attr("transform", "translate(" + m[3] + "," + m[0] + ")");
 
			// create yAxis
			var xAxis = d3.svg.axis().scale(x).tickSize(-h).tickSubdivide(true);
			// Add the x-axis.
			graph.append("svg:g")
			      .attr("class", "x axis")
			      .attr("transform", "translate(0," + h + ")")
			      .call(xAxis);
 
 
			// create left yAxis
			var yAxisLeft = d3.svg.axis().scale(y).ticks(4).orient("left");
			// Add the y-axis to the left
			graph.append("svg:g")
			      .attr("class", "y axis")
			      .attr("transform", "translate(-25,0)")
			      .call(yAxisLeft);
			
  			// Add the line by appending an svg:path element with the data line we created above
			// do this AFTER the axes above so that the line is above the tick-lines
  			graph.append("svg:path").attr("d", line(data));
			
</script>
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
</script>
</body>
</html>