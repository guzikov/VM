{% include 'includes/head.tpl' %}
<body>
<div class="wrapper">

    <main class="flex">

        <!--HEADER-->

        {% include 'includes/header.tpl' %}
        {% include 'includes/advantage_line.tpl' %}

        <!--BREADCRUMBS-->

        {% include 'includes/breadcrumbs.tpl' %}

        <!--WHO WE ARE line-->

        <div class="about-text">
            <div class="container-box">
                <h1 class="title">О компании</h1>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                    Adipisci aliquid amet autem consequatur dolores, earum facilis fugiat illo iure molestias perspiciatis,
                    provident quaerat reprehenderit sapiente tempora.
                    Ad dolor dolore doloremque dolores eligendi explicabo facere natus nobis obcaecati officia perferendis,
                    quod saepe sequi unde veritatis. Eaque est magnam natus odio repellat.
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                    <br><br>
                    A adipisci corporis dolorum eveniet fugiat minus obcaecati optio reprehenderit suscipit
                    veniam. Ad beatae blanditiis consectetur et exercitationem ipsum molestias nam reprehenderit.
                    Accusamus dolorum earum eligendi, enim fuga magnam nobis sapiente totam voluptates? Delectus eos eum explicabo ipsum nihil,
                    nulla numquam omnis quae repellat voluptate? Deleniti doloremque esse facilis fugit impedit, odio?Aspernatur at consectetur cumque cupiditate dicta et facere facilis nam, nostrum perferendis quibusdam quod quos ratione reiciendis repellat vero, voluptates!
                    Accusantium asperiores assumenda doloribus facere laborum maxime, quae rerum soluta.
                    A accusamus commodi culpa esse expedita id minus, pariatur perspiciatis, quae quidem temporibus,
                    velit voluptatibus.
                </p>
            </div>
        </div>

        <div class="about-video container-box ">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                Adipisci aliquid amet autem consequatur dolores, earum facilis fugiat illo iure molestias perspiciatis,
                provident quaerat reprehenderit sapiente tempora.
                Ad dolor dolore doloremque dolores eligendi explicabo facere natus nobis obcaecati officia perferendis,
                quod saepe sequi unde veritatis. Eaque est magnam natus odio repellat.
                Lorem ipsum dolor sit amet, consectetur adipisicing elit.
            </p>
            <video class="video-presentation" src="" alt="video"></video>
        </div>

        <!--GALLERY-->

        <div class="gallery-title container-box">
            <h1>Галерея</h1>
            <div class="arrow-buttons" id="arrow-buttons">
                <button id="prev"> <span class="ti-angle-left"></span> </button>
                <button id="next"> <span class="ti-angle-right"></span> </button>
            </div>
        </div>
        <div class="gallery-slider">
            <div class="slider-wrapper" id="gallery">
                <div class="slider-item">
                    <a id="testLink" href="#">
                        <span class="ti-fullscreen"></span>
                        <img class="gallery-image" src="{{URLROOT}}/img/gal1.jpg" alt="photo1">
                    </a>
                </div>
                <div class="slider-item">
                    <a href="">
                        <span class="ti-fullscreen"></span>
                        <img class="gallery-image" src="{{URLROOT}}/img/gal2.jpeg" alt="photo1">
                    </a>
                    </div>
                <div class="slider-item">
                    <a href="">
                        <span class="ti-fullscreen"></span>
                        <img class="gallery-image" src="{{URLROOT}}/img/gal3.jpg" alt="photo1">
                    </a>
                    </div>
                <div class="slider-item">
                    <a href="">
                        <span class="ti-fullscreen"></span>
                        <img class="gallery-image" src="{{URLROOT}}/img/gal4.jpg" alt="photo1">
                    </a>
                    </div>
                <div class="slider-item">
                    <a href="">
                        <span class="ti-fullscreen"></span>
                        <img class="gallery-image" src="{{URLROOT}}/img/gal5.jpg" alt="photo1">
                    </a>
                    </div>
                <div class="slider-item">
                    <a href="">
                        <span class="ti-fullscreen"></span>
                        <img class="gallery-image" src="{{URLROOT}}/img/gal6.png" alt="photo1">
                    </a>
                    </div>
            </div>
        </div>


        <!--OUR PROCESS line-->

        <div class="gallery-title container-box">
            <h1>Этапы ремонта</h1>
        </div>

        <div class="process-choose container-box">
            <div class="item">
                <a href=""><img src="img/gal5.jpg" alt="Ремонт"></a>
                <h3><span>1.</span> You call us</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magnam, molestias.</p>
                <a href="">read more</a>
            </div>
            <div class="item">
                <a href=""><img src="img/gal5.jpg" alt="Ремонт"></a>
                <h3><span>2.</span> Arrival and diagnosis</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laudantium, maiores.</p>
                <a href="">read more</a>
            </div>
            <div class="item">
                <a href=""><img src="img/gal5.jpg" alt="Ремонт"></a>
                <h3><span>3.</span> Repair</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consectetur, explicabo.</p>
                <a href="">read more</a>
            </div>
            <div class="item">
                <a href=""><img src="img/gal5.jpg" alt="Ремонт"></a>
                <h3><span>4.</span> Return to the specified adress</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Deserunt, nemo.</p>
                <a href="">read more</a>
            </div>
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
    </main>
    {% include 'includes/main/main_footer.tpl' %}

</div>
</body>
</html>

<script>

    $( document ).ready(function () {
        function htmlSlider(){
            let sliderWrapper = $('.slider-wrapper');
            let nextLink = $('#next');
            let prevLink = $('#prev');

            setInterval(autoplay, 5000);

            prevLink.click(function() {
                let slides = $('.slider-wrapper .slider-item');
                let slideWidth = slides.outerWidth();

                if (!sliderWrapper.is(':animated')){
                    sliderWrapper
                        .css({'left': '-' + slideWidth + 'px'})
                        .find('.slider-item:last')
                        .prependTo(sliderWrapper)
                        .parent()
                        .animate({left: 0}, 400)
                }


            });

            nextLink.click(function () {
                let slides = $('.slider-wrapper .slider-item');
                let slideWidth = slides.outerWidth();

                if (!sliderWrapper.is(':animated')){
                    sliderWrapper.animate({left: "-" + slideWidth + "px"}, 400, function () {
                        sliderWrapper
                            .find('.slider-item:first')
                            .appendTo(sliderWrapper)
                            .parent()
                            .css({left: 0});
                    })
                }
            });

            function autoplay(){

                let slides = $('.slider-wrapper .slider-item');
                let slideWidth = slides.outerWidth();
                if (!sliderWrapper.is(':animated')){
                    sliderWrapper.animate({left: "-" + slideWidth + "px"}, 400, function () {
                        sliderWrapper
                            .find('.slider-item:first')
                            .appendTo(sliderWrapper)
                            .parent()
                            .css({left: 0});
                    })
                }
            }


            function openFullImg(currentSlide){
                let overlay = $('<div class = "overlay"> </div>');

                overlay.appendTo($('.slider-item'));
                currentSlide.find('img').clone().appendTo(overlay).toggleClass('gallery-image fullImg');
                overlay.show("fade", 500);
            }

            function closeFullImg() {
                $('.overlay').hide("fade", 500, function () {
                    $(this).remove();
                });
            }

            $('.slider-item').click(function (event) {
                event.preventDefault();

                if ($(this).find($('.overlay')).length > 0)
                    closeFullImg();
                else
                    openFullImg($(this));
            });
        }
        htmlSlider();
    })
</script>