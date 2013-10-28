{% extends "templates/base.swig" %}
{% set basename = 'index' %}
{% set style = 'etalab-home' %}

{% block "title" %}Home{% endblock %}

{% block "content" %}

{% include 'templates/subnav.swig' %}

<div class="container">


<div class="row first-row">
    <div class="col-md-4">

        {# News highlight #}

            <div id="news">



                <div class="carousel-inner">

                    <div class="item active">
                        <img src="images/news.jpg" alt="First slide">
                        <div class="container">
                            <a class="carousel-caption no-decoration" href="">
                            Projet de loi pour l’égalité entre les femmes et les hommes
                            </a>
                        </div>
                    </div>
                </div>


            </div>


    </div>
    <div class="col-md-8">

        {# Feeds tabs #}
        <div class="feeds panel panel-default">
            <ul class="nav nav-tabs nav-justified">
                <li class="active">
                    <a href="#last-datasets" data-toggle="tab">
                        <span class="glyphicon glyphicon-time"></span>
                        Last
                    </a>
                </li>
                <li>
                    <a href="#popular-datasets" data-toggle="tab">
                        <span class="glyphicon glyphicon-fire"></span>
                        Popular
                    </a>
                </li>
            </ul>
            <div class="tab-content tab-datasets">

                {# Last datasets #}
                <div class="tab-pane active" id="last-datasets">
                    <table class="table table-striped table-hover">
                        {% for dataset in datasets %}
                        <tr>
                            <td class="ellipsis">
                                <a href="" title="{{ dataset.title }}">
                                    {{ dataset.title }}
                                </a>
                            </td>
                        </tr>
                        {% endfor %}
                    </table>
                </div>

                {# Popular datasets #}
                <div class="tab-pane" id="popular-datasets">
                    <table class="table table-striped table-hover">
                        {% for dataset in datasets %}
                        <tr>
                            <td class="ellipsis">
                                <a href="" title="{{ dataset.title }}">
                                    {{ dataset.title }}
                                </a>
                            </td>
                        </tr>
                        {% endfor %}
                    </table>
                </div>

            </div>
        </div>

    </div>
</div>

<div class="row">
    <div class="col-xs-12">
        <ul id="tabs" class="nav nav-pills" data-tabs="tabs">
                <li class="active"><a href="#recent" data-toggle="tab">Les plus récentes</a></li>
                <li><a href="#popular" data-toggle="tab">Les plus populaires</a></li>
        </ul>
    </div>
</div>

<div class="row">
    
    <div id="my-tab-content" class="tab-content">
        <div class="tab-pane  active" id="recent">

            <ul class="search-results">
            {% for dataset in datasets %}
            {# {% include "widgets/dataset-search-result.html" %} #}
            <div class="col-md-4 col-sm-8">
            <li class="search-result dataset-result">
                {% if dataset.organization %}
                <a class="result-logo pull-left" href="">
                    <img alt="{{ dataset.organization.title }}"
                        src="{{ dataset.organization.image_url }}">
                </a>
                {% endif %}
                <div class="result-body">
                    <h4>
                        <a href="" title="{{dataset.title}}">
                        {{ dataset.title }}
                        </a>
                    </h4>
                    {{dataset.notes}}

                    <ul class="list-inline result-infos">

                        {# Temporal coverage #}
                        {% if dataset.temporal_coverage.from and dataset.temporal_coverage.to %}
                        <li>
                            <a href class="btn btn-xs btn-default" rel="tooltip" data-placement="left"
                                title="Temporal coverage">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </a>
                            {{ dataset.temporal_coverage.from }} to {{ dataset.temporal_coverage.to }}
                        </li>
                        {% endif %}

                        {# Periodicity #}
                        {% if dataset.periodicity %}
                        <li>
                            <a href class="btn btn-xs" rel="tooltip" data-placement="left"
                                title="Periodicity">
                                <span class="glyphicon glyphicon-time"></span>
                            </a>
                            {{ dataset.periodicity }}
                        </li>
                        {% endif %}

                        {# Territorial coverage #}
                        {% if dataset.territorial_coverage.name %}
                        <li>
                            <a href class="btn btn-xs btn-default" rel="tooltip" data-placement="left"
                                title="Territorial coverage">
                                <span class="glyphicon glyphicon-globe"></span>
                            </a>
                            {{ dataset.territorial_coverage.name }}
                        </li>
                        {% endif %}

                        {% if dataset.territorial_coverage.granularity %}
                        <li>
                            <a href class="btn btn-xs btn-default" rel="tooltip" data-placement="left"
                                title="Territorial coverage granularity">
                                <span class="glyphicon glyphicon-screenshot"></span>
                            </a>
                            {{ dataset.territorial_coverage.granularity }}
                        </li>
                        {% endif %}

                    </ul>
                    <div class="result-text-mask"></div>
                </div>
            </li>
            </div>
            {% endfor %}
            </ul>
        </div>
        <div class="tab-pane" id="popular">

            <ul class="search-results">
            {% for dataset in datasets|reverse %}
            {# {% include "widgets/dataset-search-result.html" %} #}
            <div class="col-md-4 col-sm-8">
            <li class="search-result dataset-result">
                {% if dataset.organization %}
                <a class="result-logo pull-left" href="">
                    <img alt="{{ dataset.organization.title }}"
                        src="{{ dataset.organization.image_url }}">
                </a>
                {% endif %}
                <div class="result-body">
                    <h4>
                        <a href="" title="{{dataset.title}}">
                        {{ dataset.title }}
                        </a>
                    </h4>
                    {{dataset.notes}}

                    <ul class="list-inline result-infos">

                        {# Temporal coverage #}
                        {% if dataset.temporal_coverage.from and dataset.temporal_coverage.to %}
                        <li>
                            <a href class="btn btn-xs btn-default" rel="tooltip" data-placement="left"
                                title="Temporal coverage">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </a>
                            {{ dataset.temporal_coverage.from }} to {{ dataset.temporal_coverage.to }}
                        </li>
                        {% endif %}

                        {# Periodicity #}
                        {% if dataset.periodicity %}
                        <li>
                            <a href class="btn btn-xs" rel="tooltip" data-placement="left"
                                title="Periodicity">
                                <span class="glyphicon glyphicon-time"></span>
                            </a>
                            {{ dataset.periodicity }}
                        </li>
                        {% endif %}

                        {# Territorial coverage #}
                        {% if dataset.territorial_coverage.name %}
                        <li>
                            <a href class="btn btn-xs btn-default" rel="tooltip" data-placement="left"
                                title="Territorial coverage">
                                <span class="glyphicon glyphicon-globe"></span>
                            </a>
                            {{ dataset.territorial_coverage.name }}
                        </li>
                        {% endif %}

                        {% if dataset.territorial_coverage.granularity %}
                        <li>
                            <a href class="btn btn-xs btn-default" rel="tooltip" data-placement="left"
                                title="Territorial coverage granularity">
                                <span class="glyphicon glyphicon-screenshot"></span>
                            </a>
                            {{ dataset.territorial_coverage.granularity }}
                        </li>
                        {% endif %}

                    </ul>
                    <div class="result-text-mask"></div>
                </div>
            </li>
            </div>
            {% endfor %}
            </ul>
        </div>
        
    </div>
</div>

</div>

</div>
</div>
{% endblock %}
</div>
