{% extends "templates/base.swig" %}
{% set basename = 'dataset' %}
{% set style = 'etalab-dataset' %}

{% block "title" %}{{ dataset.title }}{% endblock %}

{% block "content" %}

{% include 'templates/subnav-s.swig' %}


<section class="content {% if not dataset.organization.certified_public_service %}noncertified{% endif %}">
    <div class="container dataset-container">
        <div class="row">

            <div class="col-md-9 col-sm-9 smaller">
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

                    {% if dataset.author %}
                        <small>
                            Ce jeu de données a été publié le 25 octobre 2013 à l'initiative et sous la responsabilité de
                            {% if dataset.author_email %}
                            <a href="mailto:{{ dataset.author_email }}" title="{{ dataset.author }}">{{ dataset.author }}</a>
                            {% else %}
                            {{ dataset.author}}
                            {% endif %}
                        </small>
                    {% endif %}

                    {% if dataset.private %}
                    <small class="private">Privé</small>
                    {% endif %}
                    {% if dataset.is_fork %}
                    <small class="fork" rel="popover"
                        data-title="Fork" data-trigger="hover" data-placement="top"
                        data-content="This dataset is a fork of another existing dataset">Fork</small>
                    {% endif %}
                    {% if not dataset.organization.certified_public_service %}
                    <small class="not-certified" rel="popover"
                        data-title="Non certifié" data-trigger="hover" data-placement="top"
                        data-content="Cette série ne provient pas d'un service public certifié">Non certifié</small>
                    {% endif %}

                </div>



                <div class="row provider">
                    {% if dataset.supplier %}
                    <h3>Fourni par</h3>
                    <p>
                        <small>

                            <a href="" title="{{ dataset.supplier.display_name }}">
                                {% if dataset.supplier.image_url %}
                                <img src="{{ dataset.supplier.image_url }}" alt="{{ dataset.supplier.name }}" height="16px"/>
                                {% endif %}

                                <span class="name">
                                {{ dataset.supplier.display_name }}
                                </span>

                            </a>
                            <a href="" class="btn btn-grey btn-primary btn-sm pull-right">
                                Voir sur le site original
                            </a>
                        </small>
                    </p>
                    {% endif %}
                </div>

                <p>{{ dataset.notes }}</p>


                <div class="list-group resources-list">
                    <h3>Ressources</h3>
                    {% for resource in dataset.resources %}
                    <div class="list-group-item"
                        data-url="{{ resource.url }}" data.format="{{ resource.format }}"
                        rel="popover" data-trigger="hover" data-placement="top"
                        title="{{ resource.name }} [{{ resource.format }}]"
                        data-content="{{ resource.description }}"
                        >
                        <div class="format-label pull-left ellipsis-dot">
                            <span property="dc:format"
                                data-format="{{ resource.format }}">{{ resource.format }}</span>

                        </div>
                        <h4 class="list-group-item-heading ellipsis {% if not resource.description %}dual{% endif %}">
                            {{ resource.name }}
                        </h4>
                        {% if resource.description %}
                        <p class="list-group-item-text ellipsis">
                            {{ resource.description }}
                        </p>
                        {% endif %}
                        {% if resource.editable %}
                        <div class="btn-group btn-group-xs tools">
                            <a class="btn btn-default" rel="tooltip" title="Edit">
                                <span class="glyphicon glyphicon-edit"></span>
                            </a>
                        </div>
                        {% endif %}
                    </div>
                    {% endfor %}
                    <a class="list-group-item add" href>
                        <div class="format-label pull-left">+</div>
                        <h4 class="list-group-item-heading">
                            Ajouter une ressource
                        </h4>
                    </a>
                </div>

                <div class="row opinion">
                    <div class="btn-toolbar">
                        <div class="btn-group">
                            <a title="Utile" class="btn btn-success btn-punch btn-block icon-left"
                                data-toggle="modal" href="#fork-modal"
                                rel="tooltip" data-placement="top" data-trigger="hover" data-container="body"
                                data-content="Useful" >
                                <span class="glyphicon glyphicon-star-empty"></span>
                                Utile
                                <span class="counter">(98)</span>
                            </a>
                        </div>
                        <div class="btn-group">
                            <a title="Signaler" class="btn btn-danger btn-report btn-punch "
                                data-toggle="modal" href="#fork-modal"
                                rel="tooltip" data-placement="top" data-trigger="hover" data-container="body"
                                data-content="Duplicate this dataset and improve it !" >
                                <span class="glyphicon glyphicon-warning-sign"></span>
                            </a>
                        </div>
                    </div>
                </div>

            </div>

            {# Right sidebar #}
            <aside class="col-md-3 col-sm-3">

                {# Optionnal organization panel #}
                {% if dataset.organization %}
                {% set organization = dataset.organization %}
                <div class="card text-center">
                     <h3>Producteur</h3>
                    {% if organization.certified_public_service %}
                    <img src="img/certified-stamp.png" alt="certified"
                        class="certified" rel="popover"
                        data-title="Certified public service"
                        data-content="This organization and its datasets are certified by data.gouv.fr"
                        data-container="body" data-placement="left" data-trigger="hover"/>
                    {% endif %}
                    <img class="producer" src="{{ organization.image_url }}"
                        alt="{{ organization.name }}" class="organization-logo" />
                    <div class="caption text-left">
                        {% if organization.description %}
                        <p>
                            {{ organization.description }}
                            <a href="" class="btn btn-grey btn-primary btn-mini">
                            +
                            </a>
                        </p>

                        <a href="{{ dataset.quality.url }}" title="Improve quality" class="btn btn-primary btn-block btn-sm icon-left">
                            <span class="glyphicon glyphicon-eye-open"></span>
                            S'abonner
                        </a>
                        {% endif %}
                    </div>
                </div>
                {% endif %}

                {# Information panel #}
                <div class="card">
                        <h3>Informations</h3>
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



                        </ul>


                        <div class="tags">
                            {% for tag in dataset.tags %}
                            <a href="" class="btn btn-grey btn-primary btn-xs"
                                title="{{ tag }}">
                                {{ tag }}
                            </a>
                            {% endfor %}
                        </div>

                </div>


                {# Quality panel #}
                <div class="card">
                    <h3>Qualité des données</h3>
                    <div class="stats">
                        <div class="row">

                            {% if dataset.quality %}
                            <a href="{{ dataset.quality.url }}" title="Go to the report page">
                                <div class="col-xs-5 col-sm-12 col-md-6 col-lg-6">
                                    <span class="big_number">{{ dataset.quality.weight }}</span>
                                    Performance
                                </div>
                                <div class="col-xs-7 col-sm-12 col-md-6 col-lg-6">
                                    <div class="progress">
                                        {% if dataset.quality.warning %}
                                        <div class="progress-bar progress-bar-warning" role="progressbar"
                                            aria-valuenow="{{ dataset.quality.warning }}" aria-valuemin="0"
                                            style="width: {{ dataset.quality.warning }}0%">
                                        </div>
                                        <span>{{ dataset.quality.warning }} avertissements</span>
                                        {% else %}
                                        <div class="progress-bar progress-bar-success" role="progressbar"
                                            aria-valuenow="0" aria-valuemin="0" style="width: 100%">
                                        </div>
                                        <span>Aucun avertissement</span>
                                        {% endif %}
                                    </div>
                                    <div class="progress">
                                        {% if dataset.quality.error %}
                                        <div class="progress-bar progress-bar-danger" role="progressbar"
                                            aria-valuenow="{{ dataset.quality.error }}" aria-valuemin="0"
                                            style="width: {{ dataset.quality.error }}0%">
                                        </div>
                                        <span>{{ dataset.quality.error }} erreurs</span>
                                        {% else %}
                                        <div class="progress-bar progress-bar-success" role="progressbar"
                                            aria-valuenow="0" aria-valuemin="0" style="width: 100%">
                                        </div>
                                        <span>Aucune erreur</span>
                                        {% endif %}
                                    </div>
                                    <div class="progress">
                                        {% if dataset.quality.criticals %}
                                        <div class="progress-bar progress-bar-info" role="progressbar"
                                            aria-valuenow="{{ dataset.quality.criticals }}" aria-valuemin="0"
                                            style="width: {{ dataset.quality.criticals }}0%">
                                        </div>
                                        <span>{{ dataset.quality.criticals }} critiques</span>
                                        {% else %}
                                        <div class="progress-bar progress-bar-success" role="progressbar"
                                            aria-valuenow="0" aria-valuemin="0" style="width: 100%">
                                        </div>
                                        <span>Aucun critique</span>
                                        {% endif %}
                                    </div>
                                </div>
                            </a>
                            {% else %}
                            No report available
                            {% endif %}

                        </div>
                    </div>

                    <a title="Fork" class="btn btn-primary btn-block btn-sm icon-left"
                        data-toggle="modal" href="#fork-modal"
                        rel="popover" data-placement="left" data-trigger="hover" data-container="body"
                        data-content="Duplicate this dataset and improve it !" >
                        <span class="glyphicon glyphicon-random"></span>
                        Cloner et ameliorer
                    </a>
                </div>


            </aside>
        </div>
    </div>
</section>

<section class="community_container">
    <header>
        <div class="container">
            {# <div class="page-header"> #}
                <div class="cover-communaute"></div>
                <div class="page-header">
                    <h2>Contributions de la communauté</h2>
                    <small>Explorer avec Datagouv</small>
                </div>
            {# </div> #}
        </div>
    </header>


    <div class="container">

        <h3>Ressources</h3>
        <div class="row">
            <div class="col-sm-9 list-group resources-list smaller">
                {% for resource in dataset.community_resources %}
                    <div class="list-group-item" href="{{ resource.url }}"
                        data-url="http://fake" data-format="{{ resource.format }}"
                        rel="popover" data-trigger="hover" data-placement="top"
                        title="{{ resource.name }} [{{ resource.format }}]"
                        data-content="{{ resource.description }}"
                        >
                        <div class="format-label pull-left ellipsis-dot">
                            <span property="dc:format"
                                data-format="{{ resource.format }}">{{ resource.format }}</span>

                        </div>
                        <h4 class="list-group-item-heading ellipsis {% if not resource.description %}dual{% endif %}">
                            {{ resource.name }}
                        </h4>
                        {% if resource.description %}
                        <p class="list-group-item-text ellipsis">
                            {{ resource.description }}
                        </p>
                        {% endif %}
                        <div class="resource-owner">
                            <div class="frame">
                                {% if not resource.publish_as %}
                                <a href="" title="{{ resource.owner.name }}">
                                    <img alt="{{ resource.owner.name }}" src="{{ resource.owner.avatar }}">
                                </a>
                                {% else %}
                                <a class="organization" href="" title="{{ resource.publish_as.title }}">
                                    <img alt="{{ resource.publish_as.title }}" src="{{ resource.publish_as.image_url }}">
                                </a>
                                <a class="user" href="" title="{{ resource.owner.name }}">
                                    <img alt="{{ resource.owner.name }}" src="{{ resource.owner.avatar }}">
                                </a>
                                {% endif %}
                            </div>
                        </div>
                        {% if resource.editable %}
                        <div class="btn-group btn-group-xs tools">
                            <a class="btn btn-default" rel="tooltip" title="Edit">
                                <span class="glyphicon glyphicon-edit"></span>
                            </a>
                        </div>
                        {% endif %}
                    </div>
                {% endfor %}
                    <a class="list-group-item add" href>
                        <div class="format-label pull-left">+</div>
                        <h4 class="list-group-item-heading">
                            Ajouter une ressource
                        </h4>
                    </a>
                </div>

                <div class="col-md-3 col-sm-3 note">
                    <p>Vous avez construit une base de données plus complète que celles présentées ici ? C'est le moment de la partager !</p>
                </div>
            </div>

            <h3>Réutilisations</h3>
            <div class="row">
                <div class="col-sm-9 reuses-list smaller">
                    <div class="row">
                        {% for related in dataset.related %}
                        <div class="col-sm-6 col-lg-4">
                            <div class="thumbnail reuse">
                                <a class="preview" href="{{ related.url }}" target="_blank">
                                    <img class="media-object img-responsive" alt="{{ related.title }}"
                                        src="{{ related.image_url }}">
                                </a>
                                <div class="caption">
                                    <h4 class="ellipsis-dot">
                                        <a href="{{ related.url }}" target="_blank" title="{{ related.title }}">
                                        {{ related.title }}
                                        </a>
                                    </h4>
                                    <div class="author">
                                        {% if related.organization %}
                                        <a class="avatar" href title="{{related.organization.display_name}}">
                                            <img src="{{related.organization.image_url}}"
                                                alt="{{related.organization.display_name}} logo">
                                        </a>
                                        <a class="user" href title="{{related.organization.display_name}}">
                                            {{related.organization.display_name}}
                                        </a>
                                        {% else %}
                                        <a class="avatar" href title="{{related.user}}">
                                            <img src="{{related.avatar}}" alt="{{related.user}} avatar">
                                        </a>
                                        <a class="user" href title="{{related.user}}">{{related.user}}</a>
                                        {% endif %}
                                        <span class="date">{{related.date}}</span>
                                    </div>
                                </div>
                                <a class="rollover fade in" href="{{related.url}}" target="_blank">
                                    {{ related.description }}
                                </a>
                                <div class="btn-group btn-group-xs">
                                    <a class="btn btn-default" rel="tooltip" title="Edit">
                                        <span class="glyphicon glyphicon-edit"></span>
                                    </a>
                                    {% if related.featured_button %}
                                    <a class="btn btn-default featured" rel="tooltip" title="Mark as featured">
                                        <span class="glyphicon glyphicon-pushpin"></span>
                                    </a>
                                    {% endif %}
                                    </div>
                                </div>
                        </div>
                        {% endfor %}
                        <div class="col-sm-6 col-md-4">
                            <a class="thumbnail reuse add" href>
                                <div class="preview">+</div>
                                <div class="caption">
                                    <h4>Ajouter une reutilisation</h4>
                                </div>
                            </a>
                        </div>

                    </div>
                </div>
                <div class="col-sm-3 note">
                    <p>Vous avez réutilisé ces données et publié un article, une infographie, ou une application ? C'est le moment de vous faire connaître ! Référencez votre travail en quelques clics et augmentez votre visibilité.</p>
                </div>
            </div>

        </div>

    </div>

        {# <div class="comments">
            <h3>Commentaires</h3>
            {% for comment in dataset.comments %}
            <div class="user-comment">
                <img src="{{comment.avatar}}" alt="{{comment.user}} avatar">
                <span class="user">{{comment.user}}</span>
                <span class="date">{{comment.date}}</span>
                <p>{{comment.content}}</p>
            </div>
            {% endfor %}
        </div> #}



        </div>
    </div>
</section>


{% endblock %}

{% block "extra-js" %}
<script type="text/javascript">
    $(function() {
        $('.resources-list div.list-group-item').click(function(e) {
            if (!$(e.target).parents('.tools, .resource-owner').length) {
                if ($(this).data('format') == 'html') {
                    window.open($(this).data('url'));
                } else {
                    window.location = $(this).data('url');
                }
            }
        });
    });
</script>
{% endblock %}
