  document.addEventListener('DOMContentLoaded', function() {
   	var URL = "1o2CslDz13ipgg7U3txgvRNMek38ul4S8UWJL_lravMQ";
  		Tabletop.init( { key: URL, callback: showInfo, simpleSheet: true } )
  	});

// Tabletop Callback
    function showInfo(data) {
    recycleData = data;
    console.log( "Here is your data", recycleData);


    var building = Sheetsee.getOccurance(recycleData, "recyclepercent");
        var colors = ['#ff00ff', '#acacac'];
        var lineData = Sheetsee.makeColorArrayOfObject(building, colors);
        var lineOptions = { units: "units",
                          labels: "undefined",
                          m: [80, 100, 120, 100],
                          w: 600, h: 450,
                          div: "#lineChart",
                          yaxis: "% Recycled",
                          hiColor: "#E4EB29"
                        };
    Sheetsee.d3LineChart(lineData, lineOptions);
    
    // D3 Line Chart
var lineChart = c3.generate({
    bindto: '#lineChart',
    data: 'recycleData[1]'
});

    
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

// Combobox
  (function( $ ) {
    $.widget( "custom.combobox", {
      _create: function() {
        this.wrapper = $( "<span>" )
          .addClass( "custom-combobox" )
          .insertAfter( this.element );
 
        this.element.hide();
        this._createAutocomplete();
        this._createShowAllButton();
      },
 
      _createAutocomplete: function() {
        var selected = this.element.children( ":selected" ),
          value = selected.val() ? selected.text() : "";
 
        this.input = $( "<input>" )
          .appendTo( this.wrapper )
          .val( value )
          .attr( "title", "" )
          .addClass( "custom-combobox-input ui-widget ui-widget-content ui-state-default ui-corner-left" )
          .autocomplete({
            delay: 0,
            minLength: 0,
            source: $.proxy( this, "_source" )
          })
          .tooltip({
            tooltipClass: "ui-state-highlight"
          });
 
        this._on( this.input, {
          autocompleteselect: function( event, ui ) {
            ui.item.option.selected = true;
            this._trigger( "select", event, {
              item: ui.item.option
            });
          },
 
          autocompletechange: "_removeIfInvalid"
        });
      },
 
      _createShowAllButton: function() {
        var input = this.input,
          wasOpen = false;
 
        $( "<a>" )
          .attr( "tabIndex", -1 )
          .attr( "title", "Show All Items" )
          .tooltip()
          .appendTo( this.wrapper )
          .button({
            icons: {
              primary: "ui-icon-triangle-1-s"
            },
            text: false
          })
          .removeClass( "ui-corner-all" )
          .addClass( "custom-combobox-toggle ui-corner-right" )
          .mousedown(function() {
            wasOpen = input.autocomplete( "widget" ).is( ":visible" );
          })
          .click(function() {
            input.focus();
 
            // Close if already visible
            if ( wasOpen ) {
              return;
            }
 
            // Pass empty string as value to search for, displaying all results
            input.autocomplete( "search", "" );
          });
      },
 
      _source: function( request, response ) {
        var matcher = new RegExp( $.ui.autocomplete.escapeRegex(request.term), "i" );
        response( this.element.children( "option" ).map(function() {
          var text = $( this ).text();
          if ( this.value && ( !request.term || matcher.test(text) ) )
            return {
              label: text,
              value: text,
              option: this
            };
        }) );
      },
 
      _removeIfInvalid: function( event, ui ) {
 
        // Selected an item, nothing to do
        if ( ui.item ) {
          return;
        }
 
        // Search for a match (case-insensitive)
        var value = this.input.val(),
          valueLowerCase = value.toLowerCase(),
          valid = false;
        this.element.children( "option" ).each(function() {
          if ( $( this ).text().toLowerCase() === valueLowerCase ) {
            this.selected = valid = true;
            return false;
          }
        });
 
        // Found a match, nothing to do
        if ( valid ) {
          return;
        }
 
        // Remove invalid value
        this.input
          .val( "" )
          .attr( "title", value + " didn't match any item" )
          .tooltip( "open" );
        this.element.val( "" );
        this._delay(function() {
          this.input.tooltip( "close" ).attr( "title", "" );
        }, 2500 );
        this.input.autocomplete( "instance" ).term = "";
      },
 
      _destroy: function() {
        this.wrapper.remove();
        this.element.show();
      }
    });
  })( jQuery );
  
  //end combobox