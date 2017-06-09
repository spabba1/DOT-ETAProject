/// <reference path="./../types.ts" />
EstimateController.$inject = [
  '$compile',
  '$filter',
  '$http',
  '$location',
  '$log',
  '$q',
  '$rootScope',
  '$scope',
  '$stateParams',
  '$uibModal',
  'CreateFactory',
  'DeleteFactory',
  'EstimateFactory',
  'ngToast',
  'SecurityFactory',
  'StaffFactory'
];

function EstimateController(
    $compile,
    $filter,
    $http,
    $location,
    $log,
    $q,
    $rootScope,
    $scope,
    $stateParams,
    $uibModal,
    CreateFactory,
    DeleteFactory,
    EstimateFactory,
    ngToast,
    SecurityFactory,
    StaffFactory
) {

  let EstimateCtrl = this;

  EstimateCtrl.taform = {};
  EstimateCtrl.expenses = [];
  EstimateCtrl.taid = $stateParams.taid;

  // select options
  // TODO: (Put in a db table some day)

  EstimateCtrl.mealtypes = [
    {name: 'B'},
    {name: 'L'},
    {name: 'D'},
    {name: 'BL'},
    {name: 'BD'},
    {name: 'LD'},
    {name: 'BLD'}
  ];

  EstimateCtrl.facilities = [
    {name: 'COMM'},
    {name: 'FIELD'},
    {name: 'STATE'},
    {name: 'NONC'}
  ];

  EstimateCtrl.trwtypes = [
    {name: 'AIR'},
    {name: 'LODG'},
    {name: 'M&IE'},
    {name: 'OTHER'},
    {name: 'REIMB'},
    {name: 'SURF'}
  ];

  EstimateCtrl.onecardtypes = [
    {name: 'AIR'},
    {name: 'ATM'},
    {name: 'COMM'},
    {name: 'LODG'},
    {name: 'OTHER'},
    {name: 'SURF'}
  ];

  EstimateCtrl.aksasrefids = [
    {name: 'ACC'},
    {name: 'CAR'},
    {name: 'CO'},
    {name: 'CUS'},
    {name: 'DO'},
    {name: 'INV'},
    {name: 'LOD'},
    {name: 'MCC'},
    {name: 'TKT'},
    {name: 'UDR'}
  ];

  EstimateCtrl.doEstimate = function () {
    EstimateCtrl.ta.estcost = ((EstimateCtrl.ta.totaltripexpense * .2) + EstimateCtrl.ta.totaltripexpense).toFixed(2);
  };

  EstimateCtrl.pleaseWait = EstimateFactory.getTa(EstimateCtrl.taid).then(function (response) {
    EstimateCtrl.ta = response.data;

    EstimateCtrl.ta.formtype = 'estimate'; // for button-types view
    EstimateCtrl.username = SecurityFactory.getCurrentUsername();
    EstimateCtrl.ta.preparer = EstimateCtrl.username;
    if (EstimateCtrl.ta.departuredate !== '') {
      EstimateCtrl.ta.departuredate = new Date(EstimateCtrl.ta.departuredate);
    }
    if (EstimateCtrl.ta.returndate !== '') {
      EstimateCtrl.ta.returndate = new Date(EstimateCtrl.ta.returndate);
    }
    EstimateCtrl.ta.estimatorid = StaffFactory.getIdFromUsername(EstimateCtrl.username)
      .then(function (data) {
      EstimateCtrl.ta.estimatorid = data;
    });

    EstimateFactory.getOos(EstimateCtrl.taid, function (oosResponse) {
      if (response.data.id) {
        EstimateCtrl.oos = oosResponse.data;
      } else {
        CreateFactory.EmptyOosBeanService().then(function (data) {
          EstimateCtrl.oos = data;
        });
      }
    });

    EstimateFactory.getFinancialCodes(EstimateCtrl.taid, function (fcResponse) {
      if (response.data.id !== 'false') {
        // $log.info(fcResponse);
        EstimateCtrl.fcodes = fcResponse.data;
        // } else {
        //   $log.info('no data');
    }
    });


    EstimateCtrl.expenses = EstimateFactory.getExpenses(EstimateCtrl.taid).then(function (expResponse) {
      if (expResponse.data !== 'false') {
        EstimateCtrl.expenses = expResponse.data;

        // Totals
        // EstimateCtrl.milestotal = EstimateFactory.getTotals(expResponse.data, 'miles');
        /*
           EstimateCtrl.surfmileagetotal = EstimateFactory.getTotals(expResponse.data, 'surfmileage');
           EstimateCtrl.surfothertotal = EstimateFactory.getTotals(expResponse.data, 'othertrans');
           EstimateCtrl.lodgetotal = EstimateFactory.getTotals(expResponse.data, 'lodging');
           EstimateCtrl.mietotal = EstimateFactory.getTotals(expResponse.data, 'mie');
           EstimateCtrl.othertotal = EstimateFactory.getTotals(expResponse.data, 'other');

           var oopTotals = EstimateCtrl.milestotal +
           EstimateCtrl.surfmileagetotal + EstimateCtrl.surfothertotal +
           EstimateCtrl.lodgetotal + EstimateCtrl.mietotal +
           EstimateCtrl.othertotal;

           EstimateCtrl.oopExpenses = oopTotals.toFixed(2);

           EstimateCtrl.expenses = expResponse.data;

           } else {
           $log.info('no data');
           }
         */
    } else {
      EstimateFactory.getExpenseBean().then(function (data) {
        EstimateCtrl.expenses = data;
      });
    }
  }, function (expResponse) {
    console.dir(expResponse);
  });


  EstimateFactory.getOnecards(EstimateCtrl.taid).then(function (ocResponse) {
    if (ocResponse.data !== 'false') {
      EstimateCtrl.onecards = ocResponse.data;
      // EstimateCtrl.onecardtotal = EstimateFactory.getTotals(ocResponse.data, 'amount');
      // EstimateCtrl.onecards = ocResponse.data;
    } else {
      EstimateFactory.getOnecardBean().then(function (data) {
        EstimateCtrl.onecards = data;
      });
    }
  }, function (ocResponse) {
    $log.error(ocResponse);
  });


  EstimateFactory.getTrws(EstimateCtrl.taid, function (trwResponse) {
    if (trwResponse.data !== 'false') {
      // $log.info(trwResponse);
      EstimateCtrl.trws = trwResponse.data;
      // } else {
      // $log.info('no data');
  }
  });


}, function (trwResponse) {
  console.dir(trwResponse);
});

EstimateCtrl.addFincode = function () {
  EstimateFactory.getFCodeBean().then(function (fcResponse) {
    const i = EstimateCtrl.fcodes.length;
    EstimateCtrl.fcodes[i] = fcResponse.data;
  });
};

EstimateCtrl.delFinCode = function (fcode) {
  const index = EstimateCtrl.fcodes.indexOf(fcode);
  EstimateCtrl.fcodes.splice(index, 1);
};

EstimateCtrl.addExpense = function () {
  EstimateFactory.getExpenseBean().then(function (expResponse) {
    const i = EstimateCtrl.expenses.length;
    EstimateCtrl.expenses[i] = expResponse.data;
  });
};

EstimateCtrl.delExpense = function(expense) {
  const index = EstimateCtrl.expenses.indexOf(expense);
  EstimateCtrl.expenses.splice(index, 1);
};

EstimateCtrl.addOnecard = function () {
  EstimateFactory.getOnecardBean().then(function (response) {
    const i = EstimateCtrl.onecards.length;
    EstimateCtrl.onecards[i] = response.data;
  });
};

EstimateCtrl.delOnecard = function (ocard) {
  const index = EstimateCtrl.onecards.indexOf(ocard);
  EstimateCtrl.onecards.splice(index, 1);
};

EstimateCtrl.addTrw = function () {
  EstimateFactory.getTrwBean().then(function (response) {
    const i = EstimateCtrl.trws.length;
    EstimateCtrl.trws[i] = response.data;
  });
};

EstimateCtrl.delTrw = function (trw) {
  const index = EstimateCtrl.trws.indexOf(trw);
  EstimateCtrl.trws.splice(index, 1);
};

// totalSurfMileage + totalOtherTrans + totalLodging + totalMie + totalOther

// Actions
EstimateCtrl.save = function (estimateform, isSending) {
  $rootScope.$broadcast('show-errors-check-validity');

  if (estimateform.$invalid) {
    return;
  }

  EstimateCtrl.ta.departuredate = new Date(EstimateCtrl.ta.departuredate);
  EstimateCtrl.ta.returndate = new Date(EstimateCtrl.ta.returndate);

  EstimateCtrl.pleaseWait = $http({
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
    },
    method: 'POST',
    params: {
      expenses: angular.toJson(EstimateCtrl.expenses),
      fincodes: angular.toJson(EstimateCtrl.fcodes),
      method: 'save',
      onecards: angular.toJson(EstimateCtrl.onecards),
      oostate: EstimateCtrl.oos,
      returnFormat: 'json',
      ta: EstimateCtrl.ta,
      trws: angular.toJson(EstimateCtrl.trws)

    },
    url: 'model/controller/Estimate.cfc'
  }).then(function (data) {
    $log.info(data);
    if (data.data.TYPE === 'success') {
      ngToast.create({
        className: 'success',
        content: 'Estimation for TA ' + EstimateCtrl.tanumber + ' has been saved'
      });
      $location.path('/');
    } else {
      ngToast.create({
        className: 'danger',
        // content: 'Something went wrong, your TA was not saved. Please try again.'
        content: data.data.DETAIL.Message
      });
      $log.error(data.DETAIL);
    }
  }, function (data) {
    ngToast.create({
      className: 'danger',
      content: data.statusText
    });
    console.dir(data);
  });
};


EstimateCtrl.dodelete = function (taid) {
  $uibModal.open({
  animation: true,
  controller: 'DeleteController',
  resolve: {
    taid: function () {
      return taid;
    }
  },
  templateUrl: 'delete-confirmation.html'
  });

};

EstimateCtrl.cancel = function () {
  $uibModal.open({
    animation: true,
    controller: 'EstimateCancelController',
    controllerAs: 'CancelCtrl',
    templateUrl: 'js/estimate/cancelDialog.html'
  });

};

EstimateCtrl.send = function (taid) {
    EstimateCtrl.pleaseWaitTop = $http({
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
      },
      method: 'POST',
      params: {
        // estimatorid: parseInt(EstimateCtrl.ta.estimatorid, 10),
        expenses: angular.toJson(EstimateCtrl.expenses),
        fincodes: angular.toJson(EstimateCtrl.fcodes),
        method: 'save',
        onecards: angular.toJson(EstimateCtrl.onecards),
        oostate: EstimateCtrl.oos,
        returnFormat: 'json',
        ta: EstimateCtrl.ta,
        trws: angular.toJson(EstimateCtrl.trws)
      },
      url: 'model/controller/Estimate.cfc'
    }).then(function (data) {
      const sendurl = '/send/' + taid;
      $location.path(sendurl);
    }, function (data) {
      ngToast.create({
        className: 'danger',
        // content: 'Something went wrong, your TA was not saved. Please try again.'
        content: data.data.DETAIL.Message
      });
      $log.error(data.DETAIL);
    });
};

$scope.$watchCollection('EstimateCtrl.expenses', function () {
  // let expenseLength = EstimateCtrl.expenses.length;
  // for (let thisexpense in EstimateCtrl.expenses) {
  // EstimateCtrl.expenses[thisexpense].surfmileage = EstimateCtrl.expenses[thisexpense].miles * EstimateCtrl.ta.mileagerate;
  // }
  // $log.info('expenseLength: ' + expenseLength);

  $filter('sumTotals');
});

}

export default EstimateController;
