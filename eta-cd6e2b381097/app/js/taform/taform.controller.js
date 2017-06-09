/// <reference path='../types.ts' />
System.register([], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    function TaFormController($http, $location, $log, $scope, $uibModal, ngToast) {
        var taFormCtrl = this;
        taFormCtrl.openOOStateForm = function () {
            $log.info(taFormCtrl);
            var modalInstance = $uibModal.open({
                controller: 'OOStateController',
                controllerAs: 'OOStateCtrl',
                resolve: {
                    oos: function () {
                        return taFormCtrl.oos;
                    }
                },
                size: 'lg',
                templateUrl: './js/taform/oostate.html'
            });
            modalInstance.result.then(function (oos) {
                $log.info(oos);
                taFormCtrl.oos = oos;
            }, function () {
                $log.info('ooStateModal dismissed at: ' + new Date());
            });
        };
        taFormCtrl.submit = function (taForm) {
            $scope.$broadcast('show-errors-check-validity');
            if (taForm.$invalid) {
                return;
            }
            $log.info('--> Submitting the form');
            taFormCtrl.pleaseWait = $http({
                method: 'POST',
                params: {
                    method: 'save',
                    ooState: taFormCtrl.oos,
                    returnFormat: 'json',
                    submit: true,
                    ta: taFormCtrl.ta
                },
                url: 'model/controller/Ta.cfc',
            }).then(function (data) {
                $log.info(data);
                if (data.data.SUCCESS) {
                    ngToast.create({
                        className: 'success',
                        content: 'Your TA has been submitted to the travel planner.'
                    });
                    $location.path('/');
                }
                else {
                    console.dir(data);
                    ngToast.create({
                        className: 'danger',
                        content: 'Something went wrong, your TA was not saved: ' + data.data.ERRORMSG.LocalizedMessage
                    });
                }
            });
        };
        taFormCtrl.save = function (taForm) {
            $scope.$broadcast('show-errors-check-validity');
            if (taForm.$invalid) {
                return;
            }
            $log.info('--> Saving the form');
            taFormCtrl.pleaseWait = $http({
                method: 'POST',
                params: {
                    method: 'save',
                    ooState: taFormCtrl.oos,
                    returnFormat: 'json',
                    submit: false,
                    ta: taFormCtrl.ta
                },
                url: 'model/controller/Ta.cfc'
            }).then(function (data) {
                if (data.data.SUCCESS) {
                    ngToast.create({
                        className: 'success',
                        content: 'Your TA has been saved, but not sent to the travel planners.'
                    });
                    $location.path('/review');
                }
                else {
                    $log.error(data);
                    // ngToast.create({
                    // className: 'danger',
                    // content: '<i class="glyphicon glyphicon-warning-sign"></i>&nbsp;&nbsp;' + data.statusText
                    // });
                    ngToast.create({
                        className: 'danger',
                        content: '<i class="glyphicon glyphicon-warning-sign"></i>&nbsp;&nbsp;' + data.data.ERRORMSG.Message
                    });
                }
            });
        };
        taFormCtrl.cancel = function (formtype) {
            $uibModal.open({
                animation: true,
                controller: 'FormCancelController',
                resolve: {
                    formtype: function () {
                        return formtype;
                    }
                },
                templateUrl: './js/taform/cancelDialog.html'
            });
        };
        taFormCtrl.close = function () {
            $location.path('/review');
        };
    }
    return {
        setters:[],
        execute: function() {
            TaFormController.$inject = [
                '$http',
                '$location',
                '$log',
                '$scope',
                '$uibModal',
                'ngToast'
            ];
            exports_1("default",TaFormController);
        }
    }
});
//# sourceMappingURL=taform.controller.js.map