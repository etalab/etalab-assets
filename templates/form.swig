{% extends "templates/base.swig" %}

{% block "extra-head" %}
<link rel="stylesheet" media="screen" href="bower/bootstrap-select/bootstrap-select.css">
<link rel="stylesheet" media="screen" href="bower/bootstrap-markdown/css/bootstrap-markdown.min.css">
<link rel="stylesheet" media="screen" href="bower/tagmanager/tagmanager.css">
{% endblock %}

{% block "content" %}

{% include 'templates/subnav-s.swig' %}
<section class="form">
    <div class="animation"></div>
    <div class="container">
        <div class="row">
            <div class="animover col-xs-12 col-lg-offset-1 col-lg-10">

                {# <ul class="nav nav-pills">
                    <li class="active"><a href>First tab</a></li>
                    <li><a href>Second tab</a></li>
                </ul> #}

                <div class="page-header">
                    <a href><h1>Un formulaire <small>demo</small></h1></a>
                </div>

                <form id="demo-form" role="form" class="form-horizontal" novalidate>
                    <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">Email address</label>
                        <div class="col-sm-10">
                            <input id="email" type="email" class="form-control" placeholder="Enter email" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="password" class="col-sm-2 control-label">Password</label>
                        <div class="col-sm-10">
                            <input id="password" type="password" class="form-control" placeholder="Password" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="select" class="col-sm-2 control-label">Select</label>
                        <div class="col-sm-10">
                            <select id="select" class="selectpicker form-control">
                                <option>Mustard</option>
                                <option>Ketchup</option>
                                <option>Barbecue</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="autocomplete" class="col-sm-2 control-label">Autocomplete</label>
                        <div class="col-sm-10">
                            <input id="autocomplete" type="search" class="form-control"
                                autocomplete="off" placeholder="Autocomplete">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="tags" class="col-sm-2 control-label">Tags</label>
                        <div class="col-sm-10">
                            <input id="tags" class="form-control tm-input"
                                autocomplete="off" placeholder="Tags">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="markdown-editor"  class="col-sm-2 control-label">Markdown</label>
                        <div class="col-sm-10">
                            <textarea id="markdown-editor" class="form-control"
                                data-provide="markdown" rows="8"></textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">Extras</label>
                        <div class="col-sm-5">
                            <div class="input-group">
                                <span class="input-group-addon">Key</span>
                                <input type="text" class="form-control" autocomplete="off" autofocus />
                            </div>
                        </div>
                        <div class="col-sm-5">
                            <div class="input-group">
                                <span class="input-group-addon">Value</span>
                                <input type="text" class="form-control" autocomplete="off" autofocus />
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10 text-center">
                            <button type="submit" class="btn btn-primary" title="Save">
                                Save
                            </button>
                            <a href class="btn btn-warning" title="Cancel">
                                Cancel
                            </a>
                        </div>
                    </div>
                </form>
            </div>

        </div>
    </div>
</section>
{% endblock %}

{% block "extra-js" %}
<script src="bower/jquery.easing/js/jquery.easing.js"></script>
<script src="js/animation/edge.1.0.0.min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/animation/animation.preload.js"></script>

<script src="bower/bootstrap-select/bootstrap-select.js"></script>
<script src="bower/markdown/lib/markdown.js"></script>
<script src="bower/bootstrap-markdown/js/bootstrap-markdown.js"></script>
<script src="bower/tagmanager/tagmanager.js"></script>
<script>
    $(function() {
        // Test form validation
        $('#demo-form').validate(ETALAB_VALIDATION_RULES);

        // Bootstrap select
        $('#select').selectpicker();

        // Autocomplete
        $('#autocomplete, [data-provide="typeahead"]').typeahead({
            name: 'team',
            local: ['Alexandre', 'Angelo', 'Axel', 'Emmanuel', 'Henri', 'Laure', 'Pierre', 'Romain', 'Suzanne']
        });

        // Tags
        $('#tags').tagsManager();

        // Markdown editor
        $("#markdown-editor").markdown({
            autofocus: false,
            savable: false
        });
    });
</script>
{% endblock %}
