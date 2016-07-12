'use strict';

/* Controllers */

angular.module('myApp.controllers', []).
  controller('MyCtrl1', ['$scope',
    function($scope) {
      $scope.name = 'Jay';
    }
])
  .controller('MyCtrl2', [
    function() {

    }
]);