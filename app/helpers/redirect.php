<?php
/**
 * Created by PhpStorm.
 * User: guzepp
 * Date: 24.05.2018
 * Time: 17:54
 */

function redirect($page){
    header('Location: '. URLROOT . "/" . $page);
}