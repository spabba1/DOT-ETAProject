import ApprovedController from './approved.controller';
import ApprovedModalController from './approvedmodal.controller';
import ApprovedFactory from './approved.factory';

export default angular.module('approved', [
])
    .controller('ApprovedController', ApprovedController)
    .controller('ApprovedModalController', ApprovedModalController)
    .factory('ApprovedFactory', ApprovedFactory);
