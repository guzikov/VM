<div class="container-box account-block">
    {% include 'includes/account/account_menu.tpl' %}
    {% if currentPage.page == 'account' %}
    ДОБРО ПОЖАЛОВАТЬ В ЛИЧНЫЙ КАБИНЕТ!!!
    {% elseif currentPage.page == 'users' %}
    {% include 'includes/account/users_table.tpl' %}
    {% elseif currentPage.page == 'orders' %}
    {% include 'includes/account/orders_table.tpl' %}
    {% elseif currentPage.page == 'questions' %}
    {% include 'includes/account/questions_table.tpl' %}
    {% endif %}
</div>