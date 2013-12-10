<nav class="navbar navbar-static-top navbar-subnav cover">

    <div class="container">


<div class="side-bgs">
    <div class="bg"></div>
    <div class="bg collapse sidebg-collapse"></div>
    <div class="bg"></div>
</div>

<div class="search_sidebar col-sm-5 col-md-4 col-xs-12">


    <nav class="sidebar panel">
        <form class="navbar-form form-inline" role="search">
            <div class="input-group">
                <div class="input-group-btn">
                    <button class="btn" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                </div>
                <input id="search-input" name="q" type="search" class="form-control"
                            autocomplete="off" placeholder="Search">
            </div>

        </form>

    </nav>

    <nav class="sidebar panel collapse subnav-collapse">


        <form class="navbar-form form-inline" role="search">
            <div id="where-group" class="input-group">
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-globe"></span>
                </span>
                <input id="where-input" type="search" class="form-control"
                        autocomplete="off" placeholder="Where">
                <input id="ext_territory" name="ext_territory" type="hidden" />
            </div>
        </form>

    </nav>



    <nav class="sidebar panel">
    <!-- Groups -->
    <div class="list-group">
        {% for topic in main_topics %}
        <a class="list-group-item" href="topic.html">
            {{ topic.title }}
        </a>
        {% endfor %}
    </div>

</nav>

</div>


<div class="call-to-action col-sm-7 col-md-8 col-lg-7 col-xs-12">
    <h2>Partagez, améliorez et réutilisez la donnée publique</h2>
    <div class="collapse subnav-collapse">
        <a class="btn btn-primary btn-big btn-dark"
                title="Publish a dataset !"
                href>
            <span class="glyphicon glyphicon-plus"></span>
            Publiez une serie de Données
        </a>
    </div>
</div>



</nav>

