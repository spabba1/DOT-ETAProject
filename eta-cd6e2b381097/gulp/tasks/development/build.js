import gulp from 'gulp';
import runSequence from 'run-sequence';

gulp.task('build', function () {
    return runSequence(
                ['copy:fonts', 'copy:node'],
                //['html', 'css', 'images', 'copy:fonts', 'coldfusion', 'scripts'],
                // 'copy:node',
                'scripts',
                'jsctags',
                'sass',
                //'pdfsass',
                /*'pdfcss',*/
                'base64'
                );
    //runSequence('delete',
            //['html', 'sass', 'scripts', 'images', 'copy:fonts'],
            //'coldfusion',
            //'modernizr',
            //'base64');
});
