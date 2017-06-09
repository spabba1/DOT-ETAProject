ViewFactory.$inject = [
    '$http',
    '$log'
];

function ViewFactory(
        $http,
        $log
    ) {

        const service: any = {};

        service.getTa = function (taid, callback) {
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
                $log.info(response);
                callback(response);
            }, function (response) {
                $log.error(response);
                callback(response);
            });
        };

        return service;
    }

export default ViewFactory;
