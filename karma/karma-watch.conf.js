module.exports = function(config) {
  config.set({
    basePath: '..',
    frameworks: ['jasmine'],
    files: [
      'bower_components/angular/angular.js',
      'bower_components/angular-mocks/angular-mocks.js',
      'lib/**/*.js',
      'test/**/*.coffee',
    ],
    exclude: [
      'test/**/*.swp'
    ],
    preprocessors: {
      'test/**/*.coffee': ['coffee'],
    },
    reporters: ['progress'],
    port: 9876,
    colors: true,
    // level of logging
    // possible values: config.LOG_DISABLE || config.LOG_ERROR || config.LOG_WARN || config.LOG_INFO || config.LOG_DEBUG
    logLevel: config.LOG_INFO,
    autoWatch: true,
    browsers: ['PhantomJS'],
    singleRun: true// because we need to build src before test, here we don't use karma's auto test, use grunt watch instead.
  });
};
