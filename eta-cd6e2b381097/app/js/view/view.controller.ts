ViewController.$inject = [
    '$stateParams',
    'ViewFactory'
];
function ViewController(
        $stateParams,
        ViewFactory
    ) {

    const ViewCtrl = this;

        ViewCtrl.taform = {};
        ViewFactory.getTa($stateParams.taid, function (response) {
            ViewCtrl.ta = response.data;
            ViewCtrl.ta.formtype = 'view';
        });


    }

export default ViewController;
