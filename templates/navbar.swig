<section class="header">
<div class="container">
<nav class="navbar navbar-default navbar-static-top" role="navigation">

    <header class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse"
            data-target=".navbar-collapse, .subnav-collapse, .sidebg-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="/">Data.gouv.fr</a>
        <p class="navbar-text pull-right">La plateforme ouverte des données publiques françaises.</p>
    </header>
</nav>
</div>
</section>

<section class="topmenu collapse navbar-collapse">
<div class="container">
    <nav class="navbar navbar-default navbar-static-top" role="navigation">

        <ul class="nav navbar-nav links">
            <li><a href="/" title="Accueil"><span class="glyphicon glyphicon-home"></span></a></li>
            <li><a href="/search.html">Search</a></li>
            <li><a href="/topic.html">Topic</a></li>
            <li><a href="/dataset.html">Dataset</a></li>
            <li><a href="/message.html">Message</a></li>
            <li><a href="/error.html">Error</a></li>
            <li><a href="/form.html">Form</a></li>
            <li><a href="/widgets.html">Widgets</a></li>
        </ul>

        <ul class="nav navbar-nav navbar-right">
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
            {% if user %}
            <li class="dropdown  user login">
                <button class="dropdown-toggle btn-link" data-toggle="dropdown">
                    <span class="username">{{ user }}</span>
                    <img src="images/avatar-angelo.jpg" class="gravatar" width="30" height="30">

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
            <li class="login">
                <a href="{{basename}}-logged.html">
                    Sign In / Register
                </a>
            </li>
            {% endif %}
        </ul>
    {# </div> #}





</nav>
</div>
</section>


