<script>
    // Обработчик кнопок КУПИТЬ ТОВАР
    function orderItem(id){

        let xhr = new XMLHttpRequest();
        xhr.open('POST', '{{URLROOT}}/shop/addToBasket', true);
        xhr.setRequestHeader('X_REQUESTED_WITH', 'XMLHttpRequest');
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

        xhr.onreadystatechange = function () {
            if(xhr.readyState == 4 && xhr.status == 200 ){
                console.log(xhr.responseText);
            }
        };
        xhr.send('id_item='+ id);
    }

    // Обработчик выбора другой новости
    function getArticle(id){

        let xhr = new XMLHttpRequest();
        xhr.open('POST', '{{URLROOT}}/news/article/'+ id, true);
        xhr.setRequestHeader('X_REQUESTED_WITH', 'XMLHttpRequest');
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

        xhr.onreadystatechange = function () {
            if(xhr.readyState == 4 && xhr.status == 200 ){
                let newsBlock = document.getElementById('news-block');
                console.log(newsBlock);
                console.log('Переданный id:' + id);
                newsBlock.innerHTML = xhr.responseText;
            }
        };
        xhr.send();
    }
    let ajaxLink = document.getElementById('side-bar');

    ajaxLink.onclick = function (event) {
        let target = event.target;

        if (target.className == 'side-bar-link'){
            getArticle(target.dataset.id);
            console.log(target.dataset.id);
        } else if (target.className == 'orderBtn'){
            console.log(target);
            orderItem(target.id);
        }
    }

</script>