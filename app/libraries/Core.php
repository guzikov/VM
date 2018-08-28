<?php
class Core{
    protected $currentController = "Main";
    protected $currentMethod = "index";
    protected $params = [];

    public function __construct()
    {
        $url = $this->getUrl();

//        Check for the controller file
        if (file_exists("../app/controllers/" . ucwords($url[0]) . ".php")){ //Controller name starts with CAP letter
            $this->currentController = ucwords($url[0]);
            unset($url[0]);
        }
//      Require the controller file
        require_once ("../app/controllers/" . $this->currentController . ".php");
//      Create the instance of the controller class from required file
        $this->currentController = new $this->currentController($this->currentController);

//        Check for method of controller
        if (isset($url[1])){
            if (method_exists($this->currentController, $url[1]))
                $this->currentMethod = $url[1];
            unset($url[1]);
        }
//
//        Check for the params of the method
        $this->params = $url ? array_values($url) : [];
//      Call the Controllers method with params

        if (isset($this->currentMethod))
            call_user_func_array(array($this->currentController, $this->currentMethod), $this->params);

    }

    public function getUrl(){

        if (isset($_GET['url'])){
            $url = rtrim($_GET['url'], "/");// delete last right slash
            $url = filter_var($url, FILTER_SANITIZE_URL); // delete all the characters which shouldn't be in URL
            $url = explode("/", $url); //put URL to the array
            return $url; //returns the URL array: controller/method/params
        }

    }
}

