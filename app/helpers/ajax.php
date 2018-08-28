<?php
/**
 * Created by PhpStorm.
 * User: guzepp
 * Date: 22.06.2018
 * Time: 11:56
 */

function is_ajax_request(){
    return isset($_SERVER['HTTP_X_REQUESTED_WITH']) &&
        $_SERVER['HTTP_X_REQUESTED_WITH'] == 'XMLHttpRequest';
}