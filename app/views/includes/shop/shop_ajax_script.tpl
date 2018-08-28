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

    // Обработчик кнопок ГРУПП товаров
    function selectGroup(id){

        let xhr = new XMLHttpRequest();
        xhr.open('POST', '{{URLROOT}}/shop/catalog/'+ id, true);
        xhr.setRequestHeader('X_REQUESTED_WITH', 'XMLHttpRequest');
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

        xhr.onreadystatechange = function () {
            if(xhr.readyState == 4 && xhr.status == 200 ){
                let shopBlock = document.getElementById('ajax-block');
                console.log(shopBlock);
                shopBlock.innerHTML = xhr.responseText;
            }
        };
        xhr.send();
    }
    let groupBtn = document.getElementById('ajax-block');

    groupBtn.onclick = function (event) {
        let target = event.target;

        if (target.name === 'selectCatBtn'){
            console.log(target.id);
            selectGroup(target.id);
        } else if (target.className === 'orderBtn'){
            console.log(target);
            orderItem(target.id);
        }
    }

</script>