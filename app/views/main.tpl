{% include 'includes/head.tpl' %}
<body>
<div class="wrapper">

<main class="flex">

<!--HEADER-->

    <header class="homepage-header">
        <div class="slider">
         <div class="homepage-top-bar">
             <div class="container-box">

                 {% include 'includes/login_line.tpl' %}

             </div>
         </div>
         <div class="homepage-navigation">
                <nav class="navigation container-box">
                <div class="navigation__logo" >
                    <a href="index.html" name="top">
                    <img src="{{URLROOT}}/img/logowhite.png" alt="Логотип">
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
            <div class="slider-text container-box">
                <h4>We Will Repair</h4>
                <h4>your gadget</h4>
                <h4>Without taking you</h4>
                <h4>from your work </h4>
            </div>
        </div>
    </header>
    <div class="advantage">
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

    <!--OUR SERVICES/ НАШИ УСЛУГИ-->

    <div class="title container-box">
        <h1>Выполняем работы</h1>
    </div>

    <div class="service-choose container-box">
        {% for item in serviceList[0:3] %}
        <div class="item">
            <a href="{{URLROOT}}/service/product/{{item.id}}">
                <img src="{{URLROOT}}/img/{{item.file}}" alt="{{item.file}}"></a>
            <h3>{{item.name}}</h3>
            <p>{{item.preview}}</p>
            <a href="{{URLROOT}}/service/product/{{item.id}}">read more</a>
        </div>
        {% endfor %}
    </div>

    <!--ATTANTION LINE-->

    <div class="attantion-line">
        <div class="attantion-message container-box ">
            <div class="attantion-col">
                <span class="ti-alert"></span>
                <h2>Privacy policy</h2>
                <p>Special attention our company gives privacy policy. No information from your gadget will not be transferred to a third party. We respect our customers.</p>
            </div>
        </div>
    </div>

    <div class="service-choose container-box">
        {% for item in serviceList[3:3] %}
        <div class="item">
            <a href="{{URLROOT}}/service/product/{{item.id}}">
                <img src="{{URLROOT}}/img/{{item.file}}" alt="{{item.file}}"></a>
            <h3>{{item.name}}</h3>
            <p>{{item.preview}}</p>
            <a href="{{URLROOT}}/service/product/{{item.id}}">read more</a>
        </div>
        {% endfor %}
    </div>

    <!--ABOUT Line-->
    <div class="about-line">
        <div class="about-message container-box ">
            <div class="title">
                <h1>О компании</h1>
            </div>
            <div class="experience-row1">
                <div class="exp-col1">
                    <span class="ti-bag"></span>
                    <h3>Greate Experience</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium amet neque omnis optio quam recusandae, sunt tenetur?</p>
                </div>
                <div class="exp-col2">
                    <span class="ti-cup"></span>
                    <h3>Greate Experience</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet dicta dolorum inventore laboriosam laborum magni?</p>
                </div>
            </div>
            <div class="experience-row2">
                <h2>Who we are</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci aliquid amet autem consequatur dolores, earum facilis fugiat illo iure molestias perspiciatis, provident quaerat reprehenderit sapiente tempora. Ad dolor dolore doloremque dolores eligendi explicabo facere natus nobis obcaecati officia perferendis, quod saepe sequi unde veritatis. Eaque est magnam natus odio repellat.</p>
                <a href="">read more</a>
            </div>
        </div>
    </div>

    <!--SHOP Line-->
    <div class="title-parts container-box">
        <h1>Магазин</h1>
        <a href="shop.html">Еще товары...</a>
    </div>

    <div class="shop-choose container-box">
        <div class="shop-item">
            <a href=""><img src="img/ship1.png" alt="Запчасть"></a>
            <p>Тубус Т-123</p>
            <a href=""><span class="ti-package"></span>Заказать</a>
        </div>
        <div class="shop-item">
            <a href=""><img src="img/ship1.png" alt="Запчасть"></a>
            <p>Видеоэндоскоп</p>
            <a href=""><span class="ti-package"></span>Заказать</a>
        </div>
        <div class="shop-item">
            <a href=""><img src="img/ship1.png" alt="Запчасть"></a>
            <p>Ручка управления Pentax</p>
            <a href=""><span class="ti-package"></span>Заказать</a>
        </div>
        <div class="shop-item">
            <a href=""><img src="img/ship1.png" alt="Запчасть"></a>
            <p>Оптоволкно ОВ-10</p>
            <a href=""><span class="ti-package"></span>Заказать</a>
        </div>
    </div>

</main>

{% include 'includes/main/main_footer.tpl' %}

</div>
</body>
</html>