<?php
/**
 * Created by PhpStorm.
 * User: guzepp
 * Date: 21.05.2018
 * Time: 18:21
 */

class Service extends Controller
{

    public function __construct()
    {
        parent::__construct();

        if (!isset($this->data['serviceList'])){
            $this->data['serviceList'] = $this->Model('goods')->getServiceList('all');
            // adding links to each service item
            foreach ($this->data['serviceList'] as $serviceItem)
                $serviceItem->href = URLROOT . '/service/product/' . $serviceItem->id;
        }
    }


    public function index(){
        $this->data['breadcrumbs'] = $this->getBreadcrumbs($_SERVER['REQUEST_URI']);

        echo $this->View(__CLASS__, $this->data);
    }

    // Product Page

    public function product($param){
        // get current service item
        $currentItem = $this->data['service'] = $this->Model('goods')->getServiceItem($param);

        //preparing breadcrumbs for current service item

        $this->data['breadcrumbs'] = $this->getBreadcrumbs($_SERVER['REQUEST_URI'], $currentItem);

        // make it active

        foreach ($this->data['serviceList'] as $currentService){
            if ($currentService->id == $this->data['service']->id)
                $currentService->active = 'active';
        }

        echo $this->View('includes/service/service_product_page', $this->data);
    }

}

