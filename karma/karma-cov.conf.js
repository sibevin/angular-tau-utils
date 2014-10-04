module.exports = function(config) {
  config.set({
    basePath: '..',
    frameworks: ['jasmine'],
    files: [
      'bower_components/angular/angular.js',
      'bower_components/angular-mocks/angular-mocks.js',
      'lib/**/*.js',
      'test/**/*.coffee'
    ],
    exclude: [
      'test/**/*.swp'
    ],
    preprocessors: {
      'test/**/*.coffee': ['coffee'],
      'lib/**/*.js': ['coverage'],
      'dist/angular-tau-utils.js': ['coverage'],
    },
    reporters: ['progress', 'coverage'],
    port: 9876,
    colors: true,
    // level of logging
    // possible values: config.LOG_DISABLE || config.LOG_ERROR || config.LOG_WARN || config.LOG_INFO || config.LOG_DEBUG
    logLevel: config.LOG_INFO,
    autoWatch: true,
    browsers: ['PhantomJS'],
    coverageReporter: {
      type: 'html',
      dir: 'coverage/'
    },
    singleRun: true
  });
};
