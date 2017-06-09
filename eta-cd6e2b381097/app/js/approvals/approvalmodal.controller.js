System.register([], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    function ApprovalModalController($scope, $location, $log, $uibModal, $uibModalInstance, ngToast, EmailFactory, SendFactory, SecurityFactory, WorkflowFactory, taid) {
        var ApprovalsCtrl = this;
        ApprovalsCtrl.authdata = SecurityFactory.getAuthData();
        ApprovalsCtrl.pleaseWait = SendFactory.createPdf(taid).then(function (response) {
            var pdfData = SendFactory.base64DecToArr(response.data);
            var etaPdf = new Blob([pdfData], { type: 'application/pdf' });
            var pdfUrl = URL.createObjectURL(etaPdf);
            $scope.pdfUrl = pdfUrl;
        });
        ApprovalsCtrl.approve = function () {
            ApprovalsCtrl.pleaseWait = WorkflowFactory.approve(taid, ApprovalsCtrl.authdata)
                .then(function (response) {
                console.dir(response);
                if (response.data.STATUS === 'success') {
                    ngToast.create({
                        className: response.data.STATUS,
                        content: response.data.MESSAGE
                    });
                }
                else {
                    console.dir(response);
                    EmailFactory.sendError(response);
                    if (response.status > 200) {
                        ngToast.create({
                            className: 'danger',
                            content: response.statusText
                        });
                    }
                    else {
                        ngToast.create({
                            className: response.data.STATUS,
                            content: response.data.MESSAGE
                        });
                    }
                }
                $uibModalInstance.close();
            });
        };
        ApprovalsCtrl.reject = function () {
            var modalInstance = $uibModal.open({
                animation: true,
                controller: 'RejectReasonModalController',
                controllerAs: 'RejectReasonCtrl',
                templateUrl: 'js/approvals/reject-reason.html',
            });
            modalInstance.result.then(function (reason) {
                ApprovalsCtrl.pleaseWait = WorkflowFactory.reject(taid, reason, ApprovalsCtrl.authdata)
                    .then(function (response) {
                    if (response.data.STATUS === 'success') {
                        ngToast.create({
                            className: response.data.STATUS,
                            content: response.data.MESSAGE
                        });
                    }
                    else {
                        console.dir(response);
                        EmailFactory.sendError(response);
                        if (response.status > 200) {
                            ngToast.create({
                                className: 'danger',
                                content: response.statusText
                            });
                        }
                        else {
                            ngToast.create({
                                className: 'danger',
                                content: response.data.DETAILS.Message
                            });
                        }
                    }
                    $uibModalInstance.close();
                });
            });
        };
    }
    return {
        setters:[],
        execute: function() {
            ApprovalModalController.$inject = [
                '$scope',
                '$location',
                '$log',
                '$uibModal',
                '$uibModalInstance',
                'ngToast',
                'EmailFactory',
                'SendFactory',
                'SecurityFactory',
                'WorkflowFactory',
                'taid'
            ];
            ;
            exports_1("default",ApprovalModalController);
        }
    }
});
//# sourceMappingURL=approvalmodal.controller.js.map