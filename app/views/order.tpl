{% include 'includes/head.tpl' %}
<body>
<div class="wrapper">

    <main class="flex">

        <!--HEADER-->


        {% include 'includes/header.tpl' %}
        {% include 'includes/advantage_line.tpl' %}

        <!-- BASKET AJAX BLOCK -->
        {% include 'includes/order/order_block.tpl' %}

    </main>
    {% include 'includes/footer.tpl' %}
    {% include 'includes/order/order_ajax_service.tpl' %}
</div>
</body>
</html>