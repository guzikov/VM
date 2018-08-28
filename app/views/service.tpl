{% include 'includes/head.tpl' %}
<body>
<div class="wrapper">

    <main class="flex">

        {% include 'includes/header.tpl' %}
        {% include 'includes/advantage_line.tpl' %}
        {% include 'includes/breadcrumbs.tpl' %}

        <!--SERVICE LIST PAGE-->

        {% include 'includes/service/service_item.tpl' %}

    </main>
    {% include 'includes/get_quote_line.tpl' %}
    {% include 'includes/footer.tpl' %}
</div>
</body>
</html>