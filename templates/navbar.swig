<nav class="navbar navbar-default navbar-static-top" role="navigation">
    <header class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse, .subnav-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="">Data.Gouv.fr</a>
    </header>

    <div class="collapse navbar-collapse">
        <p class="navbar-text">The open platform for french public data</p>
        <ul class="nav navbar-nav navbar-right">
            {% if user %}
            <li class="dropdown">
                <button class="btn btn-dark navbar-btn dropdown-toggle" data-toggle="dropdown">
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
                        <a href="/" title="Logout">
                            <span class="glyphicon glyphicon-log-out"></span>
                            Log out
                        </a>
                    </li>
                </ul>
            </li>
            {% else %}
            <li>
                <a href="logged.html" class="btn btn-dark navbar-btn">
                    <span class="glyphicon glyphicon-log-in"></span>
                    Sign In / Register
                </a>
            </li>
            {% endif %}
            <li class="dropdown">
                <button class="btn btn-dark navbar-btn dropdown-toggle" data-toggle="dropdown">
                    <img src="bower/flags/flags/flags-iso/shiny/16/FR.png" />
                </button>
                <ul class="dropdown-menu">
                    <li>
                        <a href="">
                            <img src="bower/flags/flags/flags-iso/shiny/16/FR.png" />
                            Français
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <img src="bower/flags/flags/flags-iso/shiny/16/US.png" />
                            English
                        </a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</nav>

<nav class="navbar navbar-static-top navbar-subnav">
    <div class="navbar-left col-sm-4 col-md-3 col-xs-12 collapse subnav-collapse">
        <a class="btn btn-primary navbar-btn btn-block"
                title="Publish a dataset !"
                href>
            <span class="glyphicon glyphicon-plus-sign"></span>
            Publish a dataset !
        </a>
    </div>
    <div class="col-sm-8 col-md-9 col-xs-12 navbar-left">
        <form class="navbar-form form-inline" role="search">
            <div class="input-group col-sm-8 col-xs-12">
                <div class="input-group-btn">
                    <button class="btn" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                </div>
                <input id="search-input" name="q" type="search" class="form-control"
                            autocomplete="off" placeholder="Search">
            </div>
            <div class="collapse subnav-collapse col-sm-4 col-xs-12">
                <div id="where-group" class="input-group">
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-globe"></span>
                    </span>
                    <input id="where-input" type="search" class="form-control"
                            autocomplete="off" placeholder="Where">
                    <input id="ext_territory" name="ext_territory" type="hidden" />
                </div>
            </div>
        </form>
    </div>
</nav>
