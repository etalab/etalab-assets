<nav class="navbar navbar-static-top navbar-subnav cover">
    
    <div class="container">

    
<div class="sidebackground1"></div>
<div class="sidebackground2"></div>
<div class="sidebackground3"></div>
<div class="search_sidebar col-sm-4 col-md-4 col-xs-12">
    

    <nav id="sidebar" class="panel">
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


    <nav id="sidebar" class="panel">

    
        <form class="navbar-form form-inline" role="search">
            
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
        </form>

    </nav>



    <nav id="sidebar" class="panel">
    <!-- Groups -->
    <div class="list-group">
        {% for group in groups %}
        <a class="list-group-item" href="{{ group.url }}">
            {{ group.title }}
        </a>
        {% endfor %}
    </div>

</nav>

</div>

    



<div class="call-to-action">
    <h2>“Partager, améliorer et valoriser </br> l'information publique”</h2>
    <div class="navbar-left col-sm-4 col-md-3 col-xs-12 collapse subnav-collapse">
        <a class="btn btn-big navbar-btn btn-block"
                title="Publish a dataset !"
                href>
            <span class="glyphicon glyphicon-plus-sign"></span>
            Publier une serie de Données
        </a>
    </div>


</div>




</nav>

