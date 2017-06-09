System.register([], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    function DeleteFactory($http, $log) {
        var DeleteFcty = this;
        DeleteFcty.recycleTa = function (taid, deletor) {
            return $http({
                url: 'model/services/ta.cfc',
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                params: {
                    method: 'recycle',
                    returnFormat: 'json',
                    taid: taid,
                    deletor: deletor,
                    status: 'Pre-Trip'
                }
            }).then(function (results) {
                return results.data;
            }, function (results) {
                $log.error(results);
                return results;
            });
        };
        DeleteFcty.DeleteTa = function (taid) {
            return $http({
                url: 'model/services/ta.cfc',
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                params: {
                    method: 'permDelete',
                    returnFormat: 'json',
                    taid: taid
                }
            }).then(function (results) {
                return results.data;
            }, function (results) {
                $log.error(results);
                return results;
            });
        };
        return DeleteFcty;
    }
    return {
        setters:[],
        execute: function() {
            /// <reference path="./../types.ts" />
            DeleteFactory.$inject = [
                '$http',
                '$log'
            ];
            exports_1("default",DeleteFactory);
        }
    }
});
//# sourceMappingURL=delete.factory.js.map