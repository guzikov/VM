<div class="container-box content-block">
    <div class="news-block" id="news-block">
        <div class="post">
            <img class="product-img" src="{{URLROOT}}/img/news/{{article.picture}}" alt="{{article.picture}}">
            <h1>{{article.title}} </h1>
            <p class="post-info"><span class="ti-calendar"></span> {{article.date}}
                <span class="ti-id-badge"></span> Публикация от {{article.name}}</p>
            <p class="post-text">{{article.text}} </p>

        </div>
    </div>

    {% include 'includes/news/side_bar.tpl' %}

</div>