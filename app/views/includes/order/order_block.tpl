<div class="order">

<div class="order-manual container-box">
    <h5>Разместить заявку на ремонт или оборудование очень просто</h5>
    <div class="order-stage">
        <p>Введите информацию о приборе и предполагаемые неисправности</p>
        <span class="ti-angle-double-right"></span>
        <p>Укажите свои контактные данные и отправьте заявку</p>
        <span class="ti-angle-double-left"></span>
        <p>Добавьте интересующее оборудование и материалы из раздела "Продукция"</p>
    </div>
</div>

    <div class="background-block-service">
        <form class="order-service container-box">
            <h3>Введите информацию о приборах</h3>
            <table class="table table-hover">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Тип прибора<sup>*</sup></th>
                    <th scope="col">Фирма производитель<sup>*</sup></th>
                    <th scope="col">Модель<sup>*</sup></th>
                    <th scope="col">Год выпуска</th>
                    <th scope="col">Герметичность</th>
                    <th scope="col">Чистящее средство</th>
                    <th scope="col">Заявляемые неисправности</th>

                </tr>
                </thead>
                <tbody id="endo-table">
                <tr id="endo-input-row" class="endo-input-row">
                    <th scope="row">1</th>
                    <td>
                        <select form="order-form" name="endo-type" class="endo-input" id="endo-type">
                            <option value="" selected disabled hidden></option>
                        </select>
                        <p class="endo-err">Необходимо указать</p>
                    </td>
                    <td>
                        <select form="order-form" name="endo-vendor" class="endo-input" id="endo-vendor">
                            <option value="" selected disabled hidden></option>
                        </select>
                        <p class="endo-err">Необходимо указать</p>
                    </td>
                    <td>
                        <select form="order-form" disabled name="endo-model" class="endo-input endo-model"
                                id="endo-model">
                            <option value="" selected disabled> Выберите тип и марку </option>
                        </select>
                        <p class="endo-err">Необходимо указать</p>
                    </td>
                    <td>
                        <input form="order-form" type="text" name="endo-year" class="form-control"
                               id="production_date"></td>
                    <td>
                        <select form="order-form" name="endo-tightness" class="" id="tightness">
                            <option value="" selected disabled hidden></option>
                            <option value="Да">Да</option>
                            <option value="Нет">Нет</option>
                        </select>
                    </td>
                    <td>
                        <input form="order-form" type="text" name="endo-cleanser" class="form-control" id="cleanser">
                    </td>
                    <td>
                    <textarea form="order-form" name="endo-defects" class="form-control" id="defects"
                              rows="3"></textarea>
                    </td>

                </tr>
                <tr>
                    <th scope="row">
                        <button class="ti-plus" id="add-endo-btn"></button>
                    </th>
                    <td>

                    </td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>
                        <button class="ti-minus" id="remove-endo-btn"></button>
                    </td>
                    <td>

                    </td>
                </tr>
                </tbody>
            </table>
        </form>
    </div>

    {% if sessionIsOpen.status == '' %}
    <div class="background-block-contacts">
        <div class="order-contacts container-box">
            <h3>Введите контактные данные</h3>
            <div class="contacts-form">
                <input form="order-form" name="company" type="text" id="inputCompany"
                       placeholder="Название организации">
                <input form="order-form" name="city" type="text" id="inputCity" placeholder="Город">
                <input form="order-form" name="address" type="text" id="inputAddress" placeholder="Адрес">
                <input form="order-form" name="name" type="text" id="inputName" placeholder="ФИО*">
                <span class="input-err" id="input-err-name">Необходимо заполнить</span>
                <input form="order-form" name="position" type="text" id="inputPosition" placeholder="Должность">
                <input form="order-form" name="phone" type="tel" id="inputPhone" placeholder="Телефон*">
                <span class="input-err" id="input-err-phone">Необходимо заполнить</span>
                <input form="order-form" name="email" type="email" id="inputEmail" placeholder="Email">
                <textarea form="order-form" type="textarea" name="comment" id="inputMessage" rows="3"
                          placeholder="Дополнительная&nbsp;информация"></textarea>
            </div>
        </div>
    </div>
    {% endif %}

    <div class="background-block-equip">
        <div class="order-shop container-box">
            <table class="table table-bordered">
                <thead class="thead-light">
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Наименование</th>
                    <th scope="col">Тип</th>
                    <th scope="col" style="width: 10%">Артикул</th>
                </tr>
                </thead>
                <tbody>
                {% for item in itemList %}
                <tr>
                    <th scope="row">{{loop.index}}</th>
                    <td><a href="{{URLROOT}}/shop/product/{{item.id_equipment}}">{{item.name}}</a></td>
                    <td><a href="{{URLROOT}}/shop/catalog/{{item.id_category}}">{{item.category_name}}</a></td>
                    <td><a href="{{URLROOT}}/shop/product/{{item.id_equipment}}">{{item.part_number}}</a></td>
                </tr>
                {% endfor %}
                </tbody>
            </table>
            <h3><a href="{{URLROOT}}/shop">Добавьте интересующее оборудование или запчасти</a></h3>
        </div>
    </div>

    <input form="order-form" class="submitOrderBtn" type="submit" id="submitBtn" value="Отправить запрос">
    <form id="order-form" method="post" action="{{URLROOT}}/order/sendOrder">
    </form>
</div>
