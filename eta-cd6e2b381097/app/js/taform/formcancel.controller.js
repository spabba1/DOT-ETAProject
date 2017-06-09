System.register([], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    function FormCancelController($location, $log, $uibModalInstance, $scope, formtype) {
        $scope.cancelNo = function () {
            $uibModalInstance.close();
        };
        $scope.cancelYes = function () {
            $uibModalInstance.dismiss('cancel');
            if (formtype === 'edit') {
                $location.path('/review');
            }
            else {
                $location.path('/');
            }
        };
    }
    return {
        setters:[],
        execute: function() {
            FormCancelController.$inject = [
                '$location',
                '$log',
                '$uibModalInstance',
                '$scope',
                'formtype'
            ];
            exports_1("default",FormCancelController);
        }
    }
});
//# sourceMappingURL=formcancel.controller.js.map