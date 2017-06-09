System.register([], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    function StaffFactory($http, $log, $window, ngToast) {
        var StaffFactory = {};
        var msgs = [];
        StaffFactory.getStaffList = function () {
            return $http({
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                method: 'POST',
                params: {
                    method: 'getAllStaff',
                    returnFormat: 'json'
                },
                url: 'model/controller/Staff.cfc'
            }).then(function (response) {
                return response.data;
            }, function (response) {
                ngToast.create({
                    className: 'danger',
                    content: response.MESSAGE.LocalizedMessage
                });
                $log.error(response);
                return response;
            });
        };
        StaffFactory.getStaffRolesAjax = function () {
            return $http({
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                method: 'POST',
                params: {
                    method: 'getStaffRoles',
                    returnFormat: 'json'
                },
                url: 'model/controller/Staffrole.cfc'
            }).then(function (response) {
                var returnArray = [];
                for (var i = 0; i < response.data.length; i += 1) {
                    returnArray.push({
                        name: response.data[i].name,
                        value: response.data[i].value
                    });
                }
                return returnArray;
            }, function (response) {
                ngToast.create({
                    className: 'danger',
                    content: response.MESSAGE.LocalizedMessage
                });
                $log.error(response);
                return response;
            });
        };
        StaffFactory.notify = function (msg) {
            msgs.push(msg);
            if (msgs.length === 3) {
                $window.alert(msgs.join('\n'));
                msgs = [];
            }
        };
        StaffFactory.getStaffRoles = function () {
            return $http({
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                method: 'POST',
                params: {
                    method: 'getAll',
                    returnFormat: 'JSON'
                },
                url: 'model/controller/Staffrole.cfc'
            }).then(function (response) {
                return response.data;
            }, function (response) {
                ngToast.create({
                    className: 'danger',
                    content: response.MESSAGE.LocalizedMessage
                });
                $log.error(response);
                return response;
            });
        };
        StaffFactory.getMileageRate = function () {
            return $http({
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                method: 'POST',
                params: {
                    method: 'getLatest',
                    returnFormat: 'json'
                },
                url: 'model/controller/Mileagerate.cfc'
            }).then(function (response) {
                return response.data;
            }, function (response) {
                $log.error(response);
                return response;
            });
        };
        StaffFactory.updateMileageRate = function (data) {
            return $http({
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                method: 'POST',
                params: {
                    data: data,
                    method: 'create',
                    returnFormat: 'json'
                },
                url: 'model/controller/Mileagerate.cfc'
            }).then(function (response) {
                return response.data;
            }, function (response) {
                $log.error(response);
                return response;
            });
        };
        StaffFactory.getStaffMember = function (etauserid) {
            return $http({
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                method: 'POST',
                params: {
                    method: 'getStaffById',
                    returnFormat: 'json',
                    staffId: etauserid
                },
                url: 'model/controller/Staff.cfc'
            }).then(function (response) {
                return response.data;
            }, function (response) {
                ngToast.create({
                    className: 'danger',
                    content: response.MESSAGE.LocalizedMessage
                });
                $log.error(response);
                return response;
            });
        };
        StaffFactory.getIdFromUsername = function (username) {
            return $http({
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                method: 'POST',
                params: {
                    method: 'getIdFromUsername',
                    returnFormat: 'json',
                    username: username
                },
                url: 'model/controller/Staff.cfc'
            }).then(function (response) {
                return response.data;
            }, function (response) {
                ngToast.create({
                    className: 'danger',
                    content: response.MESSAGE.LocalizedMessage
                });
                console.dir(response);
                return response;
            });
        };
        StaffFactory.addStaffMember = function (etauser) {
            return $http({
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                method: 'POST',
                params: {
                    method: 'addStaff',
                    returnFormat: 'json',
                    staff: etauser
                },
                url: 'model/controller/Staff.cfc'
            }).then(function (response) {
                return response.data;
            }, function (response) {
                if (response.status > 200) {
                    ngToast.create({
                        className: 'danger',
                        content: response.statusText
                    });
                    $log.error(response.data);
                }
                else {
                    ngToast.create({
                        className: 'danger',
                        content: response.MESSAGE.LocalizedMessage
                    });
                    $log.error(response);
                }
                return;
            });
        };
        StaffFactory.updateStaffMember = function (etauser) {
            return $http({
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                method: 'POST',
                params: {
                    method: 'updateStaff',
                    returnFormat: 'json',
                    staff: etauser
                },
                url: 'model/controller/Staff.cfc'
            }).then(function (response) {
                return response.data;
            }, function (response) {
                if (response.status > 200) {
                    ngToast.create({
                        className: 'danger',
                        content: response.statusText
                    });
                    $log.error(response.data);
                }
                else {
                    ngToast.create({
                        className: 'danger',
                        content: response.MESSAGE.LocalizedMessage
                    });
                    $log.error(response);
                }
                return;
            });
        };
        return StaffFactory;
    }
    return {
        setters:[],
        execute: function() {
            StaffFactory.$inject = [
                '$http',
                '$log',
                '$window',
                'ngToast'
            ];
            exports_1("default",StaffFactory);
        }
    }
});
// vim: set foldmethod=syntax:foldlevel=3://
//# sourceMappingURL=staff.factory.js.map