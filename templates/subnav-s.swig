<nav class="navbar navbar-static-top navbar-subnav">

    <div class="container">
        <div class="cover-marianne"></div>


        <div class="search_bar">


            <form class="navbar-form">
                <div class="form-group col-sm-4 col-md-4 col-lg-3 col-xs-12">
                    <div class="input-group">
                        <div class="input-group-btn">
                            <button class="btn" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                        </div>
                        <input id="search-input" name="q" type="search" class="form-control"
                        autocomplete="off" placeholder="Search">
                    </div>
                </div>

                <div class="form-group col-sm-3 col-md-2 col-lg-3 col-xs-12 collapse subnav-collapse">
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


            <div class="form-group col-sm-3 col-md-2 col-lg-3 col-xs-12 ">
                <button class="dropdown-toggle btn-block btn-light" data-toggle="dropdown">
                    Thematiques
                    <span class="glyphicon glyphicon-chevron-down pull-right hidden-sm"></span>
                </button>
                <ul class="dropdown-menu" role="menu" aria-labelledby="topics">
                    {% for topic in main_topics %}
                    <li role="presentation">
                        <a role="menuitem" tabindex="-1" href="topic.html">
                        {{ topic.title }}
                        </a>
                    </li>
                    {% endfor %}
                </ul>
            </div>

            <div class="col-sm-2 col-md-4 col-lg-3 col-xs-12 collapse subnav-collapse">
                <a class="btn btn-primary btn-dark btn-block btn-md hidden-sm icon-left"
                    title="Publish a dataset !"
                    href>
                    <span class="glyphicon glyphicon-plus"></span>
                    Publiez une serie de données !
                </a>
                <a class="btn btn-primary btn-dark btn-block hidden-xs hidden-md hidden-lg"
                    title="Publish a dataset !"
                    href>
                    <span class="glyphicon glyphicon-plus"></span>
                    Publiez !
                </a>
            </div>
        </div>

    </div>

</nav>

