{% for order in orders %}
<div class="table-responsive orders-table">
    <table class="table table-bordered table-hover">
        <caption>Заявка № {{order.id_order}} от {{order.date}}</caption>
        <thead class="thead-light">
        <tr>
            <th scope="col" colspan="2">Заявка №</th>
            <th scope="col" colspan="4">Заказчик</th>
            <th scope="col" colspan="2">Дата</th>
            <th scope="col" colspan="2">Статус</th>
        </tr>
        </thead>
        <tbody>
            <tr>
                <th scope="row" colspan="2">{{order.id_order}}</th>
                <td colspan="4"><a href="{{URLROOT}}/account/user/{{order.id_user}}">{{order.user.company}}</a></td>
                <td colspan="2">{{order.date}}</td>
                <td colspan="2">{{order.status}}</td>
            </tr>
        </tbody>
        <thead class="thead-light">
        <tr>
            <th scope="col" colspan="2"></th>
            <th scope="col">Тип</th>
            <th scope="col">Вендор</th>
            <th scope="col">Модель</th>
            <th scope="col">Год</th>
            <th scope="col">Герметичность</th>
            <th scope="col">Чистящее средство</th>
            <th scope="col">Заявленные неиcправности</th>
        </tr>
        </thead>
        <tbody>
        {% for service in order.need_service %}
            <tr>
                {% if loop.first %}
                <th scope="row" colspan="2" class="hrow">Требуется сервис:</th>
                {% else %}
                <th scope="row" colspan="2" class="hrow"></th>
                {% endif %}
                <td>{{service.type}}</td>
                <td>{{service.vendor}}</td>
                <td>{{service.model}}</td>
                <td>{{service.year}}</td>
                <td>{{service.tightness}}</td>
                <td>{{service.clear_agent}}</td>
                <td>{{service.defect}}</td>
            </tr>
        {% endfor %}
        </tbody>
        <thead class="thead-light">
        <tr>
            <th scope="col" colspan="2"></th>
            <th scope="col" colspan="4">Наименование</th>
            <th scope="col" colspan="2">Тип</th>
            <th scope="col" colspan="2">Артикул</th>
        </tr>
        </thead>
        <tbody>
        {% for equip in order.need_equipment %}
        <tr>
            {% if loop.first %}
            <th scope="row" colspan="2" class="hrow">Требуется оборуд.:</th>
            {% else %}
            <th scope="row" colspan="2" class="hrow"></th>
            {% endif %}
            <td colspan="4">{{equip.name}}</td>
            <td colspan="2">{{equip.category_name}}</td>
            <td colspan="2">{{equip.part_number}}</td>
        </tr>
        {% else %}
        <tr>
            <th scope="row" colspan="2" class="hrow">Требуется оборуд.:</th>
            <td colspan="4">-</td>
            <td colspan="2">-</td>
            <td colspan="2">-</td>
        </tr>
        {% endfor%}
        </tbody>
    </table>
</div>
{% endfor %}


