import CreateFactory from './../create/create.factory';
import EditController from './edit.controller';
import EditFactory from './edit.factory';

export default angular.module('edit', [

])
    .controller('EditController', EditController)
    .factory('CreateFactory', CreateFactory)
    .factory('EditFactory', EditFactory);
