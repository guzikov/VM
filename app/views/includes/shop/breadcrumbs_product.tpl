<div id="category-crumbs" class="breadcrumb-block container-box">
    <ul class="goodsList">
        {% for item in Categories %}
        <li class="">
             <button name="selectCatBtn" id="{{item.id_category}}" class="selectGroup {{item.active}}"
                      href="{{URLROOT}}/shop/catalog/{{item
            .id_category}}">{{item
                .category_name}}</button>
        </li>
        {% endfor %}
    </ul>
</div>