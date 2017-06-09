/// <reference path="./../types.ts" />

export default function taForm() {
    return {
        bindToController: {
            oos: '=oos',
            ta: '=ta',
            taFormCtrl: '=taFormCtrl'
        },
        controller: 'TaFormController',
        controllerAs: 'taFormData',
        restrict: 'E',
        scope: {},
        templateUrl: './js/taform/taform.html',
        transclude: true
    };
}
