/*global module:false*/
module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({
    // Metadata.
    meta: grunt.file.readJSON('bower.json'),
    banner: '/*! <%= meta.name %> - v<%= meta.version %> - ' +
      '<%= grunt.template.today("yyyy-mm-dd") %>\n' +
      '* <%= meta.homepage %>/\n' +
      '* Copyright (c) <%= grunt.template.today("yyyy") %> ' +
      '<%= meta.authors[0] %>; Licensed <%= meta.license %> */\n',
    // Task configuration.
    coffeelint: {
      app: ['src/**/*.coffee', 'test/**/*.coffee']
    },
    coffee: {
      compile: {
        files: {
          'lib/angular-tau-utils.js': [
            'src/angular_tau_utils.js.coffee',
          ],
          'lib/tau-switcher.js': [
            'src/tau_switcher.js.coffee',
            'src/tau-switcher/**/*.coffee',
          ],
        }
      }
    },
    karma: {
      unit: {
        configFile: 'karma/karma-build.conf.js',
      },
      cov: {
        configFile: 'karma/karma-cov.conf.js',
      },
      watch: {
        configFile: 'karma/karma-watch.conf.js',
      },
    },
    concat: {
      options: {
        stripBanners: true,
        banner: '<%= banner %>',
      },
      dist: {
        src: [
          'lib/angular-tau-utils.js',
          'lib/tau-switcher.js',
        ],
        dest: 'build/angular-tau-utils.js',
      },
    },
    uglify: {
      options: {
        banner: '<%= banner %>'
      },
      dist: {
        src: 'build/angular-tau-utils.js',
        dest: 'build/angular-tau-utils.min.js',
      }
    },
    watch: {
      test_when_src_changed: {
        files: [
          'src/**/*.coffee',
        ],
        tasks: ['lib', 'karma:watch'],
      },
      test: {
        files: [
          'test/**/*.coffee',
        ],
        tasks: ['karma:watch'],
      }
    },
    clean: {
      lib: [
        'lib/',
      ],
      all: [
        'lib/',
        'coverage/',
        'test/**/*.js',
      ],
      pkg: [
        'bower_components/',
        'node_modules/',
      ]
    },
  });

  // These plugins provide necessary tasks.
  grunt.loadNpmTasks('grunt-coffeelint');
  grunt.loadNpmTasks('grunt-contrib-coffee');
  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-karma');

  // Default task.
  grunt.registerTask('default', ['coffeelint', 'coffee', 'concat', 'karma:unit', 'uglify', 'clean:lib']);
  grunt.registerTask('build', ['default']);
  grunt.registerTask('test', ['watch']);
  grunt.registerTask('lib', ['coffeelint', 'coffee']);
  grunt.registerTask('cov', ['coffeelint', 'coffee', 'concat', 'karma:cov']);
  grunt.registerTask('clean_all', ['clean:all']);
  grunt.registerTask('clean_dev', ['clean:all', 'clean:pkg']);
  grunt.registerTask('travis', ['coffeelint', 'coffee', 'concat', 'karma:unit']);

};
