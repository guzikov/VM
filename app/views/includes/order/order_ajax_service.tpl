<script>

    // Set first row of endo-table when page is loaded
    $(document).ready(function(){
        setRowAttributes(firstRow);
        setType(firstRow);
        setVendor(firstRow);
    });

    $('#order-form').on('submit', function(event){
        // event.preventDefault();
        if ($('#inputName').val() === ''){
            $('#input-err-name').show(0);
            $('#input-err-name').animate({
                'margin-left': 0,
            }, 300);
        }
        if ($('#inputPhone').val() === ''){
            $('#input-err-phone').show(0);
            $('#input-err-phone').animate({
                'margin-left': 0,
            }, 300);
        }

        $('.endo-input').each(function(index){
            if ($(this).val() === null){
                $(this).siblings('p').show(300);
                $(this).animate({
                    'border-width': '3px',
                    'border': 'solid',
                    'border-color': '#f35f55'
                }, 300);
            }
        });




       ////.ajax({
       //    method: "POST",
       //    url: "{{URLROOT}}/order/getPost"
       //})
       //    .done(function (msg) {
       //        console.log(msg);
       //    });
    });

    // Hide the errors if some after the fields have been changed

    $('#inputName').on("change", function() {
        if ($('#input-err-name')[0].style.display !== "none"){
            console.log("true");
            $('#input-err-name').animate({
                'margin-left': -150,
            }, 300);
            $('#input-err-name').hide(300);
        }
    });
    $('#inputPhone').on("change", function() {
        if ($('#input-err-phone')[0].style.display !== "none"){
            console.log("true");
            $('#input-err-phone').animate({
                'margin-left': -150,
            }, 300);
            $('#input-err-phone').hide(300);
        }
    });

    // Add a new endoscope for service request
    let firstRow = $('#endo-input-row');
    let emptyRow = firstRow.clone();
    let rowNumber = 0;


// Setting row attributes
    function setRowAttributes(currentRow){
        ++rowNumber;
        currentRow.attr("id", function(i, attr){
            attr = "endo-input-row-";
            currentRow.find("th").text(rowNumber);
            return attr + rowNumber;
        });

        currentRow
            .find('input, select, textarea')
            .attr("name", function(i, attr){
                return attr + "-" + rowNumber;
            });
    }

    // add new row button event handler
    $('#add-endo-btn').on('click', function(event){
        event.preventDefault();
        let newRow = emptyRow.clone();
        setRowAttributes(newRow);
        setType(newRow);
        setVendor(newRow);

        newRow.insertBefore("#endo-table tr:last-child");
    });

    // remove row event handler
    $('#remove-endo-btn').on('click', function(){
       event.preventDefault();
       let rows = $('.endo-input-row');
       rows[rows.length - 1].remove();
       rowNumber -= 1;
    });

    //if USER changing type or vendor - upload new models from DB

    $('#endo-table').on('change', function(event) {
        let target = $(event.target);
        let type;
        let vendor;
        let model;

        if (target.attr("id") == "endo-type"){
            // Checking if error message is displayed
            if (target[0].style.borderWidth === "3px"){
                target.animate({
                    'border-width': '1px',
                    'border': 'solid',
                    'border-color': '#ced4da'
                }, 300);
                target.siblings('p').hide(400);
            }
            // Download the model information for the current row
            type = target;
            vendor = $(target.parent().siblings()[1]).find('select');
            model = $(target.parent().siblings()[2]).find('select');
            model.find('option:first-child').siblings().remove();
            modelSelect(type, vendor, model);
        } else if (target.attr("id") == "endo-vendor") {
            // Checking if error message is displayed
            if (target[0].style.borderWidth === "3px"){
                target.animate({
                    'border-width': '1px',
                    'border': 'solid',
                    'border-color': '#ced4da'
                }, 300);
                target.siblings('p').hide(400);
            }
            //Download the model information for the current row
            type = $(target.parent().siblings()[1]).find('select');
            vendor = target;
            model = $(target.parent().siblings()[2]).find('select');
            model.find('option:first-child').siblings().remove();
            modelSelect(type, vendor, model);
        } else if (target.attr("id") == "endo-model"){
            // Checking if error message is displayed
            if (target[0].style.borderWidth === "3px"){
                target.animate({
                    'border-width': '1px',
                    'border': 'solid',
                    'border-color': '#ced4da'
                }, 300);
                target.siblings('p').hide(400);
            }
        }
    });

    // AJAX-function to upload models from DB
    function modelSelect(type, vendor, model) {
        if ((type.find(':selected').val() !== "")
            && vendor.find(':selected').val() !== ""){

            type = type.find(':selected').val();
            vendor = vendor.find(':selected').val();

            $.get("{{URLROOT}}/order/getEndoModel/" + type + "/" + vendor, function (data) {
                data.forEach(function (item) {
                    model.append('<option value="'
                        + item.id_model
                        + '">' + item.model.toUpperCase() + '</option>');
                });

            }, "json");

            model.find('option:first-child').text("Выберите модель");
            model.prop('disabled', false);
        }
        else
            model.prop('disabled', true);
    }

    // AJAX-function for uploading endo-types to FORM
    function setType(row){
        let type = row.find('#endo-type');

        $.get("{{URLROOT}}/order/getEndoType", function (data) {
            data.forEach(function (item) {
                type.append('<option value="'
                    + item.id_type
                    + '">' + item.type + '</option>');
            });

        }, "json");
    }


    // AJAX-function for uploading endo-vendors to FORM

    function setVendor(row) {
        let vendor = row.find('#endo-vendor');

        $.get("{{URLROOT}}/order/getEndoVendor", function (data) {
            data.forEach(function (item) {
                vendor.append('<option value="'
                    + item.id_vendor
                    + '">' + item.vendor.toUpperCase() + '</option>');
            });

        }, "json");
    }

</script>
