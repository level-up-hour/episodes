'use strict';

angular.module('app').config([ '$routeProvider', function($routeProvider) {
  $routeProvider.when('/', {
    templateUrl : 'partials/home.html',
    controller : 'HomeController'
  }).otherwise({
    redirectTo : '/'
  });
} ]);
