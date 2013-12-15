{% extends "templates/base.swig" %}

{% block "extra-head" %}
<link rel="stylesheet" media="screen" href="bower/bootstrap-select/bootstrap-select.css">
<link rel="stylesheet" media="screen" href="bower/bootstrap-markdown/css/bootstrap-markdown.min.css">
<link rel="stylesheet" media="screen" href="bower/tagmanager/tagmanager.css">
{% endblock %}

{% block "content" %}

{% include 'templates/subnav-s.swig' %}

<section class="error">
    <div class="animation"></div>
    <div class="container">
        <div class="jumbotron">
            <div class="container">
                <h1>Error !</h1>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Enim, numquam, magnam, voluptates, molestiae ducimus facilis alias adipisci ab dolores natus dolorem velit blanditiis incidunt necessitatibus voluptatum id quos fugiat aliquid.</p>
                <p><a class="btn btn-primary btn-lg">Learn more</a></p>
            </div>
        </div>
    </div>
</section>
{% endblock %}

{% block "extra-js" %}
<script src="bower/jquery.easing/js/jquery.easing.js"></script>
<script src="js/animation/edge.1.0.0.min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/animation/Dataguv-dynamic-bg_edgePreload.js"></script>
{% endblock %}
