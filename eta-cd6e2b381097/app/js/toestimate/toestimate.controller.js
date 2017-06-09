System.register([], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    function ToEstimateController($compile, $http, $log, $scope, $uibModal, DTOptionsBuilder, DTColumnBuilder) {
        var ToEstimateCtrl = this;
        function createdRow(row) {
            // Recompiling so we can bind Angular directive to the DT
            $compile(angular.element(row).contents())($scope);
        }
        ;
        ToEstimateCtrl.dtOptions = DTOptionsBuilder.fromFnPromise(function () {
            return $http({
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                method: 'POST',
                params: {
                    method: 'getTasInEstimation',
                    returnFormat: 'json'
                },
                url: 'model/controller/Ta.cfc'
            }).then(function (response) {
                return response.data;
            });
        })
            .withDOM('<"top"f>rt<"bottom"lip><"clear">')
            .withButtons(['colvis'])
            .withBootstrap()
            .withOption('createdRow', createdRow);
        ToEstimateCtrl.dtColumns = [
            DTColumnBuilder.newColumn('id').withTitle('ID').notVisible(),
            DTColumnBuilder.newColumn('tanumber').withTitle('TA Number'),
            DTColumnBuilder.newColumn('traveler').withTitle('Traveler'),
            DTColumnBuilder.newColumn('bu').withTitle('BU'),
            DTColumnBuilder.newColumn('destination').withTitle('Destination'),
            DTColumnBuilder.newColumn('submitted').withTitle('Submitted'),
            DTColumnBuilder.newColumn('actions').withTitle('Actions')
        ];
        ToEstimateCtrl.openRejectReason = function (taid) {
            var modalInstance = $uibModal.open({
                animation: true,
                controller: 'RejectReasonController',
                controllerAs: 'RejectReasonCtrl',
                resolve: {
                    taid: function () {
                        return taid;
                    }
                },
                templateUrl: 'js/toestimate/reject-reason.html'
            });
            modalInstance.result.then(function (reason) {
                ToEstimateCtrl.reason = reason;
            });
        };
    }
    return {
        setters:[],
        execute: function() {
            ToEstimateController.$inject = [
                '$compile',
                '$http',
                '$log',
                '$scope',
                '$uibModal',
                'DTOptionsBuilder',
                'DTColumnBuilder'
            ];
            exports_1("default",ToEstimateController);
        }
    }
});
//# sourceMappingURL=toestimate.controller.js.map