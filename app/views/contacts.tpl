{% include 'includes/head.tpl' %}
<body>
<div class="wrapper">

    <main class="flex">

        <!--HEADER-->

        {% include 'includes/header.tpl' %}
        {% include 'includes/advantage_line.tpl' %}

        <!--CONTACTS-->

        <div class="contacts-block">
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

        <div class="ask-question">
            <a class="container-box" href="{{URLROOT}}/order">Оформить заявку онлайн</a>
            <a class="container-box" id="askQuestion" href="">Задать вопрос</a>
        </div>

        <!--SEND message FORM-->

        <form id="sendForm" class="sendForm container-box" action="{{URLROOT}}/contacts/askQuestion" method="post">
            <input form="sendForm" type="text" id="inputCompany" name="company" placeholder="Название организации">
            <input form="sendForm" type="text" id="inputCity" name="city" placeholder="Город">
            <input form="sendForm" type="text" id="inputAddress" name="address" placeholder="Адрес">
            <input form="sendForm" type="text" id="inputName" name="name" placeholder="ФИО*">
            <input form="sendForm" type="text" id="inputPosition" name="position" placeholder="Должность">
            <input form="sendForm" type="tel" id="inputPhoneNumber" name="phone" placeholder="Телефон*">
            <input form="sendForm" type="email" id="inputEmail" name="email" placeholder="Email">
            <textarea form="sendForm"  rows="3" id="inputMessage" name="comment"
                      placeholder="Как&nbsp;мы&nbsp;можем&nbsp;помочь?*"></textarea>
            <input form="sendForm" name="check" value="" hidden readonly>
            <input form="sendForm"  type="submit" id="submitBtn">
        </form>
    </main>
    {% include 'includes/main/main_footer.tpl' %}

</div>
</body>
</html>

<script>
    $(document).ready(function () {
        $('#sendForm').hide();
    });

    $('#askQuestion').on('click', function (event) {
        event.preventDefault();
        if ($('#sendForm')[0].style.display === "none"){
            $('#sendForm').show(500);
            $(this).css({
                width: '100%',
            });
        }
        else {
            $('#sendForm').hide(500);
            $(this).css({width: '50%'});
        }
    });

    $('#sendForm').on('submit', function(event){
        wrongInput($('#inputName'), event);
        wrongInput($('#inputPhoneNumber'), event);
        wrongInput($('#inputMessage'), event);
    });

    $('#inputName').on('change', function(){
        setDefaultCss(this);
    });
    $('#inputPhoneNumber').on('change', function(){
        setDefaultCss(this);
    });
    $('#inputMessage').on('change', function(){
        setDefaultCss(this);
    });

    // wrong input animation function

    function wrongInput(element, event){
        if (element.val() === ''){
            event.preventDefault();
            element.css({
                'border-color': "#f35f55"
            });
            element.effect("shake", "slow");
        }
    }

    // set default css attributes after wrong input function

    function setDefaultCss(element){
        if (element.style.borderColor === "#f35f55"
            || element.style.borderColor === "rgb(243, 95, 85)"){
            $(element).animate({
                'border-color': "#666666"
            }, 300);
        }
    }

</script>