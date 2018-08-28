<?php
/**
 * Created by PhpStorm.
 * User: guzepp
 * Date: 21.05.2018
 * Time: 17:16
 */

class Main extends Controller
{
    public function __construct()
    {
        parent::__construct();
    }

    public function index(){
        //Получаем информацию о сервисах, для отображения на главной странице
        if (!isset($this->data['serviceList'])){
            $this->data['serviceList'] = $this->Model('goods')->getServiceList('all');
            // adding links to each service item
            foreach ($this->data['serviceList'] as $serviceItem)
                $serviceItem->href = URLROOT . '/service/product/' . $serviceItem->id;
        }

        echo $this->View(__CLASS__, $this->data);
    }

}