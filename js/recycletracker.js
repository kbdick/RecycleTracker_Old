// Tabletop Handlebars and Sheetsee
document.addEventListener('DOMContentLoaded', function() {
   	var URL = "1o2CslDz13ipgg7U3txgvRNMek38ul4S8UWJL_lravMQ"
  		Tabletop.init( { key: URL, callback: showInfo, parseNumbers: true, simpleSheet: true } )
  	

    function showInfo(data) {
    recycleData = data;
    console.log( "Here is your data", recycleData);
    $( "#date" ).datepicker();
        
        var currentDate = $( ".selector" ).datepicker( "getDate" );
        var building = Sheetsee.getOccurance(recycleData, "weight")
        var colors = ['#ff00ff', '#acacac']
        var buildingData = Sheetsee.makeColorArrayOfObject(building, colors)
        var lineOptions = { units: "units",
                          labels: "undefined",
                          m: [80, 100, 120, 100],
                          w: 600, h: 450,
                          div: "#martTest",
                          yaxis: "Lbs Recycled",
                          hiColor: "#E4EB29"
                        }
        Sheetsee.d3LineChart(buildingData, lineOptions)
    $("#recyclePercent").text("recycleData[0].recyclePercent");
    $("#recycleChange").text("recycleData[0].recycleChange");
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