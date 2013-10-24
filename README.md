ETALAB common assets
====================

ETALAB Shared assets (style, fonts, favicon...)

## Usage

Use this assets in your projects using bower:

```bash
$ bower install etalab-assets
$ bower install https://github.com/etalab/etalab-assets.git
```

The search engine expect the following html tags to find the API to query:

```html+jinja
<meta name="domain" content="{{ etalab domain }}" />
<link rel="home" href="{{ etalab home url }}" />
<link rel="wiki" href="{{ etalab wiki url }}" />
<link rel="wiki-api" href="{{ etalab wiki api url }}" />
<link rel="questions" href="{{ etalab questions url }}" />
```

The localization use the ``<html>`` tag ``lang`` attribute to guess the locale:

```html
<html lang="fr">
```

## Developement

This project use Grunt to manage development workflow.

### System dependencies

You need the following system dependencies to build the fonts:
- fontforge
- ttfautohint

You can install them with you package manager:

```bash
# Linux (apt-based)
$ sudo apt-get install fontforge ttfautohint
# Mac OS X (Homebrew)
$ brew install fontforge ttfautohint
```

### Global Node.js dependencies

You need the following globally installed node dependencies:
- bower
- grunt-cli

```bash
$ sudo npm install -g bower grunt-cli less
```

### Go !

You need to install the required dependencies using `bower` and `npm`:

```bash
$ bower install && npm install
```

In order to have livereload in browser while developing, just run:

```bash
$ grunt demo
```

You can customize some parameters with a `data/local.json` file:

```json
{
    "domain": "etalab.dev",
    "home": "http://www.etalab.dev",
    "wiki": "http://wiki.etalab.dev",
    "wiki_api": "http://wiki.etalab.dev/api.php",
    "questions": "http://questions.etalab.dev"
}
```

To force webfonts regeneration:

```bash
$ grunt webfont
```

### Live reload

The demo use live reload to improve the workflow.

To benefit of it, you need to install the browser extension:

- [Chrome extension](https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei)
- [Firefox extension](https://addons.mozilla.org/fr/firefox/addon/livereload/)
