System.register([], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    /// <reference path="./../types.ts" />
    function sumTotals() {
        return function (data, key) {
            if (angular.isUndefined(data) && angular.isUndefined(key)) {
                return 0;
            }
            var sum = 0;
            angular.forEach(data, function (v, k) {
                sum = sum + Math.round(v[key] * 100) / 100;
            });
            if (isNaN(sum)) {
                sum = 0;
            }
            return sum;
        };
    }
    exports_1("default", sumTotals);
    return {
        setters:[],
        execute: function() {
        }
    }
});
//# sourceMappingURL=sumtotals.filter.js.map