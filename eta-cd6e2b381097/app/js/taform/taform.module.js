/// <reference path='../types.ts' />
System.register(['./formcancel.controller', './oostatemodalinstance.controller', './taform.directive', './taform.controller', './taactionbuttons.controller', './../core/hidezero.directive'], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    var formcancel_controller_1, oostatemodalinstance_controller_1, taform_directive_1, taform_controller_1, taactionbuttons_controller_1, hidezero_directive_1;
    return {
        setters:[
            function (formcancel_controller_1_1) {
                formcancel_controller_1 = formcancel_controller_1_1;
            },
            function (oostatemodalinstance_controller_1_1) {
                oostatemodalinstance_controller_1 = oostatemodalinstance_controller_1_1;
            },
            function (taform_directive_1_1) {
                taform_directive_1 = taform_directive_1_1;
            },
            function (taform_controller_1_1) {
                taform_controller_1 = taform_controller_1_1;
            },
            function (taactionbuttons_controller_1_1) {
                taactionbuttons_controller_1 = taactionbuttons_controller_1_1;
            },
            function (hidezero_directive_1_1) {
                hidezero_directive_1 = hidezero_directive_1_1;
            }],
        execute: function() {
            exports_1("default",angular.module('taform', [])
                .controller('FormCancelController', formcancel_controller_1.default)
                .controller('OOStateController', oostatemodalinstance_controller_1.default)
                .controller('TaActionButtonsController', taactionbuttons_controller_1.default)
                .controller('TaFormController', taform_controller_1.default)
                .directive('hideZero', hidezero_directive_1.default)
                .directive('taForm', taform_directive_1.default));
        }
    }
});
//# sourceMappingURL=taform.module.js.map