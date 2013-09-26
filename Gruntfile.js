module.exports = function(grunt) {
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        webfont: {
            icons: {
                src: 'icons/*.{svg,eps}',
                dest: 'fonts',
                destCss: 'less',
                options: {
                    stylesheet: 'less',
                    relativeFontPath: '../fonts',
                    font: 'etalab-icons',
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
                    'demo/css/etalab.css': ['less/etalab.less']
                }
            }
        },
        watch: {
            options: {
                spawn: false,
                livereload: true
            },
            less: {
                files: ['less/*.less'],
                tasks: ['less']
            },
            js: {
                files: 'js/*.js',
                tasks: ['test']
            },
            html: {
                files: 'demo/*.html'
            }
        },
        connect: {
            options: {
                hostname: 'localhost',
                port: 9000,
                open: true,
                livereload: true,
                base: ['.', 'demo', 'bower/bootstrap']
            },
            server: {}
        }

    });

    // Load Grunt tasks declared in the package.json file
    require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks);

    grunt.registerTask('dist', ['default', 'webfont']);
    grunt.registerTask('test', ['jasmine', 'jshint']);
    grunt.registerTask('default', ['test', 'webfont']);
    grunt.registerTask('demo', ['default', 'less', 'connect:server', 'watch']);

};
