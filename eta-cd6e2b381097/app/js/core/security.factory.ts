/// <reference path="./../types.ts" />
'use strict';

SecurityFactory.$inject = [
  '$cookies',
  '$http',
  '$log',
  '$rootScope',
  'Base64'
];


function SecurityFactory(
  $cookies,
  $http,
  $log,
  $rootScope,
  Base64
  ) {

  let service: any = {};

  service.test =  function () {
    return true;
  };

  service.login = function (username, password) {
    return $http({
      data: $.param({
        method: 'login',
        password: password,
        returnFormat: 'json',
        username: username
      }),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
      },
      method: 'POST',
      url: 'model/controller/Login.cfc'
    }).then(function (response) {
      return response;
    }, function (response) {
      return response;
    });
  };

  service.getAuthData = function () {
    const credentials = $http.defaults.headers.common.Authorization;
    let authdata = credentials.replace('Basic ', '');
    return authdata;
  };

  service.getCredentials = function () {
    const authdata = $http.defaults.headers.common.Authorization;
    let encodedCreds = authdata.replace('Basic ', '');
    let decodedCreds = Base64.decode(encodedCreds);

    return decodedCreds;
  };

  service.getCurrentUsername = function () {
    const creds = this.getCredentials();
    let username = creds.split(':')[0];

    return username;
  };

  service.setCredentials = function (username, password, isadmin) {
    const authdata = Base64.encode(username + ':' + password);

    $rootScope.globals = {
      currentUser: {
        authdata: authdata,
        isadmin: isadmin,
        username: username
      }
    };

    $http.defaults.headers.common.Authorization = 'Basic ' + authdata;
    $cookies.putObject('globals', $rootScope.globals);
  };

  service.clearCredentials = function () {
    $rootScope.globals = {};
    $cookies.remove('globals');
    $http.defaults.headers.common.Authorization = 'Basic ';
  };


  return service;

};

export default SecurityFactory;
