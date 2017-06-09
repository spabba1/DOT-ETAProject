/// <reference path="./../types.ts" />
import ApprovalsController from './approvals.controller';
import ApprovalModalController from './approvalmodal.controller';
import RejectReasonModalController from './rejectreasonmodal.controller';

export default angular.module('approvals', [

])
    .controller('ApprovalsController', ApprovalsController)
    .controller('ApprovalModalController', ApprovalModalController)
    .controller('RejectReasonModalController', RejectReasonModalController);
