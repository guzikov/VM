
    <ul class="side-bar" id="side-bar">
        <li>Latest Posts</li>
        {% for post in news|slice(0,3) %}
        <li><a class="side-bar-link" data-id="{{post.id_news}}" href="{{URLROOT}}/news/article/{{post.id_news}}">
                <img src="{{URLROOT}}/img/news/{{post.picture}}" alt="{{post.picture}}">
                {{post.title}}
            </a></li>
        {% endfor %}
    </ul>
