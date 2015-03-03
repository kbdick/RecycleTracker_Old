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
    
$.each( tabletop.sheets("Sheet1").all(), function(i, floor) {
      var html = template(floor);
          
      var template = Handlebars.compile(source);
$.each( tabletop.sheets("mmart").all(), function(i, row) {
      var html = template(row);
      $("#tickerrow").append(html);
      var source   = $("#ticker").html();
      
      <script src="js/jquery-ui-1.11.2/external/jquery/jquery.js"></script>
      
      <!--Handlebars for clean UI templating-->
<script src="js/handlebars-v2.0.0.js"></script>

var yesterday = mmart.monthTotalKwh * dashboardData.electricSupplyCharge + dashboardData.monthTotalKwh * dashboardData.transmissionServicesCharge + dashboardData.purchasedElectricityAdjustment;
		    var delivery = dashboardData.customerCharge + dashboardData.standardMeterCharge + dashboardData.monthTotalKwh * dashboardData.distributionFacilitiesCharge + dashboardData.monthTotalKwh * dashboardData.ILDistributionCharge;
		    var taxesFees = dashboardData.monthTotalKwh * dashboardData.enviromentalCostRecoveryAdjustment + dashboardData.monthTotalKwh * dashboardData.energyEfficientProgram + dashboardData.franchiseCost + dashboardData.stateTax + dashboardData.municipalTax;
		    var total = supply + delivery + taxesFees;
		    return total.toFixed(2);
	      }
	      
	  function getAverage() {
		    var supply = dashboardData.monthTotalKwh * dashboardData.electricSupplyCharge + dashboardData.monthTotalKwh * dashboardData.transmissionServicesCharge + dashboardData.purchasedElectricityAdjustment;
		    var delivery = dashboardData.customerCharge + dashboardData.standardMeterCharge + dashboardData.monthTotalKwh * dashboardData.distributionFacilitiesCharge + dashboardData.monthTotalKwh * dashboardData.ILDistributionCharge;
		    var taxesFees = dashboardData.monthTotalKwh * dashboardData.enviromentalCostRecoveryAdjustment + dashboardData.monthTotalKwh * dashboardData.energyEfficientProgram + dashboardData.franchiseCost + dashboardData.stateTax + dashboardData.municipalTax;
		    var total = supply + delivery + taxesFees;
		    return total.toFixed(2);
	      }
    }
    
            var todayChang = function getTodayChange() {
		    var yesterday = moment().subtract(1, 'day');
		    var yesterdayRate = $.grep( recycleData, function( n, i ) { return n > 0;
        });
        }

