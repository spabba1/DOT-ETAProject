ApprovedFactory.$inject = [
  '$http',
  '$log'
];

function ApprovedFactory(
  $http,
  $log
) {

  let ApprovedFactory: any = {};

  ApprovedFactory.getApprovalPath = function (taid) {
    return $http({
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
      },
      method: 'POST',
      params: {
        method: 'getApprovalPath',
        returnFormat: 'json',
        taid: taid
      },
      url: 'model/controller/Eta_log.cfc'
    }).then(function (response) {
      return response.data;
    }, function (response) {
      $log.error(response);
      return response;
    });
  };

  return ApprovedFactory;

}

export default ApprovedFactory;

