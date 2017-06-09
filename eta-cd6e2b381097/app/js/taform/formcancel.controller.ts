FormCancelController.$inject = [
    '$location',
    '$log',
    '$uibModalInstance',
    '$scope',
    'formtype'
];

function FormCancelController(
        $location,
        $log,
        $uibModalInstance,
        $scope,
        formtype
    ) {

    $scope.cancelNo = function () {
        $uibModalInstance.close();
    };

    $scope.cancelYes = function () {
        $uibModalInstance.dismiss('cancel');
        if (formtype === 'edit') {
            $location.path('/review');
        } else {
            $location.path('/');
        }

    };
}

export default FormCancelController;
