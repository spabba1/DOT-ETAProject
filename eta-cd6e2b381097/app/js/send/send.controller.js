System.register([], function(exports_1, context_1) {
    /// <reference path="./../types.ts" />
    'use strict';
    var __moduleName = context_1 && context_1.id;
    function SendController($log, $scope, $uibModal, $stateParams, ngToast, SendFactory, SecurityFactory) {
        var SendCtrl = this;
        var taid = $stateParams.taid;
        var authdata = SecurityFactory.getAuthData();
        SendCtrl.pleaseWait = SendFactory.createPdf(taid).then(function (response) {
            var pdfData = SendFactory.base64DecToArr(response.data);
            var etaPdf = new Blob([pdfData], { type: 'application/pdf' });
            var pdfUrl = URL.createObjectURL(etaPdf);
            $scope.pdfUrl = pdfUrl;
        });
        SendCtrl.scroll = 0;
        // SendCtrl.loading = 'Please wait... Generating PDF...';
        SendCtrl.getNavStyle = function (scroll) {
            if (scroll > 100) {
                return 'pdf-controls fixed';
            }
            return 'pdf-controls';
        };
        SendCtrl.onError = function (error) {
            $log.error(error);
        };
        SendCtrl.onLoad = function () {
            SendCtrl.loading = '';
        };
        SendCtrl.onProgress = function (progress) {
            $log.info(progress);
        };
        SendCtrl.sendForApproval = function () {
            var modalInstance = $uibModal.open({
                controller: 'SendForApprovalController',
                controllerAs: 'SendCtrl',
                resolve: {
                    approver: function () {
                        return SendCtrl.approver;
                    }
                },
                size: 'md',
                templateUrl: '/js/send/sendforapproval.html'
            });
            modalInstance.result.then(function (approver) {
                SendCtrl.pleaseWait = SendFactory.sendToEdocs(taid, approver.UID, authdata)
                    .then(function (response) {
                    console.dir(response);
                    if (response.status === 200) {
                        ngToast.create({
                            className: 'success',
                            content: 'TA has been checked into eDocs for approval.'
                        });
                    }
                    else {
                        ngToast.create({
                            className: 'danger',
                            // content: 'Something went wrong, your TA was not saved. Please try again.'
                            content: response.statusText
                        });
                        $location.path('/');
                    }
                }, function (response) {
                    $log.error('Something went wrong');
                    ngToast.create({
                        className: 'danger',
                        content: data.statusText
                    });
                    console.dir(response);
                });
            });
        };
    }
    return {
        setters:[],
        execute: function() {
            SendController.$inject = [
                '$log',
                '$scope',
                '$uibModal',
                '$stateParams',
                'ngToast',
                'SendFactory',
                'SecurityFactory'
            ];
            exports_1("default",SendController);
        }
    }
});
//# sourceMappingURL=send.controller.js.map