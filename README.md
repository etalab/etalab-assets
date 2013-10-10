ETALAB common assets
====================

ETALAB Shared assets (style, fonts, favicon...)

## Usage

Use this assets in your projects using bower:

```console
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
You need to install the required dependencies using `npm`:

```console
$ npm install
```

In order to have livereload in browser while developing, just run:

```console
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

```console
$ grunt webfont
```
