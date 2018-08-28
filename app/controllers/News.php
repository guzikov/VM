<?php
/**
 * Created by PhpStorm.
 * User: guzepp
 * Date: 21.05.2018
 * Time: 18:21
 */

class News extends Controller
{

    public function __construct()
    {
        parent::__construct();

    }

    public function index(){
        $this->data['breadcrumbs'] = $this->getBreadcrumbs($_SERVER['REQUEST_URI']);
        $this->data['news'] = $this->Model('newsmodel')->getNews();

        echo $this->View(__CLASS__, $this->data);
    }

    // Product Page

    public function article($param){
        // get current article
        $this->data['article'] = $this->Model('newsmodel')->getArticle($param);
        // get newsList for side bar
        $this->data['news'] = $this->Model('newsmodel')->getNewsList();

        //preparing breadcrumbs for current article
        $this->data['breadcrumbs'] = $this->getBreadcrumbs($_SERVER['REQUEST_URI'], null, $this->data['article']);

        echo $this->View('includes/news/news_article', $this->data);

    }

}

