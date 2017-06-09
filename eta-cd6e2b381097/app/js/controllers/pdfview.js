/*global document, pdfview */
'use strict';
pdfview.controller('PdfViewController', [
    '$scope',
    '$log',
    '$stateParams',
    function (
        $scope,
        $log,
        $stateParams
    ) {

        $scope.data = {};
        $scope.data.testvariable = 'TEST VARIABLE';
        $scope.data.taid = $stateParams.taid;

        $scope.sendData = function () {
            $scope.iframe = document.getElementById('pdf-frame').contentWindow.setTa($scope.data);
        };
        //$scope.iframe.setTa($scope.taid);
        //document.getElementById('pdf-frame').contentWindow.updatedata($scope.data);
        //$log.info(document.getElementById('pdf-frame').contentWindow.setTa($scope.data));
        //document.getElementById('pdf-frame').contentWindow.setTa($scope.data);
        //document.getElementById('pdf-frame').contentWindow.setTa($scope.data);
        //$log.info(document.getElementById('pdf-frame').contentWindow.setTa);
    }
]);
