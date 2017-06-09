System.register([], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    function totalOutOfPocket() {
        return function (data, key1, key2) {
            if (angular.isUndefined(data) && angular.isUndefined(key1) && angular.isUndefined(key2)) {
                return 0;
            }
            var sum = 0;
            angular.forEach(data, function (v, k) {
                sum = sum + (parseInt(v[key1], 10) * parseInt(v[key2], 10));
            });
            return sum;
        };
    }
    exports_1("default", totalOutOfPocket);
    return {
        setters:[],
        execute: function() {
        }
    }
});
//# sourceMappingURL=totalOutOfPocket.filter.js.map