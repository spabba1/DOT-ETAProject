/*global view*/
'use strict';

view.factory('WorkflowService', [
    '$http',
    '$log',
    'ngToast',
    function (
        $http,
        $log,
        ngToast
    ) {

        var service = {};

        service.approve = function (taid, authdata) {
            return $http({
                url: 'model/services/approval.cfc',
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                params: {
                    method: 'approve',
                    taid: taid,
                    authData: authdata,
                    returnFormat: 'json'
                }
            }).then(function (response) {
                $log.info(response);
                return response;
            }, function (response) {
                $log.error(response);
                ngToast.create({
                    className: 'danger',
                    content: response.statusText
                });

            });
        };

        service.reject = function (taid, reason, authdata) {
            return $http({
                url: 'model/services/approval.cfc',
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                params: {
                    method: 'reject',
                    taid: taid,
                    rejectReason: reason,
                    authData: authdata,
                    returnFormat: 'json'
                }
            }).then(function (response) {
                return response;
            }, function (response) {
                console.dir(response);
                return response;
            });
        };

        service.getTaidFromEdocsId = function (edocsid) {

            return $http({
                    url: 'model/services/ta.cfc',
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    params: {
                        method: 'getIdFromEdocsId',
                        dID: edocsid,
                        returnFormat: 'json'
                    }
            }).then(function (response) {
                return response;
            }, function (response) {
                $log.error(response);
            });
        };

        return service;
    }
]);
