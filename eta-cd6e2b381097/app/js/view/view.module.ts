import ViewController from './view.controller';
import ViewFactory from './view.factory';

export default angular.module('view', [])
    .controller('ViewController', ViewController)
    .factory('ViewFactory', ViewFactory);
