/// <reference path="./../types.ts" />
import SendController from './send.controller';
import SendForApprovalController from './sendforapproval.controller';
import SendFactory from './send.factory';

export default angular.module('send', [
])
  .controller('SendController', SendController)
  .controller('SendForApprovalController', SendForApprovalController)
  .factory('SendFactory', SendFactory);
