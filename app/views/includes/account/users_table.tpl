<div class="table-responsive">
    <table class="table table-bordered table-hover">
        <thead>
        <tr>
            <th scope="col" style="width: 1%">id</th>
            <th scope="col" style="width: 15%">ФИО</th>
            <th scope="col" style="width: 10%">E-mail</th>
            <th scope="col" style="width: 10%">Телефон</th>
            <th scope="col" style="width: 5%">Должность</th>
            <th scope="col" style="width: 15%">Компания</th>
            <th scope="col" style="width: 5%">Город</th>
            <th scope="col" style="width: 15%">Адрес</th>
            <th scope="col" style="width: 15%">Комментарии</th>
            <th scope="col" style="width: 5%">Статус</th>

        </tr>
        </thead>
        <tbody>
        {% for user in usersInfo.registered %}
        <tr>
            <th scope="row"><a href="{{URLROOT}}/account/user/{{user.id_user}}">{{user.id_user}}</a></th>
            <td>{{user.name}}</td>
            <td>{{user.email}}</td>
            <td>{{user.phone}}</td>
            <td>{{user.position}}</td>
            <td>{{user.company}}</td>
            <td>{{user.city}}</td>
            <td>{{user.address}}</td>
            <td>{{user.comment}}</td>
            <td>{{user.status}}</td>
        </tr>
        {% endfor %}
        {% for user in usersInfo.unregistered %}
        <tr>
            <th scope="row"><a href="{{URLROOT}}/account/user/{{user.id_user}}">{{user.id_user}}ORDR</a></th>
            <td>{{user.name}}</td>
            <td>{{user.email}}</td>
            <td>{{user.phone}}</td>
            <td>{{user.position}}</td>
            <td>{{user.company}}</td>
            <td>{{user.city}}</td>
            <td>{{user.address}}</td>
            <td>{{user.comment}}</td>
            <td>{{user.status}}</td>
        </tr>
        {% endfor %}
        </tbody>
    </table>
</div>
