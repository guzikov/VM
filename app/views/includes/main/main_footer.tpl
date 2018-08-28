<footer>
    <div class="contacts-line">
        <div class="contacts-line__text container-box">
            <div class="contacts">
                <span class="ti-location-pin"></span>
                <span>Санкт-Петербург, Михаила Дудина 3</span>
            </div>
            <div class="contacts">
                <span class="ti-mobile"></span>
                <span>+7-921-449-88-40</span>
            </div>
            <div class="contacts">
                <span class="ti-email"></span>
                <span>vertexmedical@yandex.ru</span>
            </div>

        </div>
    </div>
    <div class="map-line">
        <iframe src="https://yandex.ru/map-widget/v1/-/CBahR0hwpC" frameborder="0"></iframe>
    </div>
    <div class="footer-links container-box">
        <div class="footer-links__logo">
            <a href="{{URLROOT}}">
                <img src="{{URLROOT}}/img/logoblack.png" alt="Логотип">
            </a>
            <a href="{{URLROOT}}">Vertex Medical</a><br>
            <p>Vivamus augue diam, vehicula vel commodo vitae, porttitor in nisl. Nunc porttitor metus at vestibulum mattis. Integer lectus est, efficitur elementum posuere id, ultrices quis orci. </p>
        </div>
        <ul class="footer-links__menu">
            {% for item in menu %}
            {% include 'includes/navigation_menu.tpl' %}
            {% endfor %}
        </ul>
        <ul class="footer-links__menu">
            <li>We Fix</li>
            {% for item in menuFooter %}
            {% include 'includes/navigation_menu.tpl' %}
            {% endfor %}
        </ul>
        <ul class="footer-links__list">
            <li><span class="ti-check-box"></span>We repair all types of electronics</li>
            <li><span class="ti-check-box"></span>Check the address and delivery</li>
            <li><span class="ti-check-box"></span>Free diagnosis and evaluation of the cost</li>
            <li><span class="ti-check-box"></span>Original spare parts</li>
        </ul>
    </div>
    <div class="footer-rights">
        <div class="footer-rights_flex container-box">
            <span>© 2018 ООО "Вертекс Медикал". Все права защищены</span>
            <a href="#top"><span class="ti-arrow-up"></span></a>
        </div>
    </div>
</footer>
