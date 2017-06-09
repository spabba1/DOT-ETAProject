System.register(['./estimate.controller', './estimatecancel.controller', './estimate.factory', './../staff/staff.factory', './sumtotals.filter', './totalOutOfPocket.filter'], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    var estimate_controller_1, estimatecancel_controller_1, estimate_factory_1, staff_factory_1, sumtotals_filter_1, totalOutOfPocket_filter_1;
    return {
        setters:[
            function (estimate_controller_1_1) {
                estimate_controller_1 = estimate_controller_1_1;
            },
            function (estimatecancel_controller_1_1) {
                estimatecancel_controller_1 = estimatecancel_controller_1_1;
            },
            function (estimate_factory_1_1) {
                estimate_factory_1 = estimate_factory_1_1;
            },
            function (staff_factory_1_1) {
                staff_factory_1 = staff_factory_1_1;
            },
            function (sumtotals_filter_1_1) {
                sumtotals_filter_1 = sumtotals_filter_1_1;
            },
            function (totalOutOfPocket_filter_1_1) {
                totalOutOfPocket_filter_1 = totalOutOfPocket_filter_1_1;
            }],
        execute: function() {
            exports_1("default",angular.module('estimate', [])
                .controller('EstimateController', estimate_controller_1.default)
                .controller('EstimateCancelController', estimatecancel_controller_1.default)
                .factory('EstimateFactory', estimate_factory_1.default)
                .factory('StaffFactory', staff_factory_1.default)
                .filter('sumTotals', sumtotals_filter_1.default)
                .filter('totalOutOfPocket', totalOutOfPocket_filter_1.default));
        }
    }
});
//# sourceMappingURL=estimate.module.js.map