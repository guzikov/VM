{% include 'includes/head.tpl' %}
<body>
<div class="wrapper">

    <main class="flex">

        <!--HEADER-->

        <header class="page-header">
                <div class="page-top-bar">
                    <div class="container-box">

                        {% include 'includes/login_line.tpl' %}

                    </div>
                </div>
                <div class="page-navigation">
                    <nav class="navigation container-box">
                        <div class="navigation__logo" >
                            <a href="index.html" name="top">
                                <img src="{{URLROOT}}/img/logoblack.png" alt="Логотип">
                            </a>
                            <a href="#">Vertex Medical</a>
                        </div>
                        <ul class="navigation__menu">
                            {% for item in menu %}
                            {% include 'includes/navigation_menu.tpl' %}
                            {% endfor %}
                        </ul>
                    </nav>

                </div>

        </header>
        <div class="advantage_page">
            <div class="advantage-bar container-box">
                <div class="advantage-bar__item">
                    <span class="ti-eye"></span>
                    <span>We repair all types of endoscopy</span>
                </div>
                <div class="advantage-bar__item">
                    <span class="ti-truck"></span>
                    <span>Check the address and delivery</span>
                </div>
                <div class="advantage-bar__item">
                    <span class="ti-ruler-alt"></span>
                    <span>Free diagnosis and evaluation of the cost</span>
                </div>
                <div class="advantage-bar__item">
                    <span class="ti-settings"></span>
                    <span>Original spare parts</span>
                </div>
            </div>
        </div>

        <!--BREADCRUMBS-->

        <div class="breadcrumb-block container-box">
            <ul class="breadcrumb">
                <li class="breadcrumb_item"><a href="index.html">Главная&nbsp;&nbsp;</a></li>
                <li class="breadcrumb_item passive"><a href="shop.html">&nbsp;&nbsp;Магазин&nbsp;&nbsp;</a></li>
                <li class="breadcrumb_item active">&nbsp;&nbsp;Администратор</li>
            </ul>
        </div>

        <!--SHOP MAIN-->

        <div class="container">
            <div class="row">
                <div class="col">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Компания</th>
                            <th scope="col">ФИО</th>
                            <th scope="col">Должность</th>
                            <th scope="col">Почта</th>
                            <th scope="col">Телефон</th>
                            <th scope="col">Город</th>
                            <th scope="col">Адрес</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>Mark</td>
                            <td>Otto</td>
                            <td>@mdo</td>
                            <td>Mark</td>
                            <td>Otto</td>
                            <td>@mdo</td>
                            <td>@mdo</td>
                        </tr>
                        <tr>
                            <th scope="row">2</th>
                            <td>Jacob</td>
                            <td>Thornton</td>
                            <td>@fat</td>
                            <td>Mark</td>
                            <td>Otto</td>
                            <td>@mdo</td>
                            <td>@mdo</td>
                        </tr>
                        <tr>
                            <th scope="row">3</th>
                            <td colspan="2">Larry the Bird</td>
                            <td>@twitter</td>
                            <td>Mark</td>
                            <td>Otto</td>
                            <td>@mdo</td>
                            <td>@mdo</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-2">
                    <ul>
                        <li>Заказы</li>
                        <li>Запросы</li>
                        <li>Клиенты</li>
                        <li>Товары</li>
                        <li>Инфо</li>
                    </ul>
                </div>
            </div>
        </div>


    </main>
    {% include 'includes/footer.tpl' %}
</div>
</body>
</html>