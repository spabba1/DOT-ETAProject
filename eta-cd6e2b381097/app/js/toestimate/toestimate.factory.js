System.register([], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    function ToEstimateFactory($http, $log) {
        var service = {};
        service.getToEstimateList = function () {
            return $http({
                url: 'model/services/ta.cfc',
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                params: {
                    method: 'getTasInEstimation',
                    returnFormat: 'json'
                }
            }).then(function (response) {
                return response.data;
            }, function (response) {
                $log.error(response);
                return response;
            });
        };
        service.getRejectReason = function (taid) {
            return $http({
                url: 'model/services/ta.cfc',
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                params: {
                    method: 'getRejectReason',
                    returnFormat: 'json',
                    taid: taid
                }
            }).then(function (response) {
                $log.info(response.data);
                return response.data;
            }, function (response) {
                $log.error(response);
                return response;
            });
        };
        return service;
    }
    return {
        setters:[],
        execute: function() {
            ToEstimateFactory.$inject = [
                '$http',
                '$log'
            ];
            exports_1("default",ToEstimateFactory);
        }
    }
});
//# sourceMappingURL=toestimate.factory.js.map