/// <reference path="./../types.ts" />
System.register([], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    function taForm() {
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
    exports_1("default", taForm);
    return {
        setters:[],
        execute: function() {
        }
    }
});
//# sourceMappingURL=taform.directive.js.map