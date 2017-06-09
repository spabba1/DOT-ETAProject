System.register(['./review.controller', './deletemodalinstance.controller'], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    var review_controller_1, deletemodalinstance_controller_1;
    return {
        setters:[
            function (review_controller_1_1) {
                review_controller_1 = review_controller_1_1;
            },
            function (deletemodalinstance_controller_1_1) {
                deletemodalinstance_controller_1 = deletemodalinstance_controller_1_1;
            }],
        execute: function() {
            exports_1("default",angular.module('review', [])
                .controller('ReviewController', review_controller_1.default)
                .controller('DeleteModalInstanceController', deletemodalinstance_controller_1.default));
        }
    }
});
//# sourceMappingURL=review.module.js.map