<nav class="navbar navbar-static-top navbar-subnav">

    <div class="container">
        <div class="cover-marianne"></div>


        <div class="search_bar">


            <form class="navbar-form form">
                <div class="input-group col-sm-3 col-md-3 col-xs-12">
                    <div class="input-group-btn">
                        <button class="btn" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                    </div>
                    <input id="search-input" name="q" type="search" class="form-control"
                    autocomplete="off" placeholder="Search">
                </div>

                <div class="input-group col-sm-3 col-md-3 col-xs-12">
                    <div class="collapse subnav-collapse">
                        <div id="where-group" class="input-group">
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-globe"></span>
                            </span>
                            <input id="where-input" type="search" class="form-control"
                            autocomplete="off" placeholder="Where">
                            <input id="ext_territory" name="ext_territory" type="hidden" />
                        </div>
                    </div>
                </div>

            </form>


            <div class="input-group col-sm-3 col-md-3 col-xs-12">
                <button class="dropdown-toggle btn-block btn-light" data-toggle="dropdown">
                    Thematiques
                    <span class="glyphicon glyphicon-chevron-down pull-right"></span>
                </button>
                <ul class="dropdown-menu" role="menu" aria-labelledby="topics">
                    {% for group in groups %}
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="{{ group.url }}">
                        {{ group.title }}
                    </a></li>
                    {% endfor %}
                </ul>
            </div>
        </div>


        <div class=" pull-right">
            <a class="btn btn-primary btn-dark"
                title="Publish a dataset !"
                href>
                <span class="glyphicon glyphicon-plus"></span>
                Publier une serie de Données
            </a>
        </div>

    </div>

</nav>

