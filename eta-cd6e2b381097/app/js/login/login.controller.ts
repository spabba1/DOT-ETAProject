/// <reference path="./../types.ts" />
LoginController.$inject = [
    '$scope',
    '$rootScope',
    '$state',
    '$log',
    'ngToast',
    'SecurityFactory'
];

export default function LoginController(
    $scope,
    $rootScope,
    $state,
    $log,
    ngToast,
    SecurityFactory
) {
    'use strict';
    // reset login status
    SecurityFactory.clearCredentials();

    $scope.login = function () {
        $rootScope.error = false;
        $scope.pleaseWait = SecurityFactory.login(
            $scope.username,
            $scope.password
        )
            .then(function (response) {
                $log.info(response);

                if (response.data.SUCCESS) {
                    SecurityFactory.setCredentials(
                        $scope.username,
                        $scope.password,
                        response.data.ISADMIN
                    );
                    $state.go('home');
                } else {
                    if (response.status === 200) {
                        ngToast.create({
                            className: 'warning',
                            content: '<i class="glyphicon glyphicon-warning-sign"></i>&nbsp;&nbsp;' +
                                    response.data.MESSAGE.LocalizedMessage
                        });
                    } else {
                        ngToast.create({
                            className: 'danger',
                            content: '<i class="glyphicon glyphicon-warning-sign"></i>&nbsp;&nbsp;' +
                                    response.statusText
                        });
                    }
                }
                return;
            }, function (response) {
                $log.info(response);
                if (response.status === 200) {
                    ngToast.create({
                        className: 'danger',
                        content: response.MESSAGE.LocalizedMessage
                    });
                } else {
                    ngToast.create({
                        className: 'danger',
                        content: response.MESSAGE.LocalizedMessage
                    });
                }
            });
    };
}
