// Karma configuration
// Generated on Fri Oct 03 2014 11:09:55 GMT+0800 (CST)

module.exports = function(config) {
  config.set({
    basePath: '..',
    frameworks: ['jasmine'],
    files: [
      'bower_components/angular/angular.js',
      'bower_components/angular-mocks/angular-mocks.js',
      'build/angular-tau-utils.js',
      'test/**/*.coffee'
    ],
    exclude: [
      'test/**/*.swp'
    ],
    preprocessors: {
      'test/**/*.coffee': ['coffee'],
      'build/angular-tau-utils.js': ['coverage'],
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
      type: 'text',
      dir: 'coverage/'
    },
    singleRun: true
  });
};
