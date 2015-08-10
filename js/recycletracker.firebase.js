// Firebase

  // Create our Firebase reference
  var myDataRef = new Firebase('https://recycletracker.firebaseIO.com/');

  myDataRef.on('child_added', function(snapshot) {
    //We'll fill this in later.
  });

  var message = snapshot.val();
  displayChatMessage(message.name, message.text);

  var LEADERBOARD_SIZE = 5;
 
  // Keep a mapping of firebase locations to HTML elements, so we can move / remove elements as necessary.
  var htmlForPath = {};

  // Helper function that takes a new score snapshot and adds an appropriate row to our leaderboard table.
  function handleScoreAdded(scoreSnapshot, prevScoreName) {
    var newScoreRow = $("<tr/>");
    newScoreRow.append($("<td/>").append($("<em/>").text(scoreSnapshot.val().dataname)));
    newScoreRow.append($("<td/>").text(scoreSnapshot.val().dataweight));

    // Store a reference to the table row so we can get it again later.
    htmlForPath[scoreSnapshot.key()] = newScoreRow;

    // Insert the new score in the appropriate place in the table.
    if (prevScoreName === null) {
      $("#leaderboardTable").append(newScoreRow);
    }
    else {
      var lowerScoreRow = htmlForPath[prevScoreName];
      lowerScoreRow.before(newScoreRow);
    }
  }

  // Helper function to handle a score object being removed; just removes the corresponding table row.
  function handleScoreRemoved(scoreSnapshot) {
    var removedScoreRow = htmlForPath[scoreSnapshot.key()];
    removedScoreRow.remove();
    delete htmlForPath[scoreSnapshot.key()];
  }

  // Create a view to only receive callbacks for the last LEADERBOARD_SIZE scores
  var scoreListView = scoreListRef.limitToLast(LEADERBOARD_SIZE);

  // Add a callback to handle when a new score is added.
  scoreListView.on('child_added', function (newScoreSnapshot, prevScoreName) {
    handleScoreAdded(newScoreSnapshot, prevScoreName);
  });

  // Add a callback to handle when a score is removed
  scoreListView.on('child_removed', function (oldScoreSnapshot) {
    handleScoreRemoved(oldScoreSnapshot);
  });

  // Add a callback to handle when a score changes or moves positions.
  var changedCallback = function (scoreSnapshot, prevScoreName) {
    handleScoreRemoved(scoreSnapshot);
    handleScoreAdded(scoreSnapshot, prevScoreName);
  };
  scoreListView.on('child_moved', changedCallback);
  scoreListView.on('child_changed', changedCallback);

  // When the user presses enter on scoreInput, add the score, and update the highest score.
  $("#scoreInput").keypress(function (e) {
    if (e.keyCode == 13) {
      var newScore = Number($("#scoreInput").val());
      var name = $("#nameInput").val();
      $("#scoreInput").val("");

      if (name.length === 0)
        return;

      var userScoreRef = scoreListRef.child(name);

      // Use setWithPriority to put the name / score in Firebase, and set the priority to be the score.
      userScoreRef.setWithPriority({ name:name, score:newScore }, newScore);
    }
  });


// Date functions  
    $( "#date" ).datepicker();
    var currentDate = $( ".selector" ).datepicker( "getDate" );

// Chart functions

var chart = c3.generate({
    bindto: '#donutchart',
    data: {
        // recyclePercent data
        columns: [
            ['Recycling', recycleData[0].dashboardRecyclePercent],
            ['Landfill', recycleData[1].dashboardRecyclePercent],
        ],
        type : 'donut',
        onclick: function (d, i) { console.log("onclick", d, i); },
        onmouseover: function (d, i) { console.log("onmouseover", d, i); },
        onmouseout: function (d, i) { console.log("onmouseout", d, i); }
    }
});

var chart = c3.generate({
    bindto: '#areachart',
    data: {
        columns: [
            ['Recycling', 300, 350, 300, 0, 0, 0],
            ['Landfill', 130, 100, 140, 200, 150, 50]
        ],
        types: {
            data1: 'area',
            data2: 'area-spline'
        }
    }
});


var chart = c3.generate({
    bindto: '#gaugechart',
    data: {
        columns: [
            ['Recycling Rate', recycleData[0].dashboardWeight],
        ],
        type: 'gauge',
        onclick: function (d, i) { console.log("onclick", d, i); },
        onmouseover: function (d, i) { console.log("onmouseover", d, i); },
        onmouseout: function (d, i) { console.log("onmouseout", d, i); }
    },
    gauge: {
//        label: {
//            format: function(value, ratio) {
//                return value;
//            },
//            show: false // to turn off the min/max labels.
//        },
//    min: 0, // 0 is default, //can handle negative min e.g. vacuum / voltage / current flow / rate of change
//    max: 100, // 100 is default
//    units: ' %',
//    width: 39 // for adjusting arc thickness
    },
    color: {
        pattern: ['#FF0000', '#F97600', '#F6C600', '#60B044'], // the three color levels for the percentage values.
        threshold: {
//            unit: 'value', // percentage is default
//            max: 200, // 100 is default
            values: [30, 60, 90, 100]
        }
    },
    size: {
        height: 180
    }
});

// Top Row functions

    $("#recyclePercent").text(recycleData[0].dashboardRecyclePercent);
    $("#recycleChange").text(recycleData[1].dashboardRecyclePercent);

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