EditController.$inject = [
    '$filter',
    '$http',
    '$log',
    '$stateParams',
    '$uibModal',
    'CreateFactory',
    'EditFactory',
    'SecurityFactory'
];

function EditController(
        $filter,
        $http,
        $log,
        $stateParams,
        $uibModal,
        CreateFactory,
        EditFactory,
        SecurityFactory
) {

    const EditCtrl = this;

    EditCtrl.taform = {};
    EditCtrl.taid = $stateParams.taid;

    EditFactory.getTa(EditCtrl.taid, function (response) {
        EditCtrl.ta = response.data;
        EditCtrl.ta.formtype = 'edit'; // for button-types view
        EditCtrl.username = SecurityFactory.getCurrentUsername();
        EditCtrl.ta.preparer = EditCtrl.username;
        // EditCtrl.ta.departuredate = $filter('date')(new Date(EditCtrl.ta.departuredate), 'MM/dd/yyyy');
        // EditCtrl.ta.returndate = $filter('date')(new Date(EditCtrl.ta.returndate), 'MM/dd/yyyy');
        $log.info(EditCtrl.ta);
    });

    EditFactory.getOos(EditCtrl.taid, function (response) {

        if (response.data.id) {
            EditCtrl.oos = response.data;
        } else {
            CreateFactory.EmptyOosBeanService().then(function (data) {
                EditCtrl.oos = data;
            });
        }
    });

}

export default EditController;
