/// <reference path='./../types.ts' />
import Base64 from './base64.factory';
import chkEmpty from './chkempty.filter';
import DeleteFactory from './delete.factory';
import dynamicTextSize from './dynamictextsize.directive';
import EmailFactory from './email.factory';
import rounded from './rounded.filter';
import SecurityFactory from './security.factory';
import WorkflowFactory from './workflow.factory';

export default angular.module('eta.core', [
])
    .directive('dynamicTextSize', dynamicTextSize)
    .factory('Base64', Base64)
    .factory('DeleteFactory', DeleteFactory)
    .factory('EmailFactory', EmailFactory)
    .factory('SecurityFactory', SecurityFactory)
    .factory('WorkflowFactory', WorkflowFactory)
    .filter('rounded', rounded)
    .filter('chkEmpty', chkEmpty);
