import EstimateController from './estimate.controller';
import EstimateCancelController from './estimatecancel.controller';
import EstimateFactory from './estimate.factory';
import StaffFactory from './../staff/staff.factory';
import sumTotals from './sumtotals.filter';
import totalOutOfPocket from './totalOutOfPocket.filter';

export default angular.module('estimate', [
])
    .controller('EstimateController', EstimateController)
    .controller('EstimateCancelController', EstimateCancelController)
    .factory('EstimateFactory', EstimateFactory)
    .factory('StaffFactory', StaffFactory)
    .filter('sumTotals', sumTotals)
    .filter('totalOutOfPocket', totalOutOfPocket);

