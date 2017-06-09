System.register([], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    function ApprovedController($compile, $scope, $http, $log, $uibModal, DTOptionsBuilder, DTColumnBuilder) {
        var ApprovedCtrl = this;
        function createdRow(row) {
            // Recompile so Angular can attach to it
            $compile(angular.element(row).contents())($scope);
        }
        ApprovedCtrl.dtOptions = DTOptionsBuilder.fromFnPromise(function () {
            return $http({
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                method: 'POST',
                params: {
                    authdata: ApprovedCtrl.authdata,
                    method: 'getDataTableInfo',
                    returnFormat: 'json'
                },
                url: 'model/controller/Approved.cfc'
            }).then(function (results) {
                console.dir(results);
                return results.data;
            }, function (results) {
                console.dir(results);
                return results.data;
            });
        })
            .withDOM('<"top"f>rt<"bottom"lip><"clear">')
            .withButtons(['colvis'])
            .withScroller()
            .withOption('createdRow', createdRow)
            .withOption('scrollY');
        ApprovedCtrl.dtColumns = [
            DTColumnBuilder.newColumn('id').withTitle('ID').notVisible(),
            DTColumnBuilder.newColumn('tanumber').withTitle('TA Number'),
            DTColumnBuilder.newColumn('traveler').withTitle('Traveler'),
            DTColumnBuilder.newColumn('bu').withTitle('BU'),
            DTColumnBuilder.newColumn('destination').withTitle('Destination'),
            DTColumnBuilder.newColumn('submitted').withTitle('Submitted'),
            DTColumnBuilder.newColumn('actions').withTitle('Actions')
        ];
        ApprovedCtrl.dtInstance = {};
        /*     View Path        */
        ApprovedCtrl.open = function (taid) {
            var modalInstance = $uibModal.open({
                /*animation: true,*/
                controller: 'ApprovedModalController',
                controllerAs: 'ApprovalPath',
                resolve: {
                    taid: function () {
                        return taid;
                    }
                },
                size: 'lg',
                templateUrl: 'js/approved/approval-path.html'
            });
            modalInstance.result.then(function (thistaid) {
                ApprovedCtrl.taid = thistaid;
                $log.info('success');
            }, function () {
                $log.info('Modal dismissed at: ' + new Date());
            });
        };
    }
    return {
        setters:[],
        execute: function() {
            ApprovedController.$inject = [
                '$compile',
                '$scope',
                '$http',
                '$log',
                '$uibModal',
                'DTOptionsBuilder',
                'DTColumnBuilder'
            ];
            ;
            exports_1("default",ApprovedController);
        }
    }
});
//# sourceMappingURL=approved.controller.js.map