import ToEstimateController from './toestimate.controller';
import RejectReasonController from './rejectreason.controller';
import ToEstimateFactory from './toestimate.factory';

export default angular.module('toestimate', [])
    .controller('ToEstimateController', ToEstimateController)
    .controller('RejectReasonController', RejectReasonController)
    .factory('ToEstimateFactory', ToEstimateFactory);
