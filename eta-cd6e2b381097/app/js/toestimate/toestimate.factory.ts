ToEstimateFactory.$inject = [
    '$http',
    '$log'
];

function ToEstimateFactory(
        $http,
        $log
    ) {
        var service: any = {};

        service.getToEstimateList = function () {
            return $http({
                url: 'model/services/ta.cfc',
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                params: {
                    method: 'getTasInEstimation',
                    returnFormat: 'json'
                }
            }).then(function (response) {
                return response.data;
            }, function (response) {
                $log.error(response);
                return response;
            });
        };

        service.getRejectReason = function (taid) {
            return $http({
                    url: 'model/services/ta.cfc',
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    params: {
                        method: 'getRejectReason',
                        returnFormat: 'json',
                        taid: taid
                    }
            }).then(function (response) {
                $log.info(response.data);
                return response.data;
            }, function (response) {
                $log.error(response);
                return response;
            });
        };

        return service;

    }

export default ToEstimateFactory;
