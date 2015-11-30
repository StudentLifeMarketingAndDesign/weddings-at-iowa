module.exports = function(grunt) {

  var globalConfig = {
    themeDir: 'themes/weddings-foundation'
  };

  // Project configuration.
  grunt.initConfig({
    globalConfig: globalConfig,
    pkg: grunt.file.readJSON('package.json'),

    sass: {
      dist: {
        files: {
          '<%=globalConfig.themeDir %>/css/app.css' : '<%=globalConfig.themeDir %>/scss/app.scss'
        },                  // Target
        options: {              // Target options
          style: 'compressed',
          loadPath: [
          '<%=globalConfig.themeDir %>/bower_components/foundation/scss'
          ],
          sourcemap: true
        }
      }
    },
    //concat all the files into the build folder includePaths: 

    concat: {
      js:{
        src: [
          'division-bar/js/division-bar.js',
          '<%=globalConfig.themeDir %>/bower_components/foundation/js/foundation.min.js',
          '<%=globalConfig.themeDir %>/bower_components/formstone/src/js/core.js',
          '<%=globalConfig.themeDir %>/bower_components/formstone/src/js/mediaquery.js',
          '<%=globalConfig.themeDir %>/bower_components/formstone/src/js/swap.js',
          '<%=globalConfig.themeDir %>/bower_components/formstone/src/js/navigation.js',
          '<%=globalConfig.themeDir %>/bower_components/formstone/dist/js/touch.js',
          '<%=globalConfig.themeDir %>/bower_components/formstone/dist/js/carousel.js',
          '<%=globalConfig.themeDir %>/bower_components/flexslider/jquery.flexslider.js',
         '<%=globalConfig.themeDir %>/bower_components/blazy/blazy.js',
          //'<%=globalConfig.themeDir %>/bower_components/flickity/dist/flickity.pkgd.js',
          '<%=globalConfig.themeDir %>/javascript/lib/*.js',
          '<%=globalConfig.themeDir %>/javascript/*.js'
        ],
        dest: '<%=globalConfig.themeDir %>/build/build.src.js'
      }
    },

    //minify those concated files
    //toggle mangle to leave variable names intact

    uglify: {
      my_target:{
        files:{
        '<%=globalConfig.themeDir %>/build/build.js': ['<%=globalConfig.themeDir %>/build/build.src.js'],
        }
      }
    },

    watch: {
      scripts: {
        files: ['<%=globalConfig.themeDir %>/javascript/*.js', '<%=globalConfig.themeDir %>/javascript/**/*.js'],
        tasks: ['concat', 'uglify'],
        options: {
          spawn: true,
        }
      },
      css: {
        files: ['<%=globalConfig.themeDir %>/scss/*.scss',
                '<%=globalConfig.themeDir %>/scss/**/*.scss',
                'division-bar/scss/*.scss'
                ],
        tasks: ['sass'],
        options: {
          spawn: true,
        }
      }
    },

  });

  // Load the plugin that provides the "uglify" task.
  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-sass');
  grunt.loadNpmTasks('grunt-contrib-imagemin');
  grunt.loadNpmTasks('grunt-contrib-watch');

  // Default task(s).
  // Note: order of tasks is very important
  grunt.registerTask('default', ['sass', 'concat', 'uglify', 'watch']);

};