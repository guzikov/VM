<header class="page-header">
    <div class="page-top-bar">
        <div class="container-box">
            {% include 'includes/login_line.tpl' %}
        </div>
    </div>
    <div class="page-navigation">
        <nav class="navigation container-box">
            <div class="navigation__logo" >
                <a href="{{URLROOT}}" name="top">
                    <img src="{{URLROOT}}/img/logoblack.png" alt="Логотип">
                </a>
                <a href="{{URLROOT}}">Vertex Medical</a>
            </div>
            <ul class="navigation__menu">
                {% for item in menu %}
                {% include 'includes/navigation_menu.tpl' %}
                {% endfor %}
            </ul>
        </nav>
    </div>
</header>