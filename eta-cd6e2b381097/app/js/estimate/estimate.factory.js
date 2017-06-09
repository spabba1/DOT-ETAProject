System.register([], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    function EstimateFactory($http, $log) {
        var EstimateFcty = this;
        EstimateFcty.getTa = function (taid) {
            return $http({
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                method: 'POST',
                params: {
                    method: 'getTaByTaid',
                    returnFormat: 'json',
                    taid: taid
                },
                url: 'model/controller/Ta.cfc'
            }).then(function (response) {
                return response;
            }, function (response) {
                console.dir(response);
            });
        };
        EstimateFcty.getOos = function (taid, callback) {
            return $http({
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                method: 'POST',
                params: {
                    method: 'getByTaid',
                    returnFormat: 'json',
                    taid: taid
                },
                url: 'model/controller/Oostate.cfc'
            }).then(function (response) {
                callback(response);
            }, function (response) {
                $log.error(response);
                callback(response);
            });
        };
        EstimateFcty.getFinancialCodes = function (taid, callback) {
            return $http({
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                method: 'POST',
                params: {
                    method: 'getFincodesByTaId',
                    returnFormat: 'json',
                    taid: taid
                },
                url: 'model/controller/Financialcode.cfc'
            }).then(function (response) {
                callback(response);
            }, function (response) {
                callback(response);
            });
        };
        EstimateFcty.getExpenses = function (taid) {
            return $http({
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                method: 'POST',
                params: {
                    method: 'getExpensesByTaId',
                    returnFormat: 'json',
                    taid: taid
                },
                url: 'model/controller/Expense.cfc'
            }).then(function (response) {
                return response;
            }, function (response) {
                $log.error(response);
            });
        };
        EstimateFcty.getTrws = function (taid, callback) {
            return $http({
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                method: 'POST',
                params: {
                    method: 'getTrwsByTaId',
                    returnFormat: 'json',
                    taid: taid
                },
                url: 'model/controller/Trw.cfc'
            }).then(function (response) {
                callback(response);
            }, function (response) {
                callback(response);
            });
        };
        EstimateFcty.getTrwBean = function () {
            return $http({
                cache: true,
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                method: 'POST',
                params: {
                    method: 'getEmptyBean',
                    returnFormat: 'json'
                },
                url: 'model/controller/Trw.cfc'
            }).then(function (response) {
                return response;
            }, function (response) {
                return response;
            });
        };
        EstimateFcty.getOnecards = function (taid) {
            return $http({
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                method: 'POST',
                params: {
                    method: 'getOnecardsByTaId',
                    returnFormat: 'json',
                    taid: taid
                },
                url: 'model/controller/Onecard.cfc'
            }).then(function (response) {
                return response;
            }, function (response) {
                $log.error(response);
            });
        };
        EstimateFcty.getFCodeBean = function () {
            return $http({
                cache: true,
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                method: 'POST',
                params: {
                    method: 'getEmptyBean',
                    returnFormat: 'json'
                },
                url: 'model/controller/Financialcode.cfc'
            }).then(function (response) {
                return response;
            }, function (response) {
                return response;
            });
        };
        EstimateFcty.getExpenseBean = function () {
            return $http({
                cache: true,
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                method: 'POST',
                params: {
                    method: 'getEmptyBean',
                    returnFormat: 'json'
                },
                url: 'model/controller/Expense.cfc'
            }).then(function (response) {
                return response;
            }, function (response) {
                $log.error('An error occured in EstimateFactory getExpenseBean');
                return response;
            });
        };
        EstimateFcty.getOnecardBean = function () {
            return $http({
                cache: true,
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                method: 'POST',
                params: {
                    method: 'getEmptyBean',
                    returnFormat: 'json'
                },
                url: 'model/controller/Onecard.cfc'
            }).then(function (response) {
                return response;
            }, function (response) {
                $log.error('An error occured in EstimateFactory getOnecardBean');
                console.dir(response);
                return response;
            });
        };
        // Totals
        EstimateFcty.getTotals = function (data, unit) {
            var total = 0, i = 0;
            while (i < data.length) {
                total += data[i][unit];
                i += 1;
            }
            $log.info(total);
            return total;
        };
        return EstimateFcty;
    }
    return {
        setters:[],
        execute: function() {
            /// <reference path="./../types.ts" />
            EstimateFactory.$inject = [
                '$http',
                '$log'
            ];
            ;
            exports_1("default",EstimateFactory);
        }
    }
});
/*vim: set foldlevel=1:*/
//# sourceMappingURL=estimate.factory.js.map