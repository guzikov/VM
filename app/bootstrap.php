<?php
/**
 * Файл предназначен для подключения и связи всех библиотек
 * Created by PhpStorm.
 * User: guzepp
 * Date: 21.05.2018
 * Time: 13:52
 */

// Load configuration file

require_once ('config/config.php');

//Load helpers
require_once ('helpers/redirect.php');
require_once ('helpers/session.php');
require_once ('helpers/ajax.php');
require_once ('helpers/SendMailSmtpClass.php');

//Autoload classes

spl_autoload_register(function ($className){
    require_once ('libraries/' . $className . '.php');
});


// Load TWIG

require_once ('vendor/autoload.php');
