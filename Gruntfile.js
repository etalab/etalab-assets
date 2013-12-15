module.exports = function(grunt) {
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        clean: [
            'demo/*.html',
            'demo/css/*.css'
        ],
        webfont: {
            icons: {
                src: 'icons/*.{svg,eps}',
                dest: 'fonts',
                destCss: 'less/etalab',
                options: {
                    stylesheet: 'less',
                    relativeFontPath: '../../fonts',
                    // font: 'etalab-icons',
                    hashes: false
                }
            }
        },
        jasmine: {
            etalab: {
                src: 'js/**/*.js',
                options: {
                    specs: 'specs/**/*.specs.js',
                    helpers: 'specs/helpers/*.js',
                    template: 'runner.tmpl',
                    vendor: [
                        'bower/jquery/jquery.js',
                        'bower/jquery.cookie/jquery.cookie.js',
                        'bower/bootstrap/dist/js/bootstrap.js',
                        'bower/typeahead.js/dist/typeahead.js',
                        'bower/jquery.dotdotdot/src/js/jquery.dotdotdot.js',
                        'bower/swig/index.js'
                    ],
                    templateOptions: {
                        metas: [
                            {name: 'domain', content: 'fake.fr'}
                        ],
                        links: [
                            {rel: 'home', href: 'http://www.fake.fr'},
                            {rel: 'wiki', href: 'http://wiki.fake.fr'},
                            {rel: 'wiki-api', href: 'http://wiki.fake.fr/api.php'},
                            {rel: 'questions', href: 'http://questions.fake.fr'}
                        ]
                    }
                }
            }
        },
        jshint: {
            all: ['Gruntfile.js', 'js/*.js'],
            options: {
                jshintrc: '.jshintrc',
            }
        },
        less: {
            options: {
                paths: ['bower/bootstrap/less'],
                yuicompress: true
            },
            demo: {
                files: {
                    'demo/css/etalab.css': ['less/etalab.less'],
                    'demo/css/etalab-home.css': ['less/etalab-home.less'],
                    'demo/css/etalab-search.css': ['less/etalab-search.less'],
                    'demo/css/etalab-dataset.css': ['less/etalab-dataset.less'],
                    'demo/css/etalab-topic.css': ['less/etalab-topic.less'],
                }
            }
        },
        watch: {
            less: {
                files: ['less/**/*.less'],
                tasks: ['less']
            },
            font: {
                files: ['icons/*.{svg,eps}'],
                tasks: ['webfont']
            },
            js: {
                files: 'js/*.js',
                tasks: ['test']
            },
            templates: {
                files: [
                    'templates/*.swig',
                    'data/*.{json,yaml}'
                ],
                tasks: ['assemble']
            },
            livereload: {
                options: { livereload: true },
                files: ['demo/**/*', 'js/*.js']
            }
        },
        connect: {
            options: {
                hostname: 'localhost',
                port: 9000,
                open: true,
                livereload: true,
                base: ['.', 'demo', 'bower/bootstrap', 'bower/bootstrap/dist']
            },
            server: {}
        },
        assemble: {
            options: {
                engine: 'swig',
                data: 'data/*'
            },
            demo: {
                expand: true,
                cwd: 'templates',
                src: [
                    'index.swig',
                    // 'index-logged.swig',
                    'dataset.swig',
                    // 'dataset-logged.swig',
                    'search.swig',
                    // 'search-logged.swig',
                    'widgets.swig',
                    // 'wdigets-logged.swig',
                    'topic.swig',
                    'error.swig',
                    'message.swig',
                    'form.swig',
                    // 'topic.swig',
                ],
                dest: 'demo'
            }
        }

    });

    // Load Grunt tasks declared in the package.json file
    require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks);
    grunt.loadNpmTasks('assemble');

    grunt.registerTask('default', ['test']);
    grunt.registerTask('test', ['jasmine', 'jshint']);
    grunt.registerTask('dist', ['default', 'webfont']);
    grunt.registerTask('demo', ['clean', 'default', 'less', 'assemble', 'connect:server', 'watch']);

};
