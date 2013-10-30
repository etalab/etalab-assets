
<div class="container">
<nav class="navbar navbar-default navbar-static-top" role="navigation">

    <header class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse, .subnav-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="/">Data.gouv.fr</a>
        <p class="navbar-text pull-right">La plateforme ouverte des données publiques françaises.</p>
    </header>

    <ul class="nav navbar-nav links">
      <li><a href="/">Home</a></li>
      <li><a href="/search.html">Search</a></li>
      <li><a href="/dataset.html">Dataset</a></li>
      <li><a href="/widgets.html">Widgets</a></li>
    </ul>

      <div class="collapse navbar-collapse">
        <ul class="nav navbar-nav navbar-right">
            {% if user %}
            <li class="dropdown  user">
                <button class="dropdown-toggle btn-link" data-toggle="dropdown">
                    <span class="glyphicon glyphicon-user"></span>
                    {{ user }}
                    <b class="caret"></b>
                </button>
                <ul class="dropdown-menu">
                    <li>
                        <a href="" title="Profil">
                            <span class="glyphicon glyphicon-wrench"></span>
                            Profil
                        </a>
                    </li>
                    <li>
                        <a href="{{basename}}.html" title="Logout">
                            <span class="glyphicon glyphicon-log-out"></span>
                            Log out
                        </a>
                    </li>
                </ul>
            </li>
            {% else %}
            <li>
                <a href="{{basename}}-logged.html">
                    Sign In / Register
                </a>
            </li>
            {% endif %}
            {% if user %}
            <li>
                <a class="btn btn-link" title="Advanced mode"
                    href="">
                    <span class="icon icon-factory"></span>
                </a>
            </li>
            {% endif %}
            <li class="dropdown language">
                <button class="dropdown-toggle btn btn-link" data-toggle="dropdown">
                    <img src="img/flags/fr.png" />
                </button>
                <ul class="dropdown-menu">
                    <li>
                        <a href="">
                            <img src="img/flags/fr.png" />
                            Français
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <img src="img/flags/en.png" />
                            English
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <img src="img/flags/de.png" />
                            Deutsch
                        </a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>





</nav>
</div>


