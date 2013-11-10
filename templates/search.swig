{% extends "templates/base.swig" %}
{% set basename = 'search' %}
{% set style = 'etalab-search' %}
{% block "title" %}Search{% endblock %}


{% block "content" %}

{% include 'templates/subnav.swig' %}

<div class="container">

    <h2 class="result-type">
        Organizations
        <small>
            37 results
        </small>
    </h2>
    <ul class="search-results">
        {% for organization in organizations %}
        <li class="search-result organization-result">
            <a class="result-logo pull-left" href="{#{ url(lang, 'organization', organization.name) }#}">
                <img alt="{{ organization.display_name }}"
                    src="{{ organization.image_url }}">
            </a>
            <div class="result-body">
                <h4>
                    <a href="{#{ url(lang, 'organization', organization.name) }#}" title="{{organization.display_name}}">
                    {{ organization.display_name }}
                    </a>
                </h4>
                {{ organization.description }}
                <p><strong>{{ organization.nb_datasets }} datasets</strong></p>
            </div>
        </li>
        {% endfor %}
    </ul>

        <p class="text-center">
            <a class="btn btn-grey btn-sm" href="">
                <span class="glyphicon glyphicon-list"></span>
                See the 37 results
            </a>
        </p>

    <h2 class="result-type">
        Datasets
        <small>
            214 results
        </small>
    </h2>
    <ul class="search-results">
        {% for dataset in datasets %}
        {# {% include "widgets/dataset-search-result.html" %} #}
        <li class="search-result dataset-result">
            {% if dataset.organization %}
            <a class="result-logo pull-left" href="/dataset.html">
                <img alt="{{ dataset.organization.title }}"
                    src="{{ dataset.organization.image_url }}">
            </a>
            {% endif %}
            <div class="result-body ellipsis-dot">
                <h4>
                    <a href="/dataset.html" title="{{dataset.title}}">
                    {{ dataset.title }}
                    </a>
                </h4>
                <div class="result-description">{{dataset.notes|safe}}</div>
            </div>

            <ul class="list-inline result-infos">

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
        </li>
        {% endfor %}
    </ul>

        <p class="text-center">
            <a class="btn btn-grey btn-sm"  href="{{ url(lang, 'dataset') }}?{{ query_string }}&page=2">
            <span class="glyphicon glyphicon-list"></span>
            See the 214 results
            </a>
        </p>

    <h2 class="result-type">Topics</h2>
    <ul class="search-results">
        {% for topic in topics %}
        <li class="search-result topic-result">
            <span class="glyphicon glyphicon-info-sign pull-left"></span>
            <h4>
                <a href="" title="{{ topic }}">
                    {{ topic }}
                </a>
            </h4>
        </li>
        {% endfor %}
    </ul>
        <p class="text-center">
            <a class="btn btn-grey btn-sm" href="">
            <span class="glyphicon glyphicon-list"></span>
            See all the results
            </a>
        </p>

    <h2 class="result-type">Questions</h2>
    <ul class="search-results">
        {% for question in questions %}
        <li class="search-result question-result">
            <span class="glyphicon glyphicon-question-sign pull-left"></span>
            <h4>
                <a href="" title="{{question}}">
                    {{ question }}
                </a>
            </h4>
        </li>
        {% endfor %}
    </ul>
        <p class="text-center">
            <a class="btn btn-grey btn-sm" href="">
            <span class="glyphicon glyphicon-list"></span>
            See the 12 results
            </a>
        </p>

</div>
{% endblock %}
