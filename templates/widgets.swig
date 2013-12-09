{% extends "templates/base.swig" %}

{% block "extra-head" %}
<link rel="stylesheet" media="screen" href="bower/bootstrap-select/bootstrap-select.css">
<link rel="stylesheet" media="screen" href="bower/bootstrap-markdown/css/bootstrap-markdown.min.css">
{% endblock %}

{% block "content" %}

{% include 'templates/subnav-s.swig' %}

<div class="container">
    <div class="page-header">
        <h1>Etalab Assets <small>demo</small></h1>
    </div>

    <div class="jumbotron">
        <div class="container">
            <h1>Hello, world!</h1>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Enim, numquam, magnam, voluptates, molestiae ducimus facilis alias adipisci ab dolores natus dolorem velit blanditiis incidunt necessitatibus voluptatum id quos fugiat aliquid.</p>
            <p><a class="btn btn-primary btn-lg">Learn more</a></p>
        </div>
    </div>

    <div class="row card">
        <h2>Test form</h2>
        <form id="demo-form" role="form" novalidate>
            <div class="form-group">
                <label for="email" class="control-label">Email address</label>
                <input id="email" type="email" class="form-control" placeholder="Enter email" required>
            </div>
            <div class="form-group">
                <label for="password" class="control-label">Password</label>
                <input id="password" type="password" class="form-control" placeholder="Password" required>
            </div>
            <div class="form-group">
                <label for="select" class="control-label">Select</label>
                <select id="select" class="selectpicker form-control">
                    <option>Mustard</option>
                    <option>Ketchup</option>
                    <option>Barbecue</option>
                </select>
            </div>
            <div class="form-group">
                <label for="markdown-editor">Markdown</label>
                <textarea id="markdown-editor" class="form-control" data-provide="markdown" rows="8"></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>

    <div class="row">
        <div class="col-md-2">
            <div class="publisher-avatar-150">
                <div class="frame">
                    <a href="" title="As user">
                        <img alt="As user" src="images/avatar-axel.jpg" class="centered">
                    </a>
                </div>
            </div>
        </div>
        <div class="col-md-2">
            <div class="publisher-avatar-150">
                <div class="frame">
                    <a class="organization" href="" title="Organization">
                        <img alt="WWF" src="images/wwf.jpg">
                    </a>
                    <a class="user" href="" title="User">
                        <img alt="As user" src="images/avatar-axel.jpg">
                    </a>
                </div>
            </div>
        </div>
        <div class="col-md-2">
            <div class="publisher-avatar-150">
                <div class="frame">
                    <a class="organization" href="" title="Organization">
                        <img alt="WWF" src="images/Ministere-de-l-Ecologie-du-Developpement-Durable-et-de-l-Energie_resultat.png">
                    </a>
                    <a class="user" href="" title="User">
                        <img alt="As user" src="images/avatar-angelo.jpg">
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-2">
            <div class="publisher-avatar-100">
                <div class="frame">
                    <a href="" title="As user">
                        <img alt="As user" src="images/avatar-axel.jpg"  class="centered">
                    </a>
                </div>
            </div>
        </div>
        <div class="col-md-2">
            <div class="publisher-avatar-100">
                <div class="frame">
                    <a class="organization" href="" title="Organization">
                        <img alt="WWF" src="images/wwf.jpg">
                    </a>
                    <a class="user" href="" title="User">
                        <img alt="As user" src="images/avatar-axel.jpg">
                    </a>
                </div>
            </div>
        </div>
        <div class="col-md-2">
            <div class="publisher-avatar-100">
                <div class="frame">
                    <a class="organization" href="" title="Organization">
                        <img alt="WWF" src="images/Ministere-de-l-Ecologie-du-Developpement-Durable-et-de-l-Energie_resultat.png">
                    </a>
                    <a class="user" href="" title="User">
                        <img alt="As user" src="images/avatar-angelo.jpg">
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-2">
            <div class="publisher-avatar-80">
                <div class="frame">
                    <a href="" title="As user">
                        <img alt="As user" src="images/avatar-axel.jpg"  class="centered">
                    </a>
                </div>
            </div>
        </div>
        <div class="col-md-2">
            <div class="publisher-avatar-80">
                <div class="frame">
                    <a class="organization" href="" title="Organization">
                        <img alt="WWF" src="images/wwf.jpg">
                    </a>
                    <a class="user" href="" title="User">
                        <img alt="As user" src="images/avatar-axel.jpg">
                    </a>
                </div>
            </div>
        </div>
        <div class="col-md-2">
            <div class="publisher-avatar-80">
                <div class="frame">
                    <a class="organization" href="" title="Organization">
                        <img alt="WWF" src="images/Ministere-de-l-Ecologie-du-Developpement-Durable-et-de-l-Energie_resultat.png">
                    </a>
                    <a class="user" href="" title="User">
                        <img alt="As user" src="images/avatar-angelo.jpg">
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-2">
            <div class="publisher-avatar-50">
                <div class="frame">
                    <a href="" title="As user">
                        <img alt="As user" src="images/avatar-axel.jpg"  class="centered">
                    </a>
                </div>
            </div>
        </div>
        <div class="col-md-2">
            <div class="publisher-avatar-50">
                <div class="frame">
                    <a class="organization" href="" title="Organization">
                        <img alt="WWF" src="images/wwf.jpg">
                    </a>
                    <a class="user" href="" title="User">
                        <img alt="As user" src="images/avatar-axel.jpg">
                    </a>
                </div>
            </div>
        </div>
        <div class="col-md-2">
            <div class="publisher-avatar-50">
                <div class="frame">
                    <a class="organization" href="" title="Organization">
                        <img alt="WWF" src="images/Ministere-de-l-Ecologie-du-Developpement-Durable-et-de-l-Energie_resultat.png">
                    </a>
                    <a class="user" href="" title="User">
                        <img alt="As user" src="images/avatar-angelo.jpg">
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

{% endblock %}

{% block "extra-js" %}
<script src="bower/bootstrap-select/bootstrap-select.js"></script>
<script src="bower/markdown/lib/markdown.js"></script>
<script src="bower/bootstrap-markdown/js/bootstrap-markdown.js"></script>
<script>
    $(function() {
        // Test form validation
        $('#demo-form').validate(ETALAB_VALIDATION_RULES);

        // Bootstrap select
        $('#select').selectpicker();

        // Markdown editor
        $("#markdown-editor").markdown({
            autofocus: false,
            savable: false
        });
    });
</script>
{% endblock %}
