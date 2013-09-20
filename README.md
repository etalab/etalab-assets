ETALAB common assets
====================

ETALAB Shared assets (style, fonts, favicon...)

## Usage

Use this assets in your projects using bower:

```console
$ bower install https://github.com/etalab/etalab-assets.git
```

The search engine expect the following html tags to find the API to query:

```html+jinja
<link rel="home" href="{{ etalab home url }}" />
<link rel="wiki" href="{{ etalab wiki url }}" />
<link rel="questions" href="{{ etalab questions url }}" />
```

The localization use the ``<html>`` tag ``lang`` attribute to guess the locale:

```html
<html lang="fr">
```
