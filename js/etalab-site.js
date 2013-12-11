/**
 * Site-wide features, helpers and fixes
 */
(function($, swig) {

    "use strict";

    var TERRYTORIES_END_POINT = 'http://ou.comarquage.fr/api/v1/autocomplete-territory',
        TERRITORIES_KIND = [
            'ArrondissementOfCommuneOfFrance',
            'CommuneOfFrance',
            'Country',
            'DepartmentOfFrance',
            'OverseasCollectivityOfFrance',
            'RegionOfFrance'
        ],
        TERRITORY_API_URL = TERRYTORIES_END_POINT + '?' + $.param({ kind: TERRITORIES_KIND, term: '_QUERY'}, true),
        COOKIE_NAME = 'territory-infos',

        DOMAIN = $('meta[name="domain"]').attr('content'),
        HOME_URL = $('link[rel="home"]').attr('href'),
        WIKI_URL = $('link[rel="wiki"]').attr('href'),
        WIKI_API = $('link[rel="wiki-api"]').attr('href'),

        ORIGIN = window.location.origin || window.location.protocol + "//" + window.location.hostname,

        MAX_DATASETS = 5,
        MAX_ORGANIZATIONS = 2,
        MAX_TOPICS = 2,
        MAX_QUESTIONS = 2,

        DATASET_API_URL = HOME_URL + '/dataset/autocomplete?num='+MAX_DATASETS+'&q=%QUERY',
        ORGANIZATION_API_URL = HOME_URL + '/organization/autocomplete?num='+MAX_ORGANIZATIONS+'&q=%QUERY',
        WIKI_API_URL = WIKI_API + '?',
        wikiParams = {
            format: 'json',
            action: 'query',
            list: 'search',
            srlimit: MAX_TOPICS,
            srsearch: '__QUERY',
            srprop: 'timestamp'
        },

        LANG = $('html').attr('lang') || 'en',

        /**
         * Swig adapter for typeahead.js templatre engine
         * @type {Object}
         */
        SWIG_ENGINE = {
            compile: function(template) {
                var tpl = swig.compile(template);

                return {
                    render: function(context) {
                        return tpl(context);
                    }
                };
            }
        },

        /**
         * Typeahead.js datasets titles
         * @type {Object}
         */
        HEADERS = {
            'fr': {
                'topics': 'Thématiques',
                'organizations': 'Organisations',
                'datasets': 'Jeux de données'
            },
            'en': {
                'topics': 'Topics',
                'organizations': 'Organizations',
                'datasets': 'Datasets'
            },
            'de': {
                'topics': 'Themen',
                'organizations': 'Organisationen',
                'datasets': 'Datensätze'
            }
        },
        headerTmpl = swig.compile('<p class="search-header"><strong>{{title}}</strong></p>'),
        LOGO_TPL = [
            '<div class="logo">',
            '<img src="{{image_url}}">',
            '</div>',
            '<p>{{title}}</p>'
        ].join(''),
        INFO_TPL = [
            '<p>',
            '<span class="glyphicon glyphicon-info-sign"></span>',
            '&nbsp;',
            '{{title}}',
            '</p>'
        ].join('');


    if (WIKI_API.indexOf(ORIGIN) < 0) {
        wikiParams.origin = ORIGIN;
    }
    WIKI_API_URL = WIKI_API_URL + $.param(wikiParams);

    // Exports commont form validation rules
    window.ETALAB_VALIDATION_RULES = {
        errorClass: "help-block",
        highlight: function(element) {
            $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
        },
        unhighlight: function(element) {
            $(element).closest('.form-group').removeClass('has-error');
        },
        success: function(label) {
            label.closest('.form-group').addClass('has-success');
            if (!label.text()) {
                label.remove();
            }
        }
    };

    /**
     * Filter the Territory API to match Typeahead expected format.
     */
    var filter_territory_api = function(response) {
        return response.data.items;
    };

    var filter_mediawiki_api = function(response) {
        return response.query.search;
    };

    var filter_organization_api = function(response) {
        return response;
    };

    /**
     * Fix JSONP compatibility between API and typeahead.js
     */
    var fix_url = function(jqXhr, settings) {
        settings.url = settings.url.replace('callback', 'jsonp');
    };

    /**
     * Set the territory to filter
     * @param {string} value   the territory key (kind/code)
     * @param {string} display the territory display name
     */
    var set_territory = function(value, display) {
        $('#ext_territory').val(value);
        if (display) {
            $('#where-input').val(display);
        } else {
            display = $('#where-input').val();
        }

        $('#where-group .glyphicon')
            .removeClass('glyphicon-globe')
            .addClass('glyphicon-remove')
            .addClass('territory-clear');

        // Persist the filter into the cookie
        $.cookie(COOKIE_NAME, value + '|' + display);
    };

    /**
     * Clear the current territory filter
     */
    var clear_territory = function() {
        $.removeCookie(COOKIE_NAME, {path: '/'});
        $('#where-input').val(null);
        $('#ext_territory').val(null);
        $('#where-group .glyphicon')
            .removeClass('glyphicon-remove')
            .removeClass('territory-clear')
            .addClass('glyphicon-globe');
    };


    $(function() {
        // Force cookie common parameters
        // raw to not parse the content
        $.cookie.raw = true;
        $.cookie.defaults = {
            // Domain extracted from HOME_URL
            domain: DOMAIN,
            path: '/'
        };


        // Fix collapse on sidebar
        $("#sidebar .panel-heading a").on('click', function (e) { e.preventDefault(); });

        // Set simple ellipsis
        $('.ellipsis-dot').dotdotdot({
            watch: true
        });

        $('.ellipsis-tooltip').dotdotdot({
            watch: true,
            callback: function( isTruncated, orgContent ) {
                if (isTruncated) {
                    $(this).tooltip({
                        title: orgContent.text()
                    });
                }
            }
        });

        // Display tooltips and popovers
        $('[rel=tooltip]').tooltip();
        $('[rel=popover]').popover();

        // Search field behavior
        $('#search-input')
            .typeahead([
                {
                    name: 'Organizations',
                    header: headerTmpl({title: HEADERS[LANG].organizations}),
                    limit: MAX_ORGANIZATIONS,
                    valueKey: 'title',
                    engine: SWIG_ENGINE,
                    template: LOGO_TPL,
                    remote: {
                        url: ORGANIZATION_API_URL
                    }
                },
                {
                    name: 'Datasets',
                    header: headerTmpl({title: HEADERS[LANG].datasets}),
                    limit: MAX_DATASETS,
                    valueKey: 'title',
                    engine: SWIG_ENGINE,
                    template: LOGO_TPL,
                    remote: {
                        url: DATASET_API_URL
                    }
                },
                {
                    name: 'Wiki',
                    header: headerTmpl({title: HEADERS[LANG].topics}),
                    limit: MAX_TOPICS,
                    valueKey: 'title',
                    engine: SWIG_ENGINE,
                    template: INFO_TPL,
                    remote: {
                        url: WIKI_API_URL,
                        wildcard: '__QUERY',
                        filter: filter_mediawiki_api
                    }
                }
            ])
            .on('typeahead:selected typeahead:autocompleted', function(e, data, dataset) {
                switch (dataset) {
                    case 'Wiki':
                        window.location = WIKI_URL + '/' + data.title;
                        break;
                    case 'Datasets':
                        window.location = HOME_URL + '/' + LANG + '/dataset/' + data.name;
                        break;
                    case 'Organizations':
                        window.location = HOME_URL + '/' + LANG + '/organization/' + data.name;
                        break;
                }
            });

        $('#where-input')
            .typeahead({
                name: 'territories',
                valueKey: 'main_postal_distribution',
                remote: {
                    url: TERRITORY_API_URL,
                    wildcard: '_QUERY',
                    dataType: 'jsonp',
                    filter: filter_territory_api,
                    beforeSend: fix_url
                }
            })
            .on('typeahead:selected typeahead:autocompleted', function(e, territory) {
                set_territory(territory.kind + '/' + territory.code);
                $('#search-input').focus();
            })
            ;

        $('#where-group').on('click', '.territory-clear', clear_territory);

        // Restore territory state from cookie
        if ($.cookie(COOKIE_NAME)) {
            var cookie = $.cookie(COOKIE_NAME);
            if (cookie.charAt(0) === '"') {
                cookie = cookie.substring(1);
            }
            if (cookie.charAt(cookie.length - 1) === '"') {
                cookie = cookie.substring(0, cookie.length - 1);
            }
            set_territory.apply(null, cookie.split('|'));
        }
    });


}(window.jQuery, window.swig));
