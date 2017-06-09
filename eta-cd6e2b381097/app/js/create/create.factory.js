/// <reference path="../types.ts" />
System.register([], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    function CreateFactory($http, $log) {
        var service = {};
        service.EmptyTaBeanService = function () {
            return $http({
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                method: 'POST',
                params: {
                    method: 'getTaBean',
                    returnFormat: 'json'
                },
                url: 'model/controller/Ta.cfc'
            }).then(function (response) {
                // set TA defaults
                response.data.ee = 1;
                response.data.instate = 1;
                response.data.physaddr = 0;
                response.data.warrantaddr = 0;
                response.data.hotelinc = 0;
                response.data.carinc = 0;
                response.data.actualsreq = 0;
                response.data.perstrav = 0;
                response.data.travadv = 0;
                return response.data;
            }, function (response) {
                $log.error(response);
                return response;
            });
        };
        service.EmptyOosBeanService = function () {
            return $http({
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                method: 'POST',
                params: {
                    method: 'getEmptyBean',
                    returnFormat: 'json'
                },
                url: 'model/controller/Oostate.cfc',
            }).then(function (response) {
                // set OOS defaults
                response.data.localoption = 0;
                response.data.groupable = 0;
                response.data.debrief = 0;
                return response.data;
            }, function (response) {
                $log.error(response);
                return response;
            });
        };
        service.findLdapUserService = function (val) {
            return $http({
                method: 'POST',
                params: {
                    method: 'findLdapUser',
                    returnFormat: 'json',
                    term: val
                },
                url: 'model/controller/Ldap.cfc'
            }).then(function (response) {
                $log.info(response);
                return response;
            }, function (response) {
                $log.error(response);
                return response;
            });
        };
        service.GetLdapUserService = {
            getUser: function (username) {
                /*var userObj = {};*/
                // $http returns a promise, which has a then function, which also
                // returns a promise
                var promise = $http({
                    method: 'POST',
                    params: {
                        method: 'getUserByUsername',
                        returnFormat: 'json',
                        username: username
                    },
                    url: 'model/controller/Ldap.cfc'
                }).then(function (response) {
                    // The then function here is an opportunity to modify the
                    // response
                    $log.info('response: ' + response);
                    // userObj.bu = response.data[0].BARGAININGUNIT;
                    // userObj.username = response.data[0].OU;
                    // userObj.deptnum = response.data[0].OU;
                    // userObj.ein = response.data[0].EMPLOYEENUMBER;
                    // userObj.dutystation = response.data[0].L;
                    // userObj.dept = response.data[0].OU;
                    // userObj.div = response.data[0].OU2;
                    // userObj.phone = response.data[0].OU2;
                    // userObj.title = response.data[0].TITLE;
                    // userObj.fullname = response.data[0].CN;
                    // userObj.address = response.data[0].;
                    // userObj.city = response.data[0].;
                    // userObj.state = response.data[0].;
                    // userObj.zip = response.data[0].;
                    // userObj.workdays = response.data[0].;
                    // userObj.worktime = response.data[0].;
                    // userObj.pvn = response.data[0].;
                    // The return value gets picked up by the then in the controller.
                    return response.data;
                });
                // Return the promise to the controller
                return promise;
            }
        };
        return service;
    }
    return {
        setters:[],
        execute: function() {
            CreateFactory.$inject = [
                '$http',
                '$log'
            ];
            exports_1("default",CreateFactory);
        }
    }
});
//# sourceMappingURL=create.factory.js.map