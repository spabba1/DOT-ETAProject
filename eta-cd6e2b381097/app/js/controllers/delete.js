/*global $, tadelete*/
'use strict';

tadelete.controller('TADeleteController', [
    '$http',
    '$log',
    '$uibModal',
    '$scope',
    'DeleteFactory',
    'DTColumnBuilder',
    'DTOptionsBuilder',
    function (
        $http,
        $log,
        $uibModal,
        $scope,
        DeleteFactory,
        DTColumnBuilder,
        DTOptionsBuilder
    ) {

        var vm = this;
        var stateChange = function (iColumn, bVisible) {
            console.log('The column ', iColumn, ' has changed its status to', bVisible);
        };
        var clickHandler = function (aData) {
            var thisTa = aData.id;

            var amodalInstance = $uibModal.open({
                animation: true,
                templateUrl: 'reallyDelete.html',
                controller: 'ReallyDeleteController',
                resolve: {
                    taid: function () {
                        return thisTa;
                    }
                }
            });

            amodalInstance.result.then(function (taid) {
                DeleteFactory.DeleteTa(taid).then(function (response) {
                    vm.dtInstance.reloadData();
                    return response;
                }, function (error) {
                    $log.error(error);
                });
            }, function () {
                $log.info('Modal dismissed at: ' + new Date());
            });
        };
        var rowCallback = function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
            // Unbind first in order to avoid any duplicate handler (see https://github.com/l-lin/angular-datatables/issues/87);
            $('td', nRow).unbind('click');
            $('td', nRow).bind('click', function () {
                $scope.$apply(function () {
                    vm.clickHandler(aData);
                });
            });
            return nRow;
        };

        vm.clickHandler = clickHandler;
        vm.dtInstance = {};
        vm.dtOptions = DTOptionsBuilder.fromFnPromise(function () {
            return $http({
                url: 'model/services/ta.cfc',
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                params: {
                    method: 'getDeleted',
                    returnFormat: 'json'
                }
            }).then(function (results) {
                return results.data;
            });
        })
        .withDOM('<"top"f>rt<"bottom"lip><"clear">')
        .withButtons(['colvis'])
        .withScroller()
        .withOption('scrollY')
        .withOption('rowCallback', rowCallback);

        vm.dtColumns = [
            DTColumnBuilder.newColumn('id').withTitle('ID').notVisible(),
            DTColumnBuilder.newColumn('tanumber').withTitle('TA Number'),
            DTColumnBuilder.newColumn('travelername').withTitle('Traveler'),
            DTColumnBuilder.newColumn('username').withTitle('Deletor')
        ];
    }]
);

tadelete.controller('ReallyDeleteController', [
    '$scope',
    '$modalInstance',
    'taid',
    function (
        $scope,
        $modalInstance,
        taid
    ) {

        $scope.taid = taid;

        $scope.ok = function () {
            $modalInstance.close(taid);
        };

        $scope.cancel = function () {
            $modalInstance.dismiss('cancel');
        };

    }]
);


