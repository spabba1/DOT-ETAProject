'use strict';

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }

var _gulp = require('gulp');

var _gulp2 = _interopRequireDefault(_gulp);

var _browserSync = require('browser-sync');

var _browserSync2 = _interopRequireDefault(_browserSync);

var reload = _browserSync2['default'].reload;

var config = require('../../config').watch;

/**
 * Start browsersync task and then watch files for changes
 */
_gulp2['default'].task('watch', ['browsersync'], function () {
  _gulp2['default'].watch(config.html, ['html', reload]);
  _gulp2['default'].watch(config.sass, ['sass', 'scsslint', reload]);
  _gulp2['default'].watch(config.scripts, ['scripts', 'jshint', reload]);
  _gulp2['default'].watch(config.images, ['images', reload]);
  _gulp2['default'].watch(config.svg, ['reload']);
  _gulp2['default'].watch(config.sprites, ['reload']);
  _gulp2['default'].watch(config.coldfusion, ['coldfusion', reload]);
});

//# sourceMappingURL=watch-compiled.js.map