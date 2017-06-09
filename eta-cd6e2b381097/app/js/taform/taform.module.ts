/// <reference path='../types.ts' />

import FormCancelController from './formcancel.controller';
import OOStateController from './oostatemodalinstance.controller';
import taForm from './taform.directive';
import TaFormController from './taform.controller';
import TaActionButtonsController from './taactionbuttons.controller';
import hideZero from './../core/hidezero.directive';

export default angular.module('taform', [
])
    .controller('FormCancelController', FormCancelController)
    .controller('OOStateController', OOStateController)
    .controller('TaActionButtonsController', TaActionButtonsController)
    .controller('TaFormController', TaFormController)
    .directive('hideZero', hideZero)
    .directive('taForm', taForm);
