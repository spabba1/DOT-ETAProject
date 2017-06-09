System.register(['./staff.controller', './addstaff.controller', './mileagerate.controller', './staff.factory', './staffedit.controller'], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    var staff_controller_1, addstaff_controller_1, mileagerate_controller_1, staff_factory_1, staffedit_controller_1;
    return {
        setters:[
            function (staff_controller_1_1) {
                staff_controller_1 = staff_controller_1_1;
            },
            function (addstaff_controller_1_1) {
                addstaff_controller_1 = addstaff_controller_1_1;
            },
            function (mileagerate_controller_1_1) {
                mileagerate_controller_1 = mileagerate_controller_1_1;
            },
            function (staff_factory_1_1) {
                staff_factory_1 = staff_factory_1_1;
            },
            function (staffedit_controller_1_1) {
                staffedit_controller_1 = staffedit_controller_1_1;
            }],
        execute: function() {
            exports_1("default",angular.module('staff', [])
                .controller('StaffController', staff_controller_1.default)
                .controller('AddStaffController', addstaff_controller_1.default)
                .controller('MileageRateController', mileagerate_controller_1.default)
                .controller('StaffEditController', staffedit_controller_1.default)
                .factory('StaffFactory', staff_factory_1.default));
        }
    }
});
//# sourceMappingURL=staff.module.js.map