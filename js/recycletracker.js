// Tabletop Handlebars and Sheetsee
document.addEventListener('DOMContentLoaded', function() {
   	var URL = "1o2CslDz13ipgg7U3txgvRNMek38ul4S8UWJL_lravMQ"
  		Tabletop.init( { key: URL, callback: showInfo, parseNumbers: true, simpleSheet: true } )
  	

    function showInfo(data) {
    recycleData = data;
    console.log( "Here is your data", recycleData);
    $( "#date" ).datepicker();
        
        var currentDate = $( ".selector" ).datepicker( "getDate" );
        var percent = Sheetsee.getOccurance(recycleData, "recyclePercent")
        var change = Sheetsee.getOccurance(recycleData, "recycleChange")
        var colors = ['#ff00ff', '#acacac']
        var lineData = Sheetsee.makeColorArrayOfObject(percent, colors)
        var barData = Sheetsee.makeColorArrayOfObject(change, colors)
        var lineOptions = { units: "recyclePercent",
                          labels: "recyclePercent",
                          m: [80, 100, 120, 100],
                          w: 600, h: 450,
                          div: "#lineChart",
                          yaxis: "Percent",
                          hiColor: "#E4EB29"
                        }
        var barOptions = { units: "recycleChange",
                          labels: "recycleChange",
                          m: [80, 100, 120, 100],
                          w: 600, h: 450,
                          div: "#barChart",
                          xaxis: "Change from Last Month",
                          hiColor: "#E4EB29"
                        }
        Sheetsee.d3LineChart(lineData, lineOptions)
        Sheetsee.d3BarChart(barData, barOptions)
        
        

    $("#recyclePercent").text(recycleData[1].recyclePercent);
    $("#recycleChange").text(recycleData[1].recycleChange);
    }

    $(".royalSlider").royalSlider({
        autoScaleSlider: 'true',
        autoScaleSliderHeight: 450,
        imgScaleMode: 'fit',
        imageAlignCenter: 'false',
        controlNavigation: 'bullets',
        numImagesToPreload: 8,
        arrowsNav: 'true',
        arrowsNavAutoHide: 'true',
        arrowsNavHideOnTouch: 'true',
    	transitionType: 'fade',
    	sliderDrag: 'true',
    	sliderTouch: 'true',
    	loop: 'true',
    	allowCSS3: 'true',
    	usePreloader: 'true',
    	keyboardNavEnabled: 'true',
    	controlsInside: 'true',
    	deeplinking: { 
    	    enabled: 'true',
    	    change: 'true',
    	    prefix: 'recycle-'}
    });
    
})