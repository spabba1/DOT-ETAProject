System.register([], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    function HomeController($rootScope, $log, $http, $scope, $window) {
        var HomeCtrl = this;
        HomeCtrl.isadmin = $rootScope.globals.currentUser.isadmin;
        HomeCtrl.username = $rootScope.globals.currentUser.username;
        HomeCtrl.doBusy = function () {
            $scope.pleaseWait = $http({
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                method: 'POST',
                params: {
                    method: 'timeoutTest',
                    returnFormat: 'json'
                },
                url: 'model/controller/Testing.cfc'
            }).then(function (response) {
                $log.info(response);
            }, function (response) {
                $log.error(response);
                // if error
            });
        };
    }
    return {
        setters:[],
        execute: function() {
            /*interface HomeCtrlScope extends ng.IScope {
                isadmin: boolean;
                username: string;
            }
            */
            HomeController.$inject = [
                '$rootScope',
                '$log',
                '$http',
                '$scope',
                '$window'
            ];
            ;
            exports_1("default",HomeController);
        }
    }
});
//# sourceMappingURL=home.controller.js.map