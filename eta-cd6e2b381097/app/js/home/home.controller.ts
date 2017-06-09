/*interface HomeCtrlScope extends ng.IScope {
    isadmin: boolean;
    username: string;
}
*/
HomeController.$inject = [
    '$rootScope',
    '$log',
    '$http',
    '$scope',
    '$window'
];

function HomeController(
        $rootScope,
        $log,
        $http,
        $scope,
        $window
) {

  let HomeCtrl = this;

    HomeCtrl.isadmin = $rootScope.globals.currentUser.isadmin;
    HomeCtrl.username = $rootScope.globals.currentUser.username;

    HomeCtrl.doBusy = function () {

      $scope.pleaseWait = $http({
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        method: 'POST',
        params: {
          method: 'timeoutTest',
          returnFormat: 'json'
        },
        url: 'model/controller/Testing.cfc'
      }).then(function (response) {
        $log.info(response);
      }, function (response) {
        $log.error(response);
        // if error
      });
    };

};

export default HomeController;
