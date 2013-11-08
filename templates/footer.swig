<section class="footer">
    <div class="container">
        <footer>

        <div class="row">  
        <div class="col-sm-3 col-md-2 col-lg-2">
            <h5>L'Open Data</h5>
            <ul>
                <li><a href="/">Comment ça marche</a></li>
                <li><a href="/search.html">Licence Ouverte</a></li>
                <li><a href="/topic.html">Producteurs</a></li>
                <li><a href="/dataset.html">Etalab</a></li>
                <li><a href="/widgets.html">Demander une serie</a></li>
                <li><a href="/dataset.html">Provacy</a></li>
                <li><a href="/widgets.html">Terms</a></li>
            </ul>
        </div>
        <div class="col-sm-3 col-md-2 col-lg-2">
            <h5>Thematiques</h5>
            <ul>
                {% for topic in main_topics %}
                <li><a href="topic.html">
            {{ topic.title }}
                </a></li>
        {% endfor %}
            </ul>
        </div>
        <div class="col-sm-3 col-md-2 col-lg-2">
            <h5>Réseau</h5>
            <ul>
                <li><a href="/">Gouvernement.fr </a></li>
                <li><a href="/search.html">France.fr</a></li>
                <li><a href="/topic.html">Legifrance.gouv.fr </a></li>
                <li><a href="/dataset.html">Service-public.fr</a></li>
                <li><a href="/widgets.html">Initiatives “Open Data”</a></li>
            </ul>
        </div>
        <div class="col-sm-3 col-md-4 col-lg-4">
            <h5>Réseaux Sociaux</h5>
            <ul>
                <li><a href="/">Twitter</a></li>
                <li><a href="/search.html">Google+</a></li>
                <li><a href="/topic.html">Facebook</a></li>
            </ul>
        </div>

        <div class="col-sm-2 col-md-2 col-lg-2">
            <h5>Contact</h5>
            <a href="/">info@data.gouv.fr</a>

            <img class="logo" src="img/etalab-logo.png"></img>
            <p>&copy; 2013 ETALAB, Inc.</p>
        </div>


            

 <p class="bottom-right"><a href="#">Back to top</a></p>
        </div>   
        </footer>

    </div>
</section>
