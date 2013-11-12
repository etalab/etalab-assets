{% extends "templates/base.swig" %}
{% set basename = 'topic' %}
{% set style = 'etalab-topic' %}

{% block "title" %}Home{% endblock %}

{% block "content" %}

{% include 'templates/subnav-topic.swig' %}

<section class="default">

    <div class="container">


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

                <ul class="card-list">
                {% for dataset in datasets %}
                {# {% include "widgets/dataset-search-result.html" %} #}
                <div class="col-md-4 col-sm-8">
                <li class="card dataset-result">
                    {% if dataset.organization %}
                    <a class="card-logo" href="/dataset.html">
                        <img alt="{{ dataset.organization.title }}"
                            src="{{ dataset.organization.image_url }}">
                    </a>
                    {% endif %}
                    <div class="card-body">
                        <h4>
                            <a href="/dataset.html" title="{{dataset.title}}">
                            {{ dataset.title }}
                            </a>
                        </h4>
                        {{dataset.notes}}

                        <ul class="card-footer">

                            {# Temporal coverage #}
                            {% if dataset.temporal_coverage.from and dataset.temporal_coverage.to %}
                            <li>
                                <a href class="btn btn-xs btn-default"
                                    rel="tooltip" data-placement="top" data-container="body"
                                    title="Temporal coverage">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </a>
                                {{ dataset.temporal_coverage.from }} to {{ dataset.temporal_coverage.to }}
                            </li>
                            {% endif %}

                            {# Periodicity #}
                            {% if dataset.periodicity %}
                            <li>
                                <a href class="btn btn-xs"
                                    rel="tooltip" data-placement="top" data-container="body"
                                    title="Periodicity">
                                    <span class="glyphicon glyphicon-time"></span>
                                </a>
                                {{ dataset.periodicity }}
                            </li>
                            {% endif %}

                            {# Territorial coverage #}
                            {% if dataset.territorial_coverage.name %}
                            <li>
                                <a href class="btn btn-xs btn-default"
                                    rel="tooltip" data-placement="top" data-container="body"
                                    title="Territorial coverage">
                                    <span class="glyphicon glyphicon-globe"></span>
                                </a>
                                {{ dataset.territorial_coverage.name }}
                            </li>
                            {% endif %}

                            {% if dataset.territorial_coverage.granularity %}
                            <li>
                                <a href class="btn btn-xs btn-default"
                                    rel="tooltip" data-placement="top" data-container="body"
                                    title="Territorial coverage granularity">
                                    <span class="glyphicon glyphicon-screenshot"></span>
                                </a>
                                {{ dataset.territorial_coverage.granularity }}
                            </li>
                            {% endif %}

                        </ul>
                        <div class="card-text-mask"></div>
                    </div>
                </li>
                </div>
                {% endfor %}
                </ul>
            </div>
            <div class="tab-pane" id="popular">

                <ul class="card-list">
                {% for dataset in datasets|reverse %}
                {# {% include "widgets/dataset-search-result.html" %} #}
                <div class="col-md-4 col-sm-8">
                <li class="card dataset-result">
                    {% if dataset.organization %}
                    <a class="card-logo" href="/dataset.html">
                        <img alt="{{ dataset.organization.title }}"
                            src="{{ dataset.organization.image_url }}">
                    </a>
                    {% endif %}
                    <div class="card-body">
                        <h4>
                            <a href="/dataset.html" title="{{dataset.title}}">
                            {{ dataset.title }}
                            </a>
                        </h4>
                        {{dataset.notes}}

                        <ul class="card-footer">

                            {# Temporal coverage #}
                            {% if dataset.temporal_coverage.from and dataset.temporal_coverage.to %}
                            <li>
                                <a href class="btn btn-xs btn-default"
                                    rel="tooltip" data-placement="top" data-container="body"
                                    title="Temporal coverage">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </a>
                                {{ dataset.temporal_coverage.from }} to {{ dataset.temporal_coverage.to }}
                            </li>
                            {% endif %}

                            {# Periodicity #}
                            {% if dataset.periodicity %}
                            <li>
                                <a href class="btn btn-xs"
                                    rel="tooltip" data-placement="top" data-container="body"
                                    title="Periodicity">
                                    <span class="glyphicon glyphicon-time"></span>
                                </a>
                                {{ dataset.periodicity }}
                            </li>
                            {% endif %}

                            {# Territorial coverage #}
                            {% if dataset.territorial_coverage.name %}
                            <li>
                                <a href class="btn btn-xs btn-default"
                                    rel="tooltip" data-placement="top" data-container="body"
                                    title="Territorial coverage">
                                    <span class="glyphicon glyphicon-globe"></span>
                                </a>
                                {{ dataset.territorial_coverage.name }}
                            </li>
                            {% endif %}

                            {% if dataset.territorial_coverage.granularity %}
                            <li>
                                <a href class="btn btn-xs btn-default"
                                    rel="tooltip" data-placement="top" data-container="body"
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
</section>
{% endblock %}
