// vim: set ft=javascript

(function() {
    'use strict';
}());

var gulp = require('gulp'),
    gutil = require('gulp-util'),
    autoprefixer = require('gulp-autoprefixer'),
    concat = require('gulp-concat'),
    debug = require('gulp-debug'),
    sass = require('gulp-sass'),
    sourcemaps = require('gulp-sourcemaps');

var bower = 'bower_components/';
var paths = {
    // Sources
    scss: [bower + 'normalize-scss/sass/normalize.scss', 'src/scss/*.scss'],
    // Destinations
    css: 'static/css/',
    js: 'static/js/'
};

var sassOptions = {
    errLogToConsole: true,
    outputStyle: 'expanded'
};

gulp.task('sass', function() {
    var sassOptions = {
        errLogToConsole: true,
        outputStyle: 'expanded',
        includePaths: [
            bower + 'support-for/sass',
            bower + 'normalize-scss/sass'
        ]
    };
    return gulp.src(paths.scss)
        //.pipe(sourcemaps.init())
        .pipe(sass(sassOptions).on('error', sass.logError))
        //.pipe(sourcemaps.write())
        .pipe(autoprefixer())
        .pipe(debug())
        .pipe(gulp.dest(paths.css));
});

gulp.task('css', ['sass'], function() {
    // Copy CSS assets into place
    return gulp.src(bower + 'font-awesome/css/*.min.css')
        .pipe(gulp.dest(paths.css));
});

// Copy vendor dependencies into place
gulp.task('vendor', function() {
    return gulp.src(bower + 'MathJax/MathJax.js')
        .pipe(gulp.dest(paths.js));
        // .pipe(debug())
});

gulp.task('watch', function() {
    gutil.log("Watching...");
    gulp.watch(paths.scss, ['sass']);
    gulp.watch(paths.bower + 'MathJax/**', ['vendor']);
});

gulp.task('default', ['watch'], function() {
    return gutil.log('Gulp is running.');
});
