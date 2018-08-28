{% include 'includes/head.tpl' %}
<body>
<div class="wrapper">
    <main class="flex">

        <!--HEADER-->

        {% include 'includes/header.tpl' %}
        {% include 'includes/advantage_line.tpl' %}

        <!--SEND message FORM-->

        <form id="registerForm" class="registerForm container-box" action="register"
        method="post">


            <div name="regdata" class="form-group-1">
                <label for="regData">Обязательные поля для регистрации:</label>
                <input type="email" name="email" value="{{email}}" placeholder="Email">
                <span class="input_error">{{email_err}}</span>
                <input type="text" name="name" placeholder="ФИО" value="{{name}}">
                <span class="input_error">{{name_err}}</span>
                <input type="password" name="password" placeholder="Введите пароль" value="{{password}}">
                <span class="input_error">{{password_err}}</span>
                <input type="password" name="confirm_pass" placeholder="Введите пароль повторно"
                       value="{{confirm_pass}}">
                <span class="input_error">{{confirm_pass_err}}</span>
            </div>

            <div name="addData" class="form-group-2">
                <label for="addData">Рекомендуется к заполнению:</label>
                <input name="company" type="text" id="inputCompany" placeholder="Название организации">
                <input name="city" type="text" id="inputCity" placeholder="Город">
                <input name="address" type="text" id="inputAddress" placeholder="Адрес">

                <input name="position" type="text" id="inputPosition" placeholder="Должность">
                <input name="phone" type="text" id="inputPhoneNumber" placeholder="Телефон">
            </div>

            <input type="submit" id="submitBtn">
        </form>

    </main>

    {% include 'includes/footer.tpl' %}
</div>
</body>
</html>