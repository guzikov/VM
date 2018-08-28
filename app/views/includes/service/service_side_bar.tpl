<li class ='{{item.active}}'>
    {% if item.active == 'active' %}
    <span>{{item.name}}</span>
    {% else %}
    <a href="{{item.href}}">{{item.name}}</a>
    {% endif %}
</li>
