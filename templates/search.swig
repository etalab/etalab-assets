{% extends "templates/base.swig" %}
{% set basename = 'search' %}
{% block "title" %}Search{% endblock %}


{% block "content" %}
<div class="container">

    <h2>
        Organizations
        <small>
            37 results
        </small>
    </h2>
    <ul class="search-results">
        {% for organization in organizations %}
        {# {% include "widgets/organization-search-result.html" %} #}
        {% endfor %}
    </ul>

        <p class="text-center">
            <a class="btn btn-default" href="">
                <span class="glyphicon glyphicon-list"></span>
                See the 37 results
            </a>
        </p>

    <h2>
        Datasets
        <small>
            214 results
        </small>
    </h2>
    <ul class="search-results">
        {% for dataset in datasets %}
        {# {% include "widgets/dataset-search-result.html" %} #}
        {% endfor %}
    </ul>

        <p class="text-center">
            <a class="btn btn-default"  href="{{ url(lang, 'dataset') }}?{{ query_string }}&page=2">
            <span class="glyphicon glyphicon-list"></span>
            See the 214 results
            </a>
        </p>

    <h2>Topics</h2>
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
            <a class="btn btn-default" href="">
            <span class="glyphicon glyphicon-list"></span>
            See all the results
            </a>
        </p>

    <h2>Questions</h2>
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
            <a class="btn btn-default" href="">
            <span class="glyphicon glyphicon-list"></span>
            See the 12 results
            </a>
        </p>

</div>
{% endblock %}
