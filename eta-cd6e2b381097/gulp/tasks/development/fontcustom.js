import gulp from 'gulp';
import shell from 'gulp-shell';

/**
 * Generate fonts with Fontcustom
 * `brew install fontforge --with-python`
 * `brew install eot-utils`
 */
gulp.task('fontcustom', shell.task([
  'bundle exec fontcustom compile'
]));
