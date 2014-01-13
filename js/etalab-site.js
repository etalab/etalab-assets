/**
 * Site-wide features, helpers and fixes
 */
(function($, swig) {

    "use strict";

    var TERRYTORIES_END_POINT = '//ou.comarquage.fr/api/v1/autocomplete-territory',
        TERRITORIES_KIND = [
            'ArrondissementOfCommuneOfFrance',
            'CommuneOfFrance',
            'Country',
            'DepartmentOfFrance',
            'MetropoleOfCountry',
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
        ].join(''),
        TERRITORY_TPL = [
            '<p>',
            '{{display_name}}',
            '&nbsp;',
            '{% if postal %}<i>({{ postal }})</i>{% endif %}',
            '</p>'
        ].join('');


    if (WIKI_API.indexOf(ORIGIN) < 0) {
        wikiParams.origin = ORIGIN;
    }
    WIKI_API_URL = WIKI_API_URL + $.param(wikiParams);

    // Exports common form validation rules
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


    var format_territory = function(territory) {
        var postal = territory.main_postal_distribution.split(' ');
        if (postal.length > 1 && !isNaN(postal[0])) {
            territory.display_name = postal.slice(1, postal.length).join(' ');
            territory.postal = postal[0];
        } else {
            territory.display_name = territory.main_postal_distribution;
        }
        return territory;
    };

    /**
     * Filter the Territory API to match Typeahead expected format.
     */
    var filter_territory_api = function(response) {
        return response.data.items.map(format_territory);
    };

    var filter_mediawiki_api = function(response) {
        return response.query.search;
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

    // Export shared configuration
    var Config = window.EtalabConfig = {
        rules: window.ETALAB_VALIDATION_RULES,
        urls: {
            home: HOME_URL,
            wiki: WIKI_URL,
            wiki_api: WIKI_API_URL,
            wikiPage: function(page) {
                return WIKI_URL + '/' + page;
            },
            dataset: function(name) {
                return HOME_URL + '/' + LANG + '/dataset/' + name;
            },
            organization: function(name) {
                return HOME_URL + '/' + LANG + '/organization/' +name;
            }
        },
        typeahead: {
            // Typeahead
            organizations: {
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
            datasets: {
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
            wiki: {
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
            },
            territories: {
                // name: 'Territory'
                name: 'territories',
                valueKey: 'main_postal_distribution',
                engine: SWIG_ENGINE,
                template: TERRITORY_TPL,
                remote: {
                    url: TERRITORY_API_URL,
                    wildcard: '_QUERY',
                    dataType: 'jsonp',
                    filter: filter_territory_api,
                    beforeSend: fix_url
                }
            }
        }
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
                Config.typeahead.organizations,
                Config.typeahead.datasets,
                Config.typeahead.wiki
            ])
            .on('typeahead:selected', function(e, data, dataset) {
                switch (dataset) {
                    case 'Wiki':
                        window.location = Config.urls.wikiPage(data.title);
                        break;
                    case 'Datasets':
                        window.location = Config.urls.dataset(data.name);
                        break;
                    case 'Organizations':
                        window.location = Config.urls.organization(data.name);
                        break;
                }
            });


        $('#where-input')
            .typeahead(Config.typeahead.territories)
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

    return EtalabConfig;

}(window.jQuery, window.swig));
