 {% include 'includes/head.tpl' %}
<body>
<div class="wrapper">

    <main class="flex">

        {% include 'includes/header.tpl' %}
        {% include 'includes/advantage_line.tpl' %}
        {% include 'includes/breadcrumbs.tpl' %}

        <!--NEWS BLOCK-->
        {% include 'includes/news/news_block.tpl'%}

        <!--PAGENATOR-->
        {% include 'includes/paginator_block.tpl' %}

    </main>
    {% include 'includes/get_quote_line.tpl' %}
    {% include 'includes/footer.tpl' %}

</div>
</body>
</html>