/// <reference path='../types.ts' />
TaActionButtonsController.$inject = [
    '$window',
    '$log',
    '$location',
    '$uibModal'
];

function TaActionButtonsController(
        $window,
        $log,
        $location,
        $uibModal
    ) {

        let TaButtons = this;
        TaButtons.taid = TaButtons.$parent.$parent.taid;

        TaButtons.deleteme = {};

        TaButtons.delete = function () {
            let modalInstance = $uibModal.open({
                animation: true,
                controller: 'DeleteInstanceController',
                template: '<form name="confirmDelete" class="form-group" novalidate>' +
                        '<div class="modal-header">' +
                        '</div>' +
                        '<div class="modal-body">' +
                        '<p class="modal-title"><strong>Are you sure you want to delete this TA?</strong></p>' +
                        '</div>' +
                        '<div class="modal-footer">' +
                        '<button type="button" class="btn btn-primary" ng-click="cancel()">No, don&#39;t delete.</button>' +
                        '<button type="button" class="btn btn-danger" ng-click="delete(' + TaButtons.taid + ')">Yes, delete.</button>' +
                        '</div>' +
                        '</form>'
            });

            modalInstance.result.then(function (deletedItem) {
                TaButtons.deleted = deletedItem;
                $location.path('/');
            });
        };


    // TaButtons.open = function () {

        // let modalInstance = $uibModal.open({
            // animation: false,
            // // templateUrl: 'delete-confirmation.html',
            // template: '<form name="confirmDelete" class="form-group" novalidate>' +
                    // '<div class="modal-header">' +
                    // '<p class="modal-title"><strong>Are you sure you want to permanently delete TA TaButtons.taNumber?</strong></p>' +
                    // '{{confirmDelete.todelete.taid}}' +
                    // '</div>' +
                    // '<div class="modal-body">' +
                    // '<div class="form-group" data-ng-class="{&#39;has-error&#39;: confirmDelete.yesDelete.$invalid}">' +
                    // '<label for="yesDelete">Type DELETE in the box below:</label>' +
                    // '    <input type="text" data-ng-model="todelete.yesdelete" class="form-control" yes-delete required>' +
                    // '</div>' +
                    // '</div>' +
                    // '<div class="modal-footer">' +
                    // '<button type="button" class="btn btn-primary" ng-click="cancel()">No, don&#39;t delete.</button>' +
                    // '<!---<button type="button" data-ng-disabled="confirmDelete.$invalid" class="btn btn-danger"' +
                    // ' ng-click="delete(#rc.taid#)">Yes, delete forever.</button>--->' +
                    // '<button type="button" class="btn btn-danger" ng-click="delete(#rc.taid#, #rc.ta.getFk_preparerId()#)' +
                    // 'Yes, delete forever.</button>' +
                    // '</div>' +
                    // '</form>',
            // controller: 'DeleteInstanceController',
            // resolve: {
                // deleteme: function () {
                    // return TaButtons.deleteme;
                // }
            // }
        // });

        // modalInstance.result.then(function (deletedItem) {
            // TaButtons.deleted = deletedItem;
            // $window.location.href = 'index.cfm?action=travel';
        // }, function () {
            // $log.info('Modal dismissed at: ' + new Date());
        // });
    // };

}

export default TaActionButtonsController;
