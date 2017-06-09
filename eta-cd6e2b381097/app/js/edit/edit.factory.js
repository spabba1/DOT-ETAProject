System.register([], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    function EditFactory($http, $log) {
        var EditFactory = this;
        EditFactory.getTa = function (taid, callback) {
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
                callback(response);
            }, function (response) {
                callback(response);
            });
        };
        EditFactory.getOos = function (taid, callback) {
            return $http({
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                method: 'POST',
                params: {
                    method: 'getByTaid',
                    returnFormat: 'json',
                    taid: taid
                },
                url: 'model/controller/Oostate.cfc'
            }).then(function (response) {
                callback(response);
            }, function (response) {
                $log.error(response);
                callback(response);
            });
        };
        return EditFactory;
    }
    return {
        setters:[],
        execute: function() {
            EditFactory.$inject = [
                '$http',
                '$log'
            ];
            exports_1("default",EditFactory);
        }
    }
});
//# sourceMappingURL=edit.factory.js.map