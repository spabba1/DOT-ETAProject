System.register([], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    function MileageRateController($scope, $log, SecurityService, StaffService) {
        $scope.enableSave = false;
        $scope.mrChanged = function () {
            $scope.enableSave = true;
        };
        StaffService.getMileageRate()
            .then(function (response) {
            $scope.mileagerate = response;
            $scope.mileagerate.changedby = SecurityService.getCurrentUsername();
        });
        $scope.saveChanges = function (data) {
            StaffService.updateConstants(data).then(function () {
                $scope.enableSave = false;
            });
        };
    }
    return {
        setters:[],
        execute: function() {
            MileageRateController.$inject = [
                '$scope',
                '$log',
                'SecurityFactory',
                'StaffFactory'
            ];
            ;
            exports_1("default",MileageRateController);
        }
    }
});
//# sourceMappingURL=mileagerate.controller.js.map