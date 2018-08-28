<div class="container-box content-block">
    <div class="news-block" id="news-block">

        {% for post in news %}
            <div class="post">
                <img class="product-img" src="{{URLROOT}}/img/news/{{post.picture}}" alt="{{post.picture}}">
                <h1>{{post.title}} </h1>
                <p class="post-info"><span class="ti-calendar"></span> {{post.date}}    <span
                            class="ti-id-badge"></span> Публикация от {{post.name}}</p>
                <p class="post-text">{{post.preview}} </p>
                <a href="{{URLROOT}}/news/article/{{post.id_news}}">read more</a>
            </div>
        {% endfor %}

    </div>

    {% include 'includes/news/side_bar.tpl' %}

</div>