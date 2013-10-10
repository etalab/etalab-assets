<nav id="sidebar" class="panel">

    <! -- Public data presentation -->
    <div class="panel-heading">
        <a href data-toggle="collapse" data-target="#navigation-panel">Données publiques</a>
    </div>
    <div id="navigation-panel" class="panel-body collapse in">
        <ul class="list-unstyled">
            <li><a href="#">Definition</a></li>
            <li><a href="#">Publishers</a></li>
            <li>
                <a href="http://www.etalab.gouv.fr/pages/licence-ouverte-open-licence-5899923.html">
                    License ouverte
                </a>
            </li>
            <li><a href="#">Quelles données ?</a></li>
            <li><a href="http://www.etalab.gouv.fr/">ETALAB</a></li>
        </ul>
    </div>

    <!-- Groups -->
    <div class="list-group">
        {% for group in groups %}
        <a class="list-group-item" href="{{ group.url }}">
            <span class="icon icon-{{ group.icon }}"></span>
            {{ group.title }}
        </a>
        {% endfor %}
    </div>

</nav>
