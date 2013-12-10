<nav class="navbar navbar-static-top navbar-subnav topic-9 cover">

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


    <nav  class="sidebar panel  collapse subnav-collapse">


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


<div class="topic-excerpt col-sm-7 col-md-8 col-xs-12">
    <h3>Territoire</h3>
    <p>Cursus sem, laoreet voluptas, perferendis maecenas, maxime odit fuga tempora felis! Adipiscing. Veritatis condimentum. Phasellus etiam at cum, aliquet temporibus, venenatis morbi vero. Facilisis leo? Explicabo morbi nostrum illum. Nobis ex quod nullam, potenti? Blandit, class? Officia netus elit doloribus, atque, vulputate! Proin adipiscing optio, dictum cursus, quibusdam! Voluptatum eros vulputate condimentum occaecati convallis itaque. Libero lectus! Commodo pharetra nesciunt, sagittis asperiores, elit, natus fugiat! Excepturi corrupti voluptatum praesent nemo pellentesque per aspernatur quaerat fusce culpa ullam, torquent ducimus voluptatibus? Magnis exercitation, pariatur facilis, pulvinar nonummy magna dolorem molestias mattis. Fringilla vivamus deserunt fuga, rutrum molestias, similique urna egestas. Harum.</p>

<p>Totam gravida vivamus ut sint odio magna nisl augue. Inceptos eaque phasellus, incididunt pulvinar numquam! Cum beatae esse? Cumque taciti unde sapien illo metus, eiusmod tempus. Rutrum fuga! Litora per id consequatur ipsa eaque proident eget tellus dictumst integer cillum auctor! Pulvinar, lacinia laboris et viverra unde voluptatum, quae dictum tortor, ultrices suspendisse viverra inceptos minim eiusmod aliquam modi mollit, distinctio rhoncus ante laborum vestibulum, neque irure inventore? Id felis duis tempus. Rerum tristique! Proin inventore mi minim tortor soluta maiores cursus phasellus vivamus, lectus donec fuga. Deleniti! Porro laudantium, viverra sociis dolores optio pharetra! Fermentum phasellus viverra. Neque ut.</p>

<p>Convallis tellus aperiam ullam amet condimentum reiciendis doloribus! Nesciunt nostrum? Incididunt eiusmod proident tellus nihil orci incididunt quam ab autem quo, dignissim velit massa fuga lobortis tempor, at pharetra distinctio minus varius! Architecto, hic! Torquent! Facilisis nihil eaque, dis ligula, wisi magna quos minus facilisis mollit inventore quae dapibus venenatis hendrerit praesentium nisl, egestas? Accumsan necessitatibus, commodi repellat voluptate necessitatibus? Quae mollit ultrices deleniti, fugiat, volutpat. Laboriosam fames fringilla doloremque. Blandit, ullamco molestie sollicitudin est fames eros mollit accusantium! Perspiciatis! Risus laborum sollicitudin placeat aut voluptatum ullamcorper aliqua. Do id, purus, eligendi. Suspendisse iure, sed, faucibus, consectetur habitant eveniet quia.</p>

<p>Sunt commodo mollitia consequat adipiscing maiores. Aute! Quas iure non condimentum dis quisque sint? Numquam aenean, nostrum sem, ac hic tempore quis, leo proident numquam consectetuer tempora donec itaque accusantium, officiis nemo vivamus dolor sagittis gravida, donec. Magni sociis, rutrum? Amet, officiis! Recusandae turpis placeat tempora sapiente quo, rem turpis, quas? Dis harum dignissim possimus, commodi euismod ipsa cupiditate officia? Nunc mollitia tortor veniam inventore eros cum culpa, nam ridiculus corrupti praesentium aliqua habitasse fames rerum tortor porta varius quaerat aliquid. Nemo eligendi numquam ac soluta maecenas autem, pede fames, ipsam numquam cupidatat, necessitatibus aut quam, duis mus sapiente nascetur.</p>
</div>
<a href class="more btn btn-default btn-sm pull-right" data-toggle="modal" data-target="#topic-modal">
  Lire plus
</a>


</nav>

