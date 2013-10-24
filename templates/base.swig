<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="fr"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang="fr"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang="fr"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="fr"> <!--<![endif]-->
<head>
    <meta charset="utf-8">

    <meta name="robots" content="noindex, nofollow">
    <meta name="description" content="Données ouvertes françaises">
    <meta name="author" content="ETALAB">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

    <title>{% block title %}{% endblock %} - Demo - Data.Gouv.fr</title>
    <link rel="shortcut icon" href="img/favicon.png">

    <meta name="domain" content="{{ local.domain|default('etalab2.fr') }}" />
    <link rel="home" href="{{ local.home|default('http://www.etalab2.fr') }}" />
    <link rel="wiki" href="{{ local.wiki|default('http://wiki.etalab2.fr/wiki') }}" />
    <link rel="wiki-api" href="{{ local.wiki_api|default('http://wiki.etalab2.fr/api.php') }}" />
    <link rel="questions" href="{{ local.questions|default('http://ask.etalab2.fr') }}" />

    <link rel="stylesheet" media="screen" href="css/etalab.css">

    <script src="bower/modernizr/modernizr.js"></script>
    <script src="bower/respond/respond.min.js"></script>

</head>
<body>

    {% include 'navbar.swig' %}
    {% include 'subnav.swig' %}

    <div class="container">
        <div class="row">

                {% block "content" %}{% endblock %}
        
        </div>

        <hr/>
        <footer>
            <p class="pull-right"><a href="#">Back to top</a></p>
            <p>
                &copy; 2013 ETALAB, Inc. &middot;
                <a href="#">Privacy</a> &middot;
                <a href="#">Terms</a>
            </p>
        </footer>

    </div>


    <!--[if lt IE 9]>
        <script src="bower/jquery-legacy/index.js"></script>
        <script src="bower/bootstrap/dist/js/bootstrap.js"></script>
        <script src="bower/typeahead.js/dist/typeahead.js"></script>
        <script src="bower/jquery.cookie/jquery.cookie.js"></script>
        <script src="bower/jquery.validation/jquery.validate.js"></script>
        <script src="bower/swig/index.js"></script>
        <script src="js/etalab-site.js"></script>
    <![endif]-->
    <!--[if gte IE 9]><!-->
        <script src="bower/jquery/jquery.js"></script>
        <script src="bower/bootstrap/dist/js/bootstrap.js"></script>
        <script src="bower/typeahead.js/dist/typeahead.js"></script>
        <script src="bower/jquery.cookie/jquery.cookie.js"></script>
        <script src="bower/jquery.validation/jquery.validate.js"></script>
        <script src="bower/swig/index.js"></script>
        <script src="js/etalab-site.js"></script>
    <!--<![endif]-->

    <script>
        $(function() {
            // Test form validation
            $('#demo-form').validate(ETALAB_VALIDATION_RULES);
        });
    </script>
</body>
</html>
