{% extends "templates/base.swig" %}
{% set basename = 'index' %}

{% block "title" %}Home{% endblock %}

{% block "content" %}

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
                        {% for dataset in datasets.last %}
                        <tr>
                            <td class="ellipsis">
                                <a href="" title="{{ dataset }}">
                                    {{ dataset }}
                                </a>
                            </td>
                        </tr>
                        {% endfor %}
                    </table>
                </div>

                {# Popular datasets #}
                <div class="tab-pane" id="popular-datasets">
                    <table class="table table-striped table-hover">
                        {% for dataset in datasets.popular %}
                        <tr>
                            <td class="ellipsis">
                                <a href="" title="{{ dataset }}">
                                    {{ dataset }}
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

{# Featured projects #}
<div class="container marketing">
    <div id="featured" class="row featured">
        <div class="col-md-4 col-lg-4 col-sm-6">
            <a href="http://www.lemonde.fr/politique/visuel/2013/07/17/l-impossible-simplification-des-aides-aux-entreprises_3448359_823448.html" class="no-decoration">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Citizens</h3>
                    </div>
                    <div class="panel-body">
                        <img src="images/dataviz-le-monde.png" class="img-responsive"
                            alt="Les aides aux entreprises">
                            <h3>Les aides aux entreprises</h3>
                            <p>
                            Infographie par Le Monde à partir des données brutes ayant fondées le rapport Queyranne-Desmaël-Jürgensen.
                            </p>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-md-4 col-lg-4 col-sm-6">
            <a href="" class="no-decoration">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Public services</h3>
                    </div>
                    <div class="panel-body">
                        <img src="images/logo_lacub.jpg"
                            alt="Communauté Urbaine de Bordeaux" class="img-responsive">
                            <h3>Communauté Urbaine de Bordeaux</h3>
                            <p>
                            Découvrez les 17 nouveaux jeux de données en provenance de la CUB. Orientés mobilité, ils expliquent par exemple l'évolution du trafic routier.
                            </p>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-md-4 col-lg-4 col-sm-6">
            <a href="http://handistrict.com/" target="_blank" class="no-decoration">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Businesses</h3>
                    </div>
                    <div class="panel-body">
                        <img src="images/handistrict.png"
                            alt="Handistrict, la cartographie de l'accessibilité en France" class="img-responsive">
                            <h3>Handistrict, la cartographie de l'accessibilité en France</h3>
                            <p>
                            Hôtels, restaurants, musées, établissements publics, salles de spectacles, ...tous les établissements recevant du public sont représentés sur cette plateforme. L'accessibilité est renseignée pour toutes les formes de handicap : moteur, auditif, visuel et mental.
                            </p>
                    </div>
                </div>
            </a>
        </div>
    </div>
</div>
{% endblock %}
</div>
