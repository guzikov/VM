<div class="container-box">
    <div class="service-single">
            <div class="service-product">
                <img class="product-img" src="{{URLROOT}}/img/{{service.file}}" alt="{{service.file}}">
                <p>{{service.description}} </p>
            </div>


        <div class="right-nav-menu">
            <ul>
                {% for item in serviceList %}
                {% include 'includes/service/service_side_bar.tpl' %}
                {% endfor %}
            </ul>
        </div>
            
        </div>
</div>