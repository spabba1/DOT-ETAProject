EditFactory.$inject = [
    '$http',
    '$log'
];

function EditFactory(
  $http,
  $log
  ) {

  let EditFactory = this;

  EditFactory.getTa = function (taid, callback) {
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
      callback(response);
    }, function (response) {
      callback(response);
    });
  };

  EditFactory.getOos = function (taid, callback) {
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

  return EditFactory;

}

export default EditFactory;
