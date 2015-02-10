// Display Date
$( "#date" ).datepicker();
// End Display Date

// Royal Slider
jQuery(document).ready(function($) {
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
});
// End Royal Slider
   
// Tabletop and Sheetsee
  document.addEventListener('DOMContentLoaded', function() {
   	var URL = "1o2CslDz13ipgg7U3txgvRNMek38ul4S8UWJL_lravMQ"
  		Tabletop.init( { key: URL, callback: showInfo, simpleSheet: true } )
  	})

    function showInfo(data) {
      var building = Sheetsee.getOccurance(data, "weight")
      var colors = ['#ff00ff', '#acacac']
      var buildingData = Sheetsee.makeColorArrayOfObject(building, colors)
      var lineOptions = { units: "units",
                          labels: "undefined",
                          m: [80, 100, 120, 100],
                          w: 800, h: 400,
                          div: "#martTest",
                          yaxis: "Lbs Recycled",
                          hiColor: "#E4EB29"
                        }
      Sheetsee.d3LineChart(buildingData, lineOptions)
    }
// End Tabletop and Sheetsee

// Today's Recycling Rate

function todayRate(data) {
  var martDate = Sheetsee.getOccurance(data, "date")
  var currentDate = $( ".selector" ).datepicker( "getDate" );
}

// Handlebars
function showInfo(data, tabletop) {
        var source   = $("#ticker").html();
        var template = Handlebars.compile(source);
        $.each( tabletop.sheets("Sheet1").all(), function(i, floor) {
          var html = template(floor);
          $("#container").append(html);
        });
      }