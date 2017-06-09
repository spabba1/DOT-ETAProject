System.register([], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    function ReviewController($compile, $http, $log, $location, $scope, $uibModal, DTOptionsBuilder, DTColumnBuilder, DeleteFactory, SecurityFactory) {
        var ReviewCtrl = this;
        ReviewCtrl.opened = true;
        ReviewCtrl.username = SecurityFactory.getCurrentUsername();
        function actionsHtml(data, type, full, meta) {
            var actions = '';
            if (full.status === 'Start TA') {
                actions = '<button data-ng-click="ReviewCtrl.edit(' + data + ')">Edit</button>' +
                    '<button data-ng-click="ReviewCtrl.delete(' + data + ')">Delete</button>';
            }
            else {
                actions = '<button data-ng-click="ReviewCtrl.view(' + data + ')">View</button>';
            }
            return actions;
        }
        /*function stateChange(iColumn, bVisible) {
            $log.info('The column', iColumn, ' has changed its status to', bVisible);
        }*/
        function createdRow(row, data, dataIndex) {
            // Recompiling so we can bind Angular directive to the DT
            $compile(angular.element(row).contents())($scope);
        }
        ReviewCtrl.edit = function (taid) {
            var editta = '/edit/' + taid;
            $location.url(editta);
        };
        ReviewCtrl.view = function (taid) {
            var viewta = '/view/' + taid;
            $location.url(viewta);
        };
        function reloadData() {
            ReviewCtrl.dtInstanceYours.reloadData();
            ReviewCtrl.dtInstancePreparing.reloadData();
            ReviewCtrl.dtInstanceCompleted.reloadData();
        }
        /*var dtInstances = [];*/
        ReviewCtrl.reloadData = reloadData;
        ReviewCtrl.dtOptionsYours = DTOptionsBuilder.fromFnPromise(function () {
            return $http({
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                method: 'POST',
                params: {
                    method: 'getTaReviewList',
                    returnFormat: 'json',
                    type: 'yours',
                    username: ReviewCtrl.username
                },
                url: 'model/controller/Ta.cfc'
            }).then(function (results) {
                $log.info(results);
                return results.data;
            });
        })
            .withDOM('<"top"f>rt<"bottom"lip><"clear">')
            .withButtons(['colvis'])
            .withScroller()
            .withBootstrap()
            .withOption('createdRow', createdRow)
            .withOption('scrollY');
        ReviewCtrl.dtColumnsYours = [
            DTColumnBuilder.newColumn('id').withTitle('ID').notVisible(),
            DTColumnBuilder.newColumn('tanumber').withTitle('TA Number'),
            DTColumnBuilder.newColumn('status').withTitle('TA Status'),
            DTColumnBuilder.newColumn('destination').withTitle('Destination'),
            DTColumnBuilder.newColumn('actions').withTitle('Actions').renderWith(actionsHtml)
        ];
        ReviewCtrl.dtInstanceYours = {};
        ReviewCtrl.dtOptionsPreparing = DTOptionsBuilder.fromFnPromise(function () {
            return $http({
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                method: 'POST',
                params: {
                    method: 'getTaReviewList',
                    returnFormat: 'json',
                    type: 'prepared',
                    username: ReviewCtrl.username
                },
                url: 'model/controller/Ta.cfc'
            }).then(function (results) {
                return results.data;
            });
        })
            .withOption('createdRow', createdRow)
            .withDOM('<"top"f>rt<"bottom"lip><"clear">')
            .withButtons(['colvis'])
            .withScroller()
            .withOption('scrollY');
        ReviewCtrl.dtColumnsPreparing = [
            DTColumnBuilder.newColumn('DT_RowId').withTitle('ID'),
            DTColumnBuilder.newColumn('tanumber').withTitle('TA Number'),
            DTColumnBuilder.newColumn('traveler').withTitle('Traveler'),
            DTColumnBuilder.newColumn('status').withTitle('TA Status'),
            DTColumnBuilder.newColumn('destination').withTitle('Destination'),
            DTColumnBuilder.newColumn('actions').withTitle('Actions').renderWith(actionsHtml)
        ];
        ReviewCtrl.dtInstancePreparing = {};
        ReviewCtrl.dtOptionsCompleted = DTOptionsBuilder.fromFnPromise(function () {
            return $http({
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                method: 'POST',
                params: {
                    method: 'getTaReviewList',
                    returnFormat: 'json',
                    type: 'completed',
                    username: ReviewCtrl.username
                },
                url: 'model/controller/Ta.cfc'
            }).then(function (results) {
                return results.data;
            });
        })
            .withPaginationType('full_numbers')
            .withOption('createdRow', createdRow)
            .withDOM('<"top"f>rt<"bottom"lip><"clear">')
            .withButtons(['colvis'])
            .withScroller()
            .withOption('scrollY');
        ReviewCtrl.dtColumnsCompleted = [
            DTColumnBuilder.newColumn('DT_RowId').withTitle('ID'),
            DTColumnBuilder.newColumn('tanumber').withTitle('TA Number'),
            DTColumnBuilder.newColumn('traveler').withTitle('Traveler'),
            DTColumnBuilder.newColumn('status').withTitle('TA Status'),
            DTColumnBuilder.newColumn('destination').withTitle('Destination'),
            DTColumnBuilder.newColumn('action').withTitle('Actions').renderWith(actionsHtml)
        ];
        ReviewCtrl.dtInstanceCompleted = {};
        ReviewCtrl.delete = function (taid) {
            var modalInstance = $uibModal.open({
                animation: true,
                controller: 'DeleteModalInstanceController',
                controllerAs: 'DeleteCntl',
                resolve: {
                    taid: function () {
                        return taid;
                    }
                },
                templateUrl: 'deleteYourTaModal.html'
            });
            modalInstance.result.then(function (modaltaid) {
                var deletor = SecurityFactory.getCurrentUsername();
                DeleteFactory.recycleTa(modaltaid, deletor).then(function (response) {
                    $log.info(response);
                    ReviewCtrl.dtInstanceYours.reloadData();
                    ReviewCtrl.dtInstancePreparing.reloadData();
                }, function (response) {
                    $log.error(response);
                });
            });
        };
    }
    return {
        setters:[],
        execute: function() {
            ReviewController.$inject = [
                '$compile',
                '$http',
                '$log',
                '$location',
                '$scope',
                '$uibModal',
                'DTOptionsBuilder',
                'DTColumnBuilder',
                'DeleteFactory',
                'SecurityFactory'
            ];
            /*global angular, review*/
            'use strict';
            exports_1("default",ReviewController);
        }
    }
});
//# sourceMappingURL=review.controller.js.map