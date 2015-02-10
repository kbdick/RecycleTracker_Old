  document.addEventListener('DOMContentLoaded', function() {
   	var URL = "1o2CslDz13ipgg7U3txgvRNMek38ul4S8UWJL_lravMQ";
  		Tabletop.init( { key: URL, callback: showInfo, simpleSheet: true } )
  	});

    function showInfo(data) {
      var cali = Sheetsee.getOccurance(data, "weight")
      var colors = ['#5cb85c', '#acacac'];
      var caliData = Sheetsee.makeColorArrayOfObject(cali, colors)
      var lineOptions = { units: "Weight",
                          labels: "weight",
                          m: [10, 10, 10, 10],
                          w: 800, h: 400,
                          div: "#pennies",
                          yaxis: "Weight",
                          hiColor: "#E4EB29"
                        };
      Sheetsee.d3LineChart(caliData, lineOptions);
    }
    
    <!--Handlebars for clean UI templating-->
<script src="js/handlebars-v2.0.0.js"></script>