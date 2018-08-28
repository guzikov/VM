<div class="table-responsive">
    <table class="table table-bordered table-hover">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">ФИО</th>
            <th scope="col">E-mail</th>
            <th scope="col">Телефон</th>
            <th scope="col">Должность</th>
            <th scope="col">Компания</th>
            <th scope="col">Город</th>
            <th scope="col">Адрес</th>
            <th scope="col">Комментарии</th>
            <th scope="col">Дата</th>

        </tr>
        </thead>
        <tbody>
        {% for question in questions %}
        <tr>
            <th scope="row"><a href="{{URLROOT}}/account/questions/{{question.id_question}}">{{question
                    .id_question}}</a></th>
            <td>{{question.name}}</td>
            <td>{{question.email}}</td>
            <td>{{question.phone}}</td>
            <td>{{question.position}}</td>
            <td>{{question.company}}</td>
            <td>{{question.city}}</td>
            <td>{{question.address}}</td>
            <td>{{question.comment}}</td>
            <td>{{question.data}}</td>
        </tr>
        {% endfor %}
        </tbody>
    </table>
</div>
