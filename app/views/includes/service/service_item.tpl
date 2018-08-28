<div class="service-choose container-box">
    {% for item in serviceList %}
    <div class="item">
        <a href="{{URLROOT}}/service/product/{{item.id}}">
            <img src="{{URLROOT}}/img/{{item.file}}" alt="{{item.file}}"></a>
        <h3>{{item.name}}</h3>
        <p>{{item.preview}}</p>
        <a href="{{URLROOT}}/service/product/{{item.id}}">read more</a>
    </div>
    {% endfor %}
</div>


