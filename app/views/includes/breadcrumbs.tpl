<div id="breadcrumbs-pages" class="breadcrumb-block container-box">
    <ul class="breadcrumb">
        {% for crumb in breadcrumbs %}
        {% if crumb.active == 'active'%}
            <li class="breadcrumb_item {{crumb.active}}">&nbsp;&nbsp;{{crumb.link_name}}</li>
        {% elseif crumb.active == 'passive'%}
            <li class="breadcrumb_item {{crumb.active}}"><a href="{{crumb.link}}">&nbsp;&nbsp;{{crumb.link_name}}&nbsp;
                    &nbsp;</a></li>
        {% else %}
            <li class="breadcrumb_item {{crumb.active}}"><a href="{{crumb.link}}">&nbsp;&nbsp;{{crumb.link_name}}&nbsp;
                &nbsp;</a></li>
        {% endif %}
        {% endfor %}
    </ul>
</div>