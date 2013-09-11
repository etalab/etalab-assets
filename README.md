Mediawiki ETALAB
================

MediaWiki skin for ETALAB

## Requirements

* Webserver with PHP (needed for MediaWiki)
* MediaWiki 1.18.1 or higher (1.18.1 was the first release with jQuery 1.7+, needed for Bootstrap)


## Installation

1. Change to the "skins" subdirectory of your MediaWiki installation:

   ```
   cd skins
   ```

2. Clone the repository:

   ```
   git clone https://github.com/etalab/mediawiki-etalab-skin etalab
   ```

3. Add the following to `LocalSettings.php`:

   ```php
   require_once( "$IP/skins/etalab/etalab.php" );
   $wgDefaultSkin = "etalab";
   ```

   (You may safely remove or comment out other mentions of
   `$wgDefaultSkin`.)

4. Customize behavior with variables. (See below)


## Customizations

You can customize the skin behavior with the following options

### ETALAB Data site url

Customize the base URL used to feed the sidebar links and search
by setting the ``$wgEtalabDataUrl`` in your ``LocalSettings.php``.

Default value: 'http://data.gouv.fr'


### Settings the theme to existing users

```console
$ cd maintenance
$ php userOptions.php skin --old "vector" --new "etalab"
```


## Hacking

We use bower, grunt, uglify and less to build assets so you need to have them installed:

```console
$ sudo npm install -g bower less uglifyjs grunt-cli
```


Install needed dependencies:

```console
$ npm install && bower install
```

Build the assets:

```console
$ grunt
```

