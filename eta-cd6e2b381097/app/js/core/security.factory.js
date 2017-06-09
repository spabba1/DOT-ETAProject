System.register([], function(exports_1, context_1) {
    /// <reference path="./../types.ts" />
    'use strict';
    var __moduleName = context_1 && context_1.id;
    function SecurityFactory($cookies, $http, $log, $rootScope, Base64) {
        var service = {};
        service.test = function () {
            return true;
        };
        service.login = function (username, password) {
            return $http({
                data: $.param({
                    method: 'login',
                    password: password,
                    returnFormat: 'json',
                    username: username
                }),
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                method: 'POST',
                url: 'model/controller/Login.cfc'
            }).then(function (response) {
                return response;
            }, function (response) {
                return response;
            });
        };
        service.getAuthData = function () {
            var credentials = $http.defaults.headers.common.Authorization;
            var authdata = credentials.replace('Basic ', '');
            return authdata;
        };
        service.getCredentials = function () {
            var authdata = $http.defaults.headers.common.Authorization;
            var encodedCreds = authdata.replace('Basic ', '');
            var decodedCreds = Base64.decode(encodedCreds);
            return decodedCreds;
        };
        service.getCurrentUsername = function () {
            var creds = this.getCredentials();
            var username = creds.split(':')[0];
            return username;
        };
        service.setCredentials = function (username, password, isadmin) {
            var authdata = Base64.encode(username + ':' + password);
            $rootScope.globals = {
                currentUser: {
                    authdata: authdata,
                    isadmin: isadmin,
                    username: username
                }
            };
            $http.defaults.headers.common.Authorization = 'Basic ' + authdata;
            $cookies.putObject('globals', $rootScope.globals);
        };
        service.clearCredentials = function () {
            $rootScope.globals = {};
            $cookies.remove('globals');
            $http.defaults.headers.common.Authorization = 'Basic ';
        };
        return service;
    }
    return {
        setters:[],
        execute: function() {
            SecurityFactory.$inject = [
                '$cookies',
                '$http',
                '$log',
                '$rootScope',
                'Base64'
            ];
            ;
            exports_1("default",SecurityFactory);
        }
    }
});
//# sourceMappingURL=security.factory.js.map