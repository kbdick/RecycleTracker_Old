'use strict';

/* Module and Controller */
/* global angular */

    var recycletrackerApp = angular.module('recycletrackerApp', ['ngRoute']);

// configure our routes
    recycletrackerApp.config(function($routeProvider) {
        $routeProvider

            // route for the home page
            .when('/', {
                templateUrl : 'pages/index.html',
                controller  : 'indexController'
            })

            // route for the reporting page
            .when('/reporter', {
                templateUrl : 'pages/reporter.html',
                controller  : 'reporterController'
            })

            // route for the collector page
            .when('/collector', {
                templateUrl : 'pages/collector.html',
                controller  : 'collectorController'
            });
    });


    // create the controller and inject Angular's $scope
    recycletrackerApp.controller('mainController', function($scope) {

        // create a message to display in our view
        $scope.message = 'RecycleTracker is Live!';
    });
    
    recycletrackerApp.controller('reporterController', function($scope) {

        // create a message to display in our view
        $scope.message = 'RecycleTracker is Live!';
    });
    
    recycletrackerApp.controller('collectorController', function($scope) {
        $scope.message = 'This is the Collector';
    });