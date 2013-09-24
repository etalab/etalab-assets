/**
 * Site-wide features, helpers and fixes
 */
(function($) {

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

        HOME_URL = $('link[rel="home"]').attr('href'),
        WIKI_URL = $('link[rel="wiki"]').attr('href'),
        WIKI_API = $('link[rel="wiki-api"]').attr('href'),
        QUESTIONS_URL = $('link[rel="questions"]').attr('href'),

        ORIGIN = window.location.origin || window.location.protocol + "//" + window.location.hostname,

        CKAN_API_URL = HOME_URL + '/api/3/action/package_search?rows=10&q=%QUERY',
        ASKBOT_API_URL = QUESTIONS_URL + '/api/v1/questions?query=%QUERY',
        WIKI_API_URL = WIKI_API + '?',
        wikiParams = {
            format: 'json',
            action: 'query',
            list: 'search',
            srsearch: '__QUERY',
            srprop: 'timestamp'
        },

        LANG = $('html').attr('lang') || 'en',

        HEADERS = {
            'fr': {
                'topics': 'Thématiques',
                'questions': 'Questions',
                'datasets': 'Jeux de données'
            },
            'en': {
                'topics': 'Topics',
                'questions': 'Questions',
                'datasets': 'Datasets'
            }
        };

    if (WIKI_API.indexOf(ORIGIN) < 0) {
        wikiParams.origin = ORIGIN;
    }
    WIKI_API_URL = WIKI_API_URL + $.param(wikiParams);

    /**
     * Filter the Territory API to match Typeahead expected format.
     */
    var filter_territory_api = function(response) {
        return response.data.items;
    };

    var filter_mediawiki_api = function(response) {
        return response.query.search;
    };

    var filter_ckan_api = function(response) {
        return response.result.results;
    };

    var filter_askbot_api = function(response) {
        return response.questions;
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
            domain: $('<a/>').prop('href', HOME_URL).prop('hostname'),
            path: '/'
        };


        // Fix collapse on sidebar
        $("#sidebar .panel-heading a").on('click', function (e) { e.preventDefault(); });

        // Display tooltips and popovers
        $('[rel=tooltip]').tooltip();
        $('[rel=popover]').popover();

        // Search field behavior
        $('#search-input')
            .typeahead([
                {
                    name: 'CKAN',
                    header: HEADERS[LANG].datasets,
                    valueKey: 'title',
                    remote: {
                        url: CKAN_API_URL,
                        filter: filter_ckan_api
                    }
                },
                {
                    name: 'Wiki',
                    header: HEADERS[LANG].topics,
                    valueKey: 'title',
                    remote: {
                        url: WIKI_API_URL,
                        wildcard: '__QUERY',
                        filter: filter_mediawiki_api
                    }
                },
                {
                    name: 'Questions',
                    header: HEADERS[LANG].questions,
                    valueKey: 'title',
                    remote: {
                        url: ASKBOT_API_URL,
                        filter: filter_askbot_api
                    }
                }
            ])
            .on('typeahead:selected typeahead:autocompleted', function(e, data, dataset) {
                switch (dataset) {
                    case 'Wiki':
                        window.location = WIKI_URL + '/' + data.title;
                        break;
                    case 'CKAN':
                        window.location = HOME_URL + '/' + LANG + '/dataset/' + data.name;
                        break;
                    case 'Questions':
                        window.location = QUESTIONS_URL + '/question/' + data.id + '/' + data.title;
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


}(window.jQuery));
