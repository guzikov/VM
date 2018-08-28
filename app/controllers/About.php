<?php
/**
 * Created by PhpStorm.
 * User: guzepp
 * Date: 21.05.2018
 * Time: 18:21
 */

class About extends Controller
{

    public function __construct()
    {
        parent::__construct();

        $this->data['breadcrumbs'] = $this->getBreadcrumbs($_SERVER['REQUEST_URI']);
    }


    public function index(){
        echo $this->View(__CLASS__, $this->data);
    }

}

