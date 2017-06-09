System.register([], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    function ApprovedFactory($http, $log) {
        var ApprovedFactory = {};
        ApprovedFactory.getApprovalPath = function (taid) {
            return $http({
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                method: 'POST',
                params: {
                    method: 'getApprovalPath',
                    returnFormat: 'json',
                    taid: taid
                },
                url: 'model/controller/Eta_log.cfc'
            }).then(function (response) {
                return response.data;
            }, function (response) {
                $log.error(response);
                return response;
            });
        };
        return ApprovedFactory;
    }
    return {
        setters:[],
        execute: function() {
            ApprovedFactory.$inject = [
                '$http',
                '$log'
            ];
            exports_1("default",ApprovedFactory);
        }
    }
});
//# sourceMappingURL=approved.factory.js.map