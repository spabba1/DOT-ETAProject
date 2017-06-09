/*global eta*/
'use strict';

/* Services */
eta.factory('EtaFactory', [
//    '$http',
//    '$log',
    function (
//        $http,
//        $log
    ) {

        var service = {};

        /**
         * This simple service is used to transfer an objects between controllers.
         */
        service.EtaTransferService = function () {
            var obj = {};

            var setObj = function (value) {
                obj.push(value);
            };

            var getObj = function () {
                return obj;
            };

            return {
                setObj: setObj,
                getObj: getObj
            };
        };

        return service;

    }
]);

/*eta.factory('GetLdapUserService', ['$http', '$log', function($http, $log) {

  var userObj = {};

  var getUser = function(value) {
  return $http({
method: 'GET',
url: 'model/services/ldap.cfc',
params: {
method: 'getUserByEinForTa',
returnFormat: 'json',
employeeNumber: value
}
}).success(function (data) {
$log.info(data);
});

};

return getUser;

}]);*/
