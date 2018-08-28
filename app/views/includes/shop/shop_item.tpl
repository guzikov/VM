<div id="shop-block" class="shop container-box">
{% for item in itemList %}
<div class="shop-item">
    <a href="{{URLROOT}}/shop/product/{{item.id_equipment}}">
        <img src="{{URLROOT}}/img/{{item.file}}" alt="Запчасть"></a>
    <a href="{{URLROOT}}/shop/product/{{item.id_equipment}}">{{item.name}}</a>
    <p class="item-price"><span class="item-price">{{item.price}}</span> &#8381;</p>
    <!-- <form action = "{{URLROOT}}/shop/addToBasket" method="POST"> -->
        <button class="orderBtn" id="{{item.id_equipment}}"> <span class="ti-package"> Заказать</span></button>  <!-- name="addToBasketBtn" value = "{{item
        .id_equipment}}"
            <span class="ti-package"> Заказать</span>
       </button>
    <!-- </form> -->
</div>
{% endfor %}
</div>