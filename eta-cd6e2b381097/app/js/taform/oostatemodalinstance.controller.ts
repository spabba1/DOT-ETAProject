OOStateController.$inject = [
    '$uibModalInstance',
    'oos'
];

function OOStateController(
        $uibModalInstance,
        oos
    ) {
        let OosStateCtrl = this;

        OosStateCtrl.oos = oos;

        OosStateCtrl.ok = function() {
            $uibModalInstance.close(OosStateCtrl.oos);
        };

        OosStateCtrl.cancel = function() {
            $uibModalInstance.dismiss('cancel');
        };
    }

export default OOStateController;
