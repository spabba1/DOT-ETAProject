DeleteModalInstanceController.$inject = [
    '$modalInstance',
    'taid'
];

function DeleteModalInstanceController(
    $modalInstance,
    taid
) {

    let DeleteCntl = this;

    DeleteCntl.delete = function () {
        $modalInstance.close(taid);
    };

    DeleteCntl.cancel = function () {
        $modalInstance.dismiss('cancel');
    };

}
export default DeleteModalInstanceController;
