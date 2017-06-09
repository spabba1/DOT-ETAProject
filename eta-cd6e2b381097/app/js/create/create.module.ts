import CreateController from './create.controller';
import TaForModalInstanceController from './taformodalinstance.controller';
import CreateFactory from './create.factory';

export default angular.module('create', [
    ])
    .controller('CreateController', CreateController)
    .controller('TaForModalInstanceController', TaForModalInstanceController)
    .factory('CreateFactory', CreateFactory)
;
