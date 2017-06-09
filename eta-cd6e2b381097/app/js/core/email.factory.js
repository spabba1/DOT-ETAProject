System.register([], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    function EmailFactory($http, SecurityFactory) {
        var service = {};
        service.sendError = function (response) {
            var user = SecurityFactory.getCurrentUsername();
            // base 64 for easy transport of object
            return $http({
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                method: 'POST',
                params: {
                    method: 'internalServerError',
                    response: angular.toJson(response),
                    returnFormat: 'json',
                    user: user
                },
                url: 'model/services/mailer.cfc'
            });
        };
        return service;
    }
    return {
        setters:[],
        execute: function() {
            /// <reference path="./../types.ts" />
            EmailFactory.$inject = [
                '$http',
                'SecurityFactory'
            ];
            exports_1("default",EmailFactory);
        }
    }
});
//# sourceMappingURL=email.factory.js.map