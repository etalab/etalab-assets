<nav class="navbar navbar-static-top navbar-subnav state">

    <div class="container">


<div class="sidebackground1"></div>
<div class="sidebackground2"></div>
<div class="sidebackground3"></div>
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


    <nav  class="sidebar panel">


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



    <nav class="sidebar panel">
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





<div class="topic-excerpt col-sm-8 col-md-8 col-xs-10">
    <h3>Territoire</h3>
    Etiam porta sem malesuada magna mollis euismod. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ullamcorper nulla non metus auctor fringilla. Donec sed odio dui.

Aenean lacinia bibendum nulla sed consectetur. Cras mattis consectetur purus sit amet fermentum. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Nullam id dolor id nibh ultricies vehicula ut id elit. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.
Etiam porta sem malesuada magna mollis euismod. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Lorem ipsum dolor sit amet, consectetur adipiscing elit...
</div>
<a class="btn btn-default btn-sm pull-right"
                title="Lire plus"
                href>Lire plus
        </a>




</nav>

