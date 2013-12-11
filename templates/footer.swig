<section class="footer">
    <div class="container">
        <footer class="row">

            <section class="col-xs-6 col-sm-3 col-md-2 col-lg-2">
                <h5>L'Open Data</h5>
                <ul>
                    <li><a href="/">Comment ça marche</a></li>
                    <li><a href="/search.html">Licence Ouverte</a></li>
                    <li><a href="/topic.html">Producteurs</a></li>
                    <li><a href="/dataset.html">Etalab</a></li>
                    <li><a href="/widgets.html">Crédits</a></li>
                    <li><a href="http://wiki.etalab2.fr/wiki/Conditions_G%C3%A9n%C3%A9rales_d%27Utilisation">Conditions générales d'utilisation</a></li>
                </ul>
            </section>

            <section class="col-xs-6 col-sm-3 col-md-2 col-lg-2">
                <h5>Thematiques</h5>
                <ul>
                    {% for topic in main_topics %}
                    <li>
                        <a href="topic.html">
                        {{ topic.title }}
                        </a>
                    </li>
                    {% endfor %}
                </ul>
            </section>

            <section class="col-xs-6 col-sm-3 col-md-2 col-lg-2">
                <h5>Réseau</h5>
                <ul>
                    <li><a href="http://www.gouvernement.fr/">Gouvernement.fr </a></li>
                    <li><a href="http://www.france.fr/">France.fr</a></li>
                    <li><a href="http://www.legifrance.gouv.fr/">Legifrance.gouv.fr </a></li>
                    <li><a href="http://www.service-public.fr/">Service-public.fr</a></li>
                    <li><a href="http://opendatafrance.net/">Opendata France</a></li>
                </ul>
            </section>

            <section class="col-xs-6 col-sm-3 col-md-4 col-lg-4">
                <h5>Contact</h5>
                <ul>
                    <li><a href="https://twitter.com/Etalab">Twitter</a></li>
                    <li><a href="https://github.com/etalab">GitHub</a></li>
                    <li><a href="mailto:info@data.gouv.fr">info@data.gouv.fr</a></li>
                </ul>
            </section>

            <section class="col-xs-9 col-xs-offset-3 col-sm-offset-0 col-sm-2 col-md-2 col-lg-2">
                <img class="logo" src="img/etalab-logo.png"></img>
                <p>&copy; 2013 ETALAB, Inc.</p>
            </section>

            <p class="bottom-right"><a href="#">Back to top</a></p>

        </footer>
    </div>
</section>
