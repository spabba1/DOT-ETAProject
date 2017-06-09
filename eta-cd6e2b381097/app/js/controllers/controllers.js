/*global eta*/
'use strict';

eta.controller('MessageController', [
    '$scope',
    '$timeout',
    '$cookies',
    function (
        $scope,
        $timeout,
        $cookies
    ) {


}]);

/*
eta.controller('TaReviewDatatableController', ['$q', function ($q, DTOptionsBuilder, DTColumnBuilder) {

    var vm = this;

    vm.dtOptions = DTOptionsBuilder.fromSource('./model/services/ta.cfc?method=getTaReviewList&type=yours');

}]);
*/

eta.controller('DeleteInstanceController', [
    '$scope',
    '$uibModalInstance',
    '$http',
    '$log',
    'ngToast',
    'SecurityService',
    function (
        $scope,
        $uibModalInstance,
        $http,
        $log,
        ngToast,
        SecurityService,
        deleteme
    ) {

        $scope.deletor = SecurityService.getCurrentUsername();
        $scope.deleteme = deleteme;

        $scope.cancel = function () {
            $uibModalInstance.dismiss('cancel');
        };

        $scope.delete = function (taid) {
            $log.info('Preparing to delete TA ' + taid + '!');
            var req = {
                method: 'POST',
                url: 'model/services/ta.cfc',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                params: {
                    method: 'recycle',
                    taid: taid,
                    deletor: $scope.deletor,
                    status: 'Pre-Trip',
                    returnFormat: 'json'
                }
            };

            $log.info('req: ' + JSON.stringify(req));

            $scope.pleaseWait = $http(req)
            .success(function (data, status) {
                ngToast.create({
                    className: 'success',
                    content: 'TA Recycled !'
                });
                $log.info('data: ' + data);
                $uibModalInstance.close(data);
            })
            .error(function (data, status) {
                ngToast.create({
                    className: 'danger',
                    content: 'Did not delete, the status code is: ' + status
                });
                $log.error(data);
                $uibModalInstance.close(data);
            });


        };
    }]);



eta.controller('StaffListController', [
    '$scope',
    '$uibModal',
    '$http',
    '$filter',
    '$log',
    function (
      $scope,
      $uibModal,
      $http,
      $filter,
      $log ) {
    var searchMatch = function (haystack, needle) {
        if (!needle) {
            return true;
        }
        return haystack.toLowerCase().indexOf(needle.toLowerCase()) !== -1;
    };

    $scope.search = function () {
        $scope.filteredStaffers = $filter('filter')($scope.staffers, function (staff) {
            var attr;
            for (attr in staff) {
                if (staff.hasOwnProperty(attr)) {
                    if (searchMatch(staff[attr], $scope.query)) {
                        return true;
                    }
                }
            }
            return false;
        });

        if ($scope.sort.sortingOrder !== '') {
            $scope.filteredStaffers = $filter('orderBy')($scope.filteredStaffers, $scope.sort.sortingOrder, $scope.sort.reverse);
        }
        $scope.currentPage = 0;
        $scope.groupToPages();
    };

    $scope.groupToPages = function () {
        $scope.pagedStaffers = [];
        var i = 0;
        for (i; i < $scope.filteredStaffers.length; i += 1) {
            if (i % $scope.staffersPerPage === 0) {
                $scope.pagedStaffers[Math.floor(i / $scope.staffersPerPage)] = [$scope.filteredStaffers[i]];
            } else {
                $scope.pagedStaffers[Math.floor(i / $scope.staffersPerPage)].push($scope.filteredStaffers[i]);
            }
        }
    };

    $scope.range = function (size, start, end) {
        var ret = [],
            i;

        if (size < end) {
            end = size;
            start = size - $scope.gap;
        }

        i = start;
        while (i < end) {
            ret.push(i);
            i += 1;
        }
        return ret;
    };

    $scope.prevPage = function () {
        if ($scope.currentPage > 0) {
            $scope.currentPage -= 1;
        }
    };

    $scope.nextPage = function () {
        if ($scope.currentPage < $scope.pagedStaffers.length - 1) {
            $scope.currentPage += 1;
        }
    };

    $scope.setPage = function () {
        $scope.currentPage = this.n;
    };



    $scope.sort = {
        sortingOrder: 'id',
        reverse: false
    };

    $scope.gap = 0;

    $scope.filteredStaffers = [];
    $scope.groupedStaffers = [];
    $scope.staffersPerPage = 10;
    $scope.pagedStaffers = [];
    $scope.currentPage = 0;

    $http.get('model/services/staff.cfc?method=getStaffList').success(function (data) {
        $scope.staffers = data;
        $scope.search();
    });
}]);



