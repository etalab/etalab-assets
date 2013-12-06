{% extends "templates/base.swig" %}
{% set basename = 'index' %}
{% set style = 'etalab-home' %}

{% block "title" %}Home{% endblock %}

{% block "content" %}

{% include 'templates/subnav.swig' %}

<section class="default">

    <div class="container">


    <div class="row first-row">
        <div class="col-md-4">

            {# News highlight #}
        <h3>Actualités</h3>
                 <div id="news-carousel" class="carousel slide">

                      <!-- Wrapper for slides -->
                      <div class="carousel-inner">
                        <div class="item active">
                          <img class="slide" src="images/news.jpg" alt="...">
                          <div class="carousel-caption">

                            <label>Thématique de discussion</label>
                            <h4 class="title">
                            <a href="" title="{{dataset.title}}">
                            {{ dataset.title }}
                            </a>
                            </h4>
                          </div>
                        </div>

                      </div>

                    </div>


        </div>
        <div class="col-md-8">

            {# Carousel #}
            <h3>Les meilleures réutilisations</h3>
            <div id="home-carousel" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <!-- <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                </ol> -->

                <!-- Wrapper for slides -->
                <div class="carousel-inner">
                    {% for reuse in best_reuses %}
                    <div class="item {% if loop.first %}active{% endif %}">
                        <img src="{{ reuse.image_url }}" alt="{{ reuse.title }}">
                        <div class="carousel-caption">
                            <div class="slide-logo pull-left publisher-avatar-80">
                                <div class="frame">
                                    {% if not reuse.organization %}
                                    <a href="" title="{{ reuse.owner.name }}">
                                        <img alt="{{ reuse.owner.name }}" src="{{ reuse.owner.avatar }}">
                                    </a>
                                    {% else %}
                                    <a class="organization" href="" title="{{ reuse.organization.title }}">
                                        <img alt="{{ reuse.organization.title }}" src="{{ reuse.organization.image_url }}">
                                    </a>
                                    <a class="user" href="" title="{{ reuse.owner.name }}">
                                        <img alt="{{ reuse.owner.name }}" src="{{ reuse.owner.avatar }}">
                                    </a>
                                    {% endif %}
                                </div>
                            </div>
                            <h4 class="title ellipsis-dot">
                                <a href="" title="{{reuse.title}}">
                                    {{ reuse.title }}
                                </a>
                                <label>{{ reuse.description }}</label>
                            </h4>
                            {% if user and is_admin %}
                            <a class="btn btn-xs btn-warning unfeature" rel="tooltip"
                                href=""
                                title="Ne plus mettre en avant">
                                <span class="glyphicon glyphicon-trash"></span>
                            </a>
                            {% endif %}
                        </div>
                    </div>
                    {% endfor %}
                </div>

                <!-- Controls -->
                <!-- <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                    <span class="icon-prev"></span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                    <span class="icon-next"></span>
                </a> -->
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

                <ul class="card-list">
                    {% for dataset in datasets %}
                    {# {% include "widgets/dataset-search-result.html" %} #}
                    <li class="col-md-4 col-sm-6">
                        <div class="card dataset-result">
                            {% if dataset.organization %}
                                <a class="card-logo" href="/dataset.html">
                                    <img alt="{{ dataset.organization.title }}"
                                        src="{{ dataset.organization.image_url }}">
                                </a>
                                {% if dataset.organization.certified_public_service %}
                                <img src="img/certified-stamp.png" alt="certified"
                                    class="certified" rel="popover"
                                    data-title="Certified public service"
                                    data-content="This organization and its datasets are certified by data.gouv.fr"
                                    data-container="body" data-placement="left" data-trigger="hover"/>
                                {% endif %}
                            {% endif %}
                            <div class="card-body ellipsis-dot">
                                <h4>
                                    <a href="/dataset.html" title="{{dataset.title}}">
                                    {{ dataset.title }}
                                    </a>
                                </h4>
                                <div class="card-description">{{dataset.notes}}</div>
                            </div>
                            <footer>
                                <ul class="col-xs-9 col-sm-10">

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
                                <ul class="col-xs-3 col-sm-2 corner">
                                    <li>
                                        <a href class="btn btn-xs btn-default" rel="tooltip"
                                            data-placement="top" data-container="body"
                                            title="Reuse number">
                                            <span class="glyphicon glyphicon-random"></span>
                                        </a>
                                        {{ loop.index0 }}
                                    </li>
                                </ul>
                            </footer>
                        </div>
                    </li>
                    {% endfor %}
                </ul>
            </div>
            <div class="tab-pane" id="popular">

                <ul class="card-list">
                    {% for dataset in datasets|reverse %}
                    {# {% include "widgets/dataset-search-result.html" %} #}
                    <li class="col-md-4 col-sm-8">
                        <div class="card dataset-result">
                            {% if dataset.organization %}
                                <a class="card-logo" href="/dataset.html">
                                    <img alt="{{ dataset.organization.title }}"
                                        src="{{ dataset.organization.image_url }}">
                                </a>
                                {% if dataset.organization.certified_public_service %}
                                <img src="img/certified-stamp.png" alt="certified"
                                    class="certified" rel="popover"
                                    data-title="Certified public service"
                                    data-content="This organization and its datasets are certified by data.gouv.fr"
                                    data-container="body" data-placement="left" data-trigger="hover"/>
                                {% endif %}
                            {% endif %}
                            <div class="card-body ellipsis-dot">
                                <h4>
                                    <a href="/dataset.html" title="{{dataset.title}}">
                                    {{ dataset.title }}
                                    </a>
                                </h4>
                                <div class="card-description">{{dataset.notes}}</div>
                            </div>
                            <footer>
                                <ul class="col-xs-9 col-sm-10">

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
                                <ul class="col-xs-3 col-sm-2 corner">
                                    <li>
                                        <a href class="btn btn-xs btn-default" rel="tooltip"
                                            data-placement="top" data-container="body"
                                            title="Reuse number">
                                            <span class="glyphicon glyphicon-random"></span>
                                        </a>
                                        {{ loop.index0 }}
                                    </li>
                                </ul>
                            </footer>
                        </div>
                    </li>
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

{% block "extra-js" %}
<script type="text/javascript">
    $('#home-carousel .title').on('slide.bs.carousel', function() {
        $(this).trigger('update');
    });
</script>
{% endblock %}
