<?php
/**
 * Created by PhpStorm.
 * User: guzepp
 * Date: 21.05.2018
 * Time: 18:21
 */

class Shop extends Controller
{

    public function __construct()
    {
        parent::__construct();

        $this->data['Categories'] = $this->Model('goods')->getCategories();

    }


    public function index(){

        redirect('shop/catalog/all');
    }

    // View choosed type of goods in catalog (AJAX)

    public function catalog($params){

        // Create an ALL GOODS Category (no such in DB)

        $allGoodsCategory = new stdClass();
        $allGoodsCategory->id_category = 'all';
        $allGoodsCategory->category_name = 'Все товары';
        array_unshift($this->data['Categories'], $allGoodsCategory);

        // Define current(active category)

        if ($params == 'all'){
            $currentCat = $allGoodsCategory;
        } else
            $currentCat = $this->Model('goods')->getCategories($params)[0];

        // Set html class for active category

        foreach ($this->data['Categories'] as $value){
            if ($value == $currentCat)
                $value->active = 'activeCat';
        }

        $this->data['itemList'] = $this->Model('goods')->getCatalog($params);
        $this->data['breadcrumbs'] = $this->getBreadcrumbs($_SERVER['REQUEST_URI'], $currentCat);

        if (!is_ajax_request())
            echo $this->View(__CLASS__, $this->data);
        else
            echo $this->View('includes/shop/shop_ajax_block', $this->data);

    }

    // add to Basket Method (AJAX)

    public function addToBasket(){

        if (!is_ajax_request())
            die('Wrong request');
        else {
            if (isset($_POST['id_item']))
                if (isset($_SESSION['id_user']))
                    $this->Model('goods')->addToBasket($_POST['id_item'], $_SESSION['email'], $_SESSION['id_user']);
                else
                    $_SESSION['id_items'][] = $_POST['id_item'];
        }
    }

    // Product Page

    public function product($param){

        // get current item
        $currentItem = $this->data['product'] = $this->Model('goods')->getProduct($param);
        // het current item category
        $currentCat = new stdClass();
        $currentCat->id = $currentItem->id_category;
        $currentCat->name = $currentItem->category_name;
        // preparing breadcrumbs for current item and item category
        $this->data['breadcrumbs'] = $this->getBreadcrumbs($_SERVER['REQUEST_URI'], $currentCat, $currentItem);

        echo $this->View('includes/shop/shop_product', $this->data);

    }

}

