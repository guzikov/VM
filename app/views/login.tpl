{% include 'includes/head.tpl' %}
<body>
<div class="wrapper">
    <main class="flex">
        <!--HEADER-->

        {% include 'includes/header.tpl' %}
        {% include 'includes/advantage_line.tpl' %}

        <!--SEND message FORM-->

        <form name="loginForm" class="loginForm container-box" action="login" method="post">
            <label for="loginForm">Вход в личный кабинет</label>
            <input type="email" name="email" placeholder="Введите E-Mail" value="{{email}}">
            <span class="input_error">{{email_err}}</span>
            <input type="password" name="password" placeholder="Введите пароль" value="{{password}}">
            <span class="input_error">{{password_err}}</span>
            <input type="submit" id="submitBtn">
        </form>
    </main>
    {% include 'includes/footer.tpl' %}
</div>
</body>
</html>