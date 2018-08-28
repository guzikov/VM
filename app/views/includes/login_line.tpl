{% if sessionIsOpen.status == false %}
   {% for item in loginMenu %}
        <span><a href="{{item.link}}" class="{{item.link_active}}">
        <span class="{{item.class}}"></span>{{item.link_name}}</a></span>
    {% endfor %}
{% else %}
    <span class="greetings"> Привет, {{loginMenu.userName}}</span>

    {% for item in loginMenu.profileLinks %}
    <span><a class="{{item.link_active}}" href="{{item.link}}"><span class="{{item.class}}"></span>
        {{item.link_name}}</a></span>
    {% endfor %}
    <span><a href="{{loginMenu.logout}}">Выйти</a></span>
{% endif %}

