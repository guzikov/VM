<?php
/**
 * Created by PhpStorm.
 * User: guzepp
 * Date: 21.05.2018
 * Time: 17:16
 */

class Admin extends Controller
{
    public function __construct()
    {
        parent::__construct();

    }

    public function index(){


//        if (isset($_SESSION['email'])){
//            $goodsItems = $this->Model('goods')->getBasketList($_SESSION['email']);
//            $this->data['itemList'] = $goodsItems;
//
//        }
//        elseif (isset($_SESSION['id_items'])) {
//            $goodsItems = $this->Model('goods')->getBasketListNoUser($_SESSION['id_items']);
//            $this->data['itemList'] = $goodsItems;
//            print_r($goodsItems);
//        }

        echo $this->View(__CLASS__, $this->data);
    }

}