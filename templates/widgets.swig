{% extends "templates/base.swig" %}

{% block "extra-head" %}
<link rel="stylesheet" media="screen" href="bower/bootstrap-select/bootstrap-select.css">
<link rel="stylesheet" media="screen" href="bower/bootstrap-markdown/css/bootstrap-markdown.min.css">
<link rel="stylesheet" media="screen" href="bower/tagmanager/tagmanager.css">
{% endblock %}

{% block "content" %}

{% include 'templates/subnav-s.swig' %}

<div class="container">
    <div class="page-header">
        <h1>Widget <small>demo</small></h1>
    </div>

    <form class="form-horizontal">
        <div class="form-group input-group input-group-lg">
            <span class="input-group-addon">Hey, typeahead!</span>
            <input type="text" data-provide="typeahead" class="form-control" autocomplete="off" />
        </div>

        <div class="form-group input-group input-group-sm"> <span class="input-group-addon">Hey, small typeahead!</span>
            <input type="text" data-provide="typeahead" class="form-control" autocomplete="off" />
        </div>
    </form>

    {% for size in [150, 100, 80, 50] %}
    <div class="row">
        <div class="col-md-2">
            <div class="publisher-avatar-{{size}}">
                <div class="frame">
                    <a href="" title="As user">
                        <img alt="As user" src="images/avatar-axel.jpg" class="centered">
                    </a>
                </div>
            </div>
        </div>
        <div class="col-md-2">
            <div class="publisher-avatar-{{size}}">
                <div class="frame">
                    <a class="organization" href="" title="Organization">
                        <img alt="WWF" src="images/wwf.jpg">
                    </a>
                    <a class="user" href="" title="User">
                        <img alt="As user" src="images/avatar-axel.jpg">
                    </a>
                </div>
            </div>
        </div>
        <div class="col-md-2">
            <div class="publisher-avatar-{{size}}">
                <div class="frame">
                    <a class="organization" href="" title="Organization">
                        <img alt="WWF" src="images/Ministere-de-l-Ecologie-du-Developpement-Durable-et-de-l-Energie_resultat.png">
                    </a>
                    <a class="user" href="" title="User">
                        <img alt="As user" src="images/avatar-angelo.jpg">
                    </a>
                </div>
            </div>
        </div>
    </div>
    {% endfor %}

</div>
{% endblock %}

{% block "extra-js" %}
<script>
    $(function() {
        // Autocomplete
        $('#autocomplete, [data-provide="typeahead"]').typeahead({
            name: 'team',
            local: ['Alexandre', 'Angelo', 'Axel', 'Emmanuel', 'Henri', 'Laure', 'Pierre', 'Romain', 'Suzanne']
        }).each(function() {
            if ($(this).hasClass('input-lg')) {
                $(this).prev('.tt-hint').addClass('hint-lg');
            }

            if ($(this).hasClass('input-sm')) {
                $(this).prev('.tt-hint').addClass('hint-sm');
            }
        });
    });
</script>
{% endblock %}
