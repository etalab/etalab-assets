{% extends "templates/base.swig" %}
{% set basename = 'dataset' %}

{% block "title" %}{{ dataset.title }}{% endblock %}

{% block "content" %}
<div class="container dataset-container">
    <div class="row">

        <div class="col-md-9 col-sm-9">
            <div class="page-header">
                <h1 data-name="{{ dataset.name }}">
                    {{ dataset.title }}
                    {% if user %}
                    <small>
                        <a class="btn btn-xs btn-default"
                            href="">
                            <span class="glyphicon glyphicon-edit" ></span>
                            Edit
                        </a>
                    </small>
                    {% endif %}
                </h1>
            </div>

            <p>{{ dataset.notes }}</p>

            <div class="row">
                <p class="col-md-6 text-muted">
                {% if dataset.author %}
                    <small>
                        Published by
                        {% if dataset.author_email %}
                        <a href="mailto:{{ dataset.author_email }}" title="{{ dataset.author }}">{{ dataset.author }}</a>
                        {% else %}
                        {{ dataset.author}}
                        {% endif %}
                    </small>
                {% endif %}
                </p>
                {% if dataset.supplier %}
                <p class="col-md-6 text-right text-muted">
                    <small>
                        Provided by
                        <a href="" title="{{ dataset.supplier.display_name }}">
                            {{ dataset.supplier.display_name }}
                            {% if dataset.supplier.image_url %}
                            <img src="{{ dataset.supplier.image_url }}" alt="{{ dataset.supplier.name }}" height="16px"/>
                            {% endif %}
                        </a>
                    </small>
                </p>
                {% endif %}
            </div>

            <div class="list-group resources-list">
                {% for resource in dataset.resources %}
                    <a class="list-group-item" href="{{ resource.url }}"
                        {% if resource.format == 'html' %}target="_blank"{% endif %}
                        >
                        <span class="format-label pull-left" property="dc:format" data-format="{{ resource.format }}">{{ resource.format }}</span>
                        <h4 class="list-group-item-heading ellipsis {% if not resource.description %}dual{% endif %}">
                            {{ resource.name }}
                        </h4>
                        <p class="list-group-item-text">
                        {{ resource.description }}
                        </p>
                    </a>
                {% endfor %}
            </div>

            <div class="page-header">
                <h2>Community resources</h2>
            </div>

            <div class="panel panel-default related-panel">
                <div class="panel-heading">
                    <h3 class="panel-title">Reuse</h3>
                </div>
                <div class="panel-body">
                    {% if dataset.related %}
                    <div class="row">
                        {% for related in dataset.related %}
                        <div class="col-sm-6 col-md-4">
                            <div class="thumbnail">
                                <a href="{{ related.url }}" target="_blank">
                                    <img class="media-object img-responsive" alt="{{ related.title }}"
                                        src="{{ related.image_url }}">
                                </a>
                                <div class="caption">
                                    <h4>
                                        <a href="{{ related.url }}" target="_blank">
                                        {{ related.title }}
                                        </a>
                                    </h4>
                                    {% if related.description %}
                                    <div>{{ related.description }}</div>
                                    {% endif %}
                                </div>
                            </div>
                        </div>
                        {% endfor %}
                    </div>
                    <br/>
                    {% endif %}
                    <p class="text-center">
                        <a class="btn btn-success btn-punch" href="">
                            <span class="glyphicon glyphicon-signal"></span>&nbsp;
                            Publish a reuse case !
                        </a>
                    </p>
                </div>
            </div>
        </div>

        {# Right sidebar #}
        <aside class="col-md-3 col-sm-3">

            {# Optionnal organization panel #}
            {% if dataset.organization %}
            {% set organization = dataset.organization %}
            <div class="thumbnail">
                {% if organization.certified_public_service %}
                <img src="img/certified-stamp.png" alt="certified"
                    class="certified" rel="popover"
                    data-title="Certified public service"
                    data-content="This organization and its datasets are certified by data.gouv.fr"
                    data-container="body" data-placement="left" data-trigger="hover"/>
                {% endif %}
                <img src="{{ organization.image_url }}"
                    alt="{{ organization.name }}" class="organization-logo" />
                <div class="caption">
                    <h3>{{ organization.display_name }}</h3>
                    {% if organization.description %}
                    <p>
                        {{ organization.description }}
                    </p>
                    <p class="text-center">
                        <a href="" class="btn btn-default btn-primary btn-sm">
                        more
                        </a>
                    </p>
                    {% endif %}
                </div>
            </div>
            {% endif %}

            {# Information panel #}
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Informations</h3>
                </div>
                <div class="panel-body">
                    <ul id="infos-list" class="list-unstyled">

                        {# License #}
                        {% if dataset.license %}
                        <li>
                            <a href class="btn btn-default btn-xs" rel="tooltip" data-placement="right auto"
                                title="License">
                                <span class="glyphicon glyphicon-copyright-mark"></span>
                            </a>
                            <a href="{{ dataset.license.url }}">{{ dataset.license.title }}</a>
                        </li>
                        {% endif %}

                        {# Temporal coverage #}
                        {% if dataset.temporal_coverage.from and dataset.temporal_coverage.to %}
                        <li>
                            <a href class="btn btn-xs btn-default" rel="tooltip" data-placement="right auto"
                                title="Temporal coverage">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </a>
                            {{ dataset.temporal_coverage.from }} to {{ dataset.temporal_coverage.to }}
                        </li>
                        {% endif %}

                        {# Periodicity #}
                        {% if dataset.periodicity %}
                        <li>
                            <a href class="btn btn-xs" rel="tooltip" data-placement="right auto"
                                title="Periodicity">
                                <span class="glyphicon glyphicon-time"></span>
                            </a>
                            {{ dataset.periodicity }}
                        </li>
                        {% endif %}

                        {# Territorial coverage #}
                        {% if dataset.territorial_coverage.name %}
                        <li>
                            <a href class="btn btn-xs btn-default" rel="tooltip" data-placement="right auto"
                                title="Territorial coverage">
                                <span class="glyphicon glyphicon-globe"></span>
                            </a>
                            {{ dataset.territorial_coverage.name }}
                        </li>
                        {% endif %}

                        {% if dataset.territorial_coverage.granularity %}
                        <li>
                            <a href class="btn btn-xs btn-default" rel="tooltip" data-placement="right auto"
                                title="Territorial coverage granularity">
                                <span class="glyphicon glyphicon-screenshot"></span>
                            </a>
                            {{ dataset.territorial_coverage.granularity }}
                        </li>
                        {% endif %}

                        {% if dataset.quality %}
                        <li class="quality-report">
                            <a href class="btn btn-xs btn-default" rel="tooltip" data-placement="right auto"
                                title="Quality">
                                <span class="glyphicon glyphicon-signal"></span>
                            </a>
                            <a href="{{ dataset.quality.url }}" title="Go to the report page">
                                <span class="label label-default" title="score" rel="tooltip">{{ dataset.quality.weight }}</span>
                                <span class="label label-warning" title="warnings" rel="tooltip">{{ dataset.quality.warnings }}</span>
                                <span class="label label-danger" title="errors" rel="tooltip">{{ dataset.quality.errors }}</span>
                            </a>
                            <a href="{{ dataset.quality.url }}" title="Improve quality" class="btn btn-success btn-block">
                                <span class="glyphicon glyphicon-tasks"></span>
                                Improve
                            </a>
                            <a title="Fork" class="btn btn-success btn-block"
                                data-toggle="modal" href="#fork-modal"
                                rel="popover" data-placement="left" data-trigger="hover" data-container="body"
                                data-content="Duplicate this dataset and improve it !" >
                                <span class="glyphicon glyphicon-random"></span>
                                Fork
                            </a>
                        </li>
                        {% endif %}

                    </ul>


                    <div class="tags">
                        {% for tag in dataset.tags %}
                        <a href="" class="btn btn-primary btn-xs"
                            title="{{ tag }}">
                            {{ tag }}
                        </a>
                        {% endfor %}
                    </div>

                    {% if dataset.groups %}
                    <div class="groups row">
                        {% for group in dataset.groups %}
                        <div class="col-sm-12">
                            <a href="" class="thumbnail">
                                <img src="{{ group.image_url }}"
                                    alt="{{ group.title }}">
                            </a>
                            <div class="caption text-center">
                                <h4>{{ group.title }}</h4>
                            </div>
                        </div>
                        {% endfor %}
                    </div>
                    {% endif %}
                </div>
            </div>
        </aside>
    </div>
</div>


{# Fork confirmation modal #}
<div class="modal fade" id="fork-modal" tabindex="-1" role="dialog" aria-labelledby="fork-modal-title" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 id="fork-modal-title" class="modal-title">Fork</h4>
            </div>
            <div class="modal-body">
                <p>You are about to make a copy of this dataset.
                You'll become the owner and you will have the ability to edit it and improve it.
                The original dataset will keep a reference of your work.</p>
                <p>Continue?</p>
            </div>
            <div class="modal-footer">
                <a class="btn btn-primary" href="">
                    <span class="glyphicon glyphicon-random"></span>
                    Fork
                </a>
                <button type="button" class="btn btn-warning" data-dismiss="modal">
                    <span class="glyphicon glyphicon-remove"></span>
                    Cancel
                </button>
            </div>
        </div>
    </div>
</div>
{% endblock %}

