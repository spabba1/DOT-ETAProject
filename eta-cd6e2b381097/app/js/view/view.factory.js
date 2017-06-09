System.register([], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    function ViewFactory($http, $log) {
        var service = {};
        service.getTa = function (taid, callback) {
            return $http({
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                method: 'POST',
                params: {
                    method: 'getTaByTaid',
                    returnFormat: 'json',
                    taid: taid
                },
                url: 'model/controller/Ta.cfc'
            }).then(function (response) {
                $log.info(response);
                callback(response);
            }, function (response) {
                $log.error(response);
                callback(response);
            });
        };
        return service;
    }
    return {
        setters:[],
        execute: function() {
            ViewFactory.$inject = [
                '$http',
                '$log'
            ];
            exports_1("default",ViewFactory);
        }
    }
});
//# sourceMappingURL=view.factory.js.map