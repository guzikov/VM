<div class="container container-box product">
    <div class="row">
            <div class="col-sm-4">
                <img class="product-img" src="{{URLROOT}}/img/{{product.file}}" alt="{{product.part_number}}">
            </div>
            <div class="col-sm-3 ">
                <span>{{product.name}}</span>
                <span>{{product.price}} &#8381;</span>
                <form action = "{{URLROOT}}/shop/addToBasket" method="POST">
                    <button type="submit" name="addToBasketBtn" value = "{{product.id_equipment}}">
                        Заказать
                    </button>
                </form>
            </div>
            <div class="col-sm-5 product-description">
                <h6>Описание</h6>
                <p>{{product.description}}</p>
            </div>
        </div>
    <div class="row">
        <div class="col-sm-12">
            <img class="product-img-sm" src="{{URLROOT}}/img/{{product.file}}" alt="{{product.part_number}}">
            <img class="product-img-sm" src="{{URLROOT}}/img/{{product.file}}" alt="{{product.part_number}}">
        </div>
    </div>
</div>