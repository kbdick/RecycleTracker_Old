// Register firebase module                                                                                         
var app = angular.module("app", ["firebase"]);

// Set up controller function                                                                                       
app.controller("Ctrl", function($scope, $firebase) {
    var firebaseRef = new Firebase(
      "https://recycletracker.firebaseio.com"                                                          
    );
    // create an AngularFire ref to the data                                                                        
    var sync = $firebase(firebaseRef);

    // pull the data into a local model                                                                             
    var syncObject = sync.$asObject();

    // sync the object with three-way data binding                                                                  
    syncObject.$bindTo($scope, "data");
    
   // Recycling Rate Queries
    var reyclingquery = $scope.orderByChild("wastetype").equalTo("Recycling").on("child_added", function(snapshot) {
  console.log(snapshot.key() + " was " + snapshot.val().dataweight + " lbs");
    })

    var landfillquery = $scope.orderByChild("wastetype").equalTo("Landfill").on("child_added", function(snapshot) {
  console.log(snapshot.key() + " was " + snapshot.val().dataweight + " lbs");
    })  
    
        $scope.todayRecycling = function(){
    var total = 0;
    for(var i = 0; i < $scope.data.length; i++){
        var todayRecycling= $scope.data.dataweight[i];
        total += (dataweight);
    }
    return total;
  
});
