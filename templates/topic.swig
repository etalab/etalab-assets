{% extends "templates/base.swig" %}
{% set basename = 'topic' %}
{% set style = 'etalab-topic' %}

{% block "title" %}Topic{% endblock %}

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

{% block "hiddens" %}
<div id="topic-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="topic-modal-title" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 id="topic-modal-title" class="modal-title">Territoire</h4>
      </div>
      <div class="modal-body">
        <p>Cursus sem, laoreet voluptas, perferendis maecenas, maxime odit fuga tempora felis! Adipiscing. Veritatis condimentum. Phasellus etiam at cum, aliquet temporibus, venenatis morbi vero. Facilisis leo? Explicabo morbi nostrum illum. Nobis ex quod nullam, potenti? Blandit, class? Officia netus elit doloribus, atque, vulputate! Proin adipiscing optio, dictum cursus, quibusdam! Voluptatum eros vulputate condimentum occaecati convallis itaque. Libero lectus! Commodo pharetra nesciunt, sagittis asperiores, elit, natus fugiat! Excepturi corrupti voluptatum praesent nemo pellentesque per aspernatur quaerat fusce culpa ullam, torquent ducimus voluptatibus? Magnis exercitation, pariatur facilis, pulvinar nonummy magna dolorem molestias mattis. Fringilla vivamus deserunt fuga, rutrum molestias, similique urna egestas. Harum.</p>

<p>Totam gravida vivamus ut sint odio magna nisl augue. Inceptos eaque phasellus, incididunt pulvinar numquam! Cum beatae esse? Cumque taciti unde sapien illo metus, eiusmod tempus. Rutrum fuga! Litora per id consequatur ipsa eaque proident eget tellus dictumst integer cillum auctor! Pulvinar, lacinia laboris et viverra unde voluptatum, quae dictum tortor, ultrices suspendisse viverra inceptos minim eiusmod aliquam modi mollit, distinctio rhoncus ante laborum vestibulum, neque irure inventore? Id felis duis tempus. Rerum tristique! Proin inventore mi minim tortor soluta maiores cursus phasellus vivamus, lectus donec fuga. Deleniti! Porro laudantium, viverra sociis dolores optio pharetra! Fermentum phasellus viverra. Neque ut.</p>

<p>Convallis tellus aperiam ullam amet condimentum reiciendis doloribus! Nesciunt nostrum? Incididunt eiusmod proident tellus nihil orci incididunt quam ab autem quo, dignissim velit massa fuga lobortis tempor, at pharetra distinctio minus varius! Architecto, hic! Torquent! Facilisis nihil eaque, dis ligula, wisi magna quos minus facilisis mollit inventore quae dapibus venenatis hendrerit praesentium nisl, egestas? Accumsan necessitatibus, commodi repellat voluptate necessitatibus? Quae mollit ultrices deleniti, fugiat, volutpat. Laboriosam fames fringilla doloremque. Blandit, ullamco molestie sollicitudin est fames eros mollit accusantium! Perspiciatis! Risus laborum sollicitudin placeat aut voluptatum ullamcorper aliqua. Do id, purus, eligendi. Suspendisse iure, sed, faucibus, consectetur habitant eveniet quia.</p>

<p>Sunt commodo mollitia consequat adipiscing maiores. Aute! Quas iure non condimentum dis quisque sint? Numquam aenean, nostrum sem, ac hic tempore quis, leo proident numquam consectetuer tempora donec itaque accusantium, officiis nemo vivamus dolor sagittis gravida, donec. Magni sociis, rutrum? Amet, officiis! Recusandae turpis placeat tempora sapiente quo, rem turpis, quas? Dis harum dignissim possimus, commodi euismod ipsa cupiditate officia? Nunc mollitia tortor veniam inventore eros cum culpa, nam ridiculus corrupti praesentium aliqua habitasse fames rerum tortor porta varius quaerat aliquid. Nemo eligendi numquam ac soluta maecenas autem, pede fames, ipsam numquam cupidatat, necessitatibus aut quam, duis mus sapiente nascetur.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
{% endblock %}

{% block "extra-js" %}
<script src="bower/jquery.easing/js/jquery.easing.js"></script>
<script src="js/animation/edge.1.0.0.min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/animation/animation.preload.js"></script>
<script type="text/javascript">
    $(function() {
        $('.topic-excerpt').dotdotdot({
            watch: true,
            after: 'a.btn',
            callback: function( isTruncated, $content ) {
                var $more = $('.more');
                if (isTruncated) {
                    $more.removeClass('hide');
                } else {
                    $more.addClass('hide');
                }
            }
        });
    });
</script>
{% endblock %}
