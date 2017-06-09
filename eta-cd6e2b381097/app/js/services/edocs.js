/*global edocs */
'use strict';

edocs.factory('eDocsService', [
    '$http',
    '$log',
    'SecurityService',
    function (
        $http,
        $log,
        SecurityService
    ) {
        var service = {};

        service.sendPdfToeDocs = function () {

            var credentials = SecurityService.getCredentials();

            return credentials;
        };

        return service;
    }]);

