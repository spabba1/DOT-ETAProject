/// <reference path="./../types.ts" />
EmailFactory.$inject = [
  '$http',
  'SecurityFactory'
];

function EmailFactory(
  $http,
  SecurityFactory
) {

  let service: any = {};

  service.sendError = function (response) {
    const user = SecurityFactory.getCurrentUsername();

    // base 64 for easy transport of object
    return $http({
      headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
      },
      method: 'POST',
      params: {
        method: 'internalServerError',
        response: angular.toJson(response),
        returnFormat: 'json',
        user: user
      },
      url: 'model/services/mailer.cfc'
    });
  };

  return service;
}

export default EmailFactory;
