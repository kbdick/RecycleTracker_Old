document.addEventListener('DOMContentLoaded', function() {
   	var URL = "1LnQsIM5kSHl4g1aYNoT7-3bvB0yp2EWE1p20r56XEc8";
  		Tabletop.init( { 
  		key: URL, 
  		callback: showInfo, 
  		parseNumbers: true,
  		wanted: [ "Data", "percentToday" ],
  		simpleSheet: true 
  		} );
  	
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

// Date functions  
    $( "#date" ).datepicker();
    var currentDate = $( ".selector" ).datepicker( "getDate" );

// Chart functions

var chart = c3.generate({
    data: {
        // recyclePercent data
        columns: [
            ['data1', recycleData[0].recyclepercent],
            ['data2', recycleData[1].recyclepercent],
        ],
        type : 'pie',
        onclick: function (d, i) { console.log("onclick", d, i); },
        onmouseover: function (d, i) { console.log("onmouseover", d, i); },
        onmouseout: function (d, i) { console.log("onmouseout", d, i); }
    }
});

// Top Row functions

    $("#recyclePercent").text(recycleData[1].recyclepercent);
    $("#recycleChange").text(recycleData[2].recyclepercent);

// Autocomplete with categories    
      $.widget( "custom.catcomplete", $.ui.autocomplete, {
    _create: function() {
      this._super();
      this.widget().menu( "option", "items", "> :not(.ui-autocomplete-category)" );
    },
    _renderMenu: function( ul, items ) {
      var that = this,
        currentCategory = "";
      $.each( items, function( index, item ) {
        var li;
        if ( item.category != currentCategory ) {
          ul.append( "<li class='ui-autocomplete-category'>" + item.category + "</li>" );
          currentCategory = item.category;
        }
        li = that._renderItemData( ul, item );
        if ( item.category ) {
          li.attr( "aria-label", item.category + " : " + item.label );
        }
      });
    }
  });
  
    $(function() {
    var availableTags = [
      { label: "Office of the Building", category: "Tenants" },
      { label: "Carlisle Wide Floor", category: "Tenants" },
      { label: "Exquisit Surfaces", category: "Tenants" },
      { label: "Porcelanosa", category: "Tenants" },
      { label: "Urban Archaeology", category: "Tenants" },
      { label: "Merlin Media", category: "Tenants" },
      { label: "Chicago Focus", category: "Tenants" },
      { label: "WPP/JWT", category: "Tenants" },
      { label: "Kennedy Office", category: "Tenants" },
      { label: "Viox (5th/3rd Bank)", category: "Tenants" },
      { label: "Steelcase", category: "Tenants" },
      { label: "Haworth", category: "Tenants" },
      { label: "Steelcase Education", category: "Tenants" },
      { label: "CTU Suite", category: "Tenants" },
      { label: "Publicis (4-150)", category: "Tenants" },
      { label: "MSL (Publicis)", category: "Tenants" },
      { label: "AIU", category: "Tenants" },
      { label: "Go Health", category: "Tenants" },
      { label: "Publicis (550)", category: "Tenants" },
      { label: "Williams Labadie", category: "Tenants" },
      { label: "Spark", category: "Tenants" },
      { label: "CCC-Suite", category: "Tenants" },
      { label: "Nutrasweet", category: "Tenants" },
      { label: "Cook Architecture", category: "Tenants" },
      { label: "A Pamerantz", category: "Tenants" },
      { label: "Chopping Block", category: "Tenants" },
      { label: "OSD", category: "Tenants" },
      { label: "Invision Carpet", category: "Tenants" },
      { label: "Coaless", category: "Tenants" },
      { label: "Design Tex", category: "Tenants" },
      { label: "Andreu World", category: "Tenants" },
      { label: "Maharam", category: "Tenants" },
      { label: "Milliken", category: "Tenants" },
      { label: "Nucraft", category: "Tenants" },
      { label: "Vitra", category: "Tenants" },
      { label: "Razorfish", category: "Tenants" },
      { label: "Dessin Fournir", category: "Tenants" },
      { label: "George Smith", category: "Tenants" },
      { label: "Reddington Designs", category: "Tenants" },
      { label: "USGBC", category: "Tenants" },
      { label: "Cannon Frank", category: "Tenants" },
      { label: "Diffa", category: "Tenants" },
      { label: "Bentwood", category: "Tenants" },
      { label: "North Cape International", category: "Tenants" },
      { label: "Dragosz/Luxana", category: "Tenants" },
      { label: "Allscripts", category: "Tenants" },
      { label: "Saachi & Saachi", category: "Tenants" },
      { label: "Dunnhumby", category: "Tenants" },
      { label: "Motorola", category: "Tenants" },
      { label: "Yelp", category: "Tenants" },
      { label: "1871", category: "Tenants" },
      { label: "Chicago School of Professional Psychology", category: "Tenants" },
      { label: "Potbelly (23)", category: "Tenants" },
      { label: "Potbelly (24)", category: "Tenants" },
      { label: "1st Floor", category: "Floor" },
      { label: "2nd Floor", category: "Floor" },
      { label: "3rd Floor", category: "Floor" },
      { label: "4th Floor", category: "Floor" },
      { label: "5th Floor", category: "Floor" },
      { label: "6th Floor", category: "Floor" },
      { label: "7th Floor", category: "Floor" },
      { label: "8th Floor", category: "Floor" },
      { label: "9th Floor", category: "Floor" },
      { label: "10th Floor", category: "Floor" },
      { label: "11th Floor", category: "Floor" },
      { label: "12th Floor", category: "Floor" },
      { label: "13th Floor", category: "Floor" },
      { label: "14th Floor", category: "Floor" },
      { label: "15th Floor", category: "Floor" },
      { label: "16th Floor", category: "Floor" },
      { label: "17th Floor", category: "Floor" },
      { label: "18th Floor", category: "Floor" },
      { label: "19th Floor", category: "Floor" },
      { label: "20th Floor", category: "Floor" },
      { label: "21st Floor", category: "Floor" },
      { label: "22nd Floor", category: "Floor" },
      { label: "23rd Floor", category: "Floor" },
      { label: "24th Floor", category: "Floor" },
      { label: "The Merchandise Mart", category: "Building" }
    ];
    $( "#tags" ).catcomplete({
      delay: 0,
      source: availableTags
    });
  });
    }

    $('#leftcontent').royalSlider({
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
    
        $('#rightcontent').royalSlider({
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