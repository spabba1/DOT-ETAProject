/*global angular*/
angular.module('pdfcreator', [])
    .controller('pdfController', [
        '$scope',
        '$log',
        '$window',
        'pdfCreatorFactory',
        function (
            $scope,
            $log,
            $window,
            pdfCreatorFactory
        ) {
            'use strict';
            var taid = 222;
            $scope.ta = {};
            $scope.testvariable = 'test';
            pdfCreatorFactory.getTa(taid, function (response) {
                $scope.ta = response;
            });
            //		$log.info(window.parent);
            //		window.parent.sendData();
        }
    ])

    .factory('pdfCreatorFactory', [
        '$http',
        '$log',
        '$window',
        function (
            $http,
            $log,
            $window
        ) {
            'use strict';
            var service = {};

            service.getTa = function (taid, callback) {
                $http({
                    url: '../model/services/ta.cfc',
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    params: {
                        method: 'getTaByTaid',
                        taid: taid,
                        returnFormat: 'json'
                    }
                }).then(function (response) {
                    $log.info(response);
                    callback(response.data);
                }, function (response) {
                    $log.error(response);
                    $window.alert('An error has occured in pdfCreatorFactory.getTa.');
                });
            };

            return service;
        }
]);

