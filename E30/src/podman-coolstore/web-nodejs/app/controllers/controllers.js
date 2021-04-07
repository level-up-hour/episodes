'use strict';

angular.module('app')

    .controller("HomeController",
        ['$scope', '$http', '$filter', /*'Notifications',*/ 'catalog', 'Auth',
            function ($scope, $http, $filter, /*Notifications,*/ catalog, $auth) {

                $scope.products = [];

                $scope.isLoggedIn = function () {
                    return $auth.loggedIn;
                };
                $scope.ssoEnabled = function () {
                    return $auth.ssoEnabled;
                };

                $scope.login = function () {
                    $auth.login();
                };


                // initialize products
                catalog.getProducts().then(function (data) {
                    if (data.error != undefined && data.error != "") {
                        // Notifications.error("Error retrieving products: " + data.error);
                        return;
                    }
                    $scope.products = data.map(function (el) {
                        return {
                            quantity: "1",
                            product: el
                        }
                    })
                }, function (err) {
                    // Notifications.error("Error retrieving products: " + err.statusText);
                });


            }])

    .controller("HeaderController",
        ['$scope', '$location', '$http', 'Auth',
            function ($scope, $location, $http, $auth) {
                $scope.userInfo = $auth.userInfo;

                $scope.cartTotal = 0.0;
                $scope.itemCount = 0;

                $scope.isLoggedIn = function () {
                    return $auth.loggedIn;
                };

                $scope.login = function () {
                    $auth.login();
                };
                $scope.logout = function () {
                    $auth.logout();
                };
                $scope.isLoggedIn = function () {
                    return $auth.loggedIn;
                };
                $scope.ssoEnabled = function () {
                    return $auth.ssoEnabled;
                };
                $scope.profile = function () {
                    $auth.authz.accountManagement();
                };

                $scope.$watch(function () {
                    return $auth.userInfo;
                }, function (newValue) {
                    $scope.userInfo = newValue;
                });

                $scope.isActive = function (loc) {
                    return loc === $location.path();
                }
            }]);
