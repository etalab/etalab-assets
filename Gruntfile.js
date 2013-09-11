module.exports = function(grunt) {
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        webfont: {
            icons: {
                src: 'icons/*.svg',
                dest: 'fonts',
                destCss: 'less',
                options: {
                    stylesheet: 'less',
                    relativeFontPath: '../fonts',
                    destHtml: '.'
                }
            }
        }
    });

    // Load libs
    grunt.loadNpmTasks('grunt-webfont');

    // Register the default tasks
    grunt.registerTask('default', ['webfont']);

};
