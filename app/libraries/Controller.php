<?php
/**
 * MAIN CONTROLLER
 * Created by PhpStorm.
 * User: guzepp
 * Date: 21.05.2018
 * Time: 16:39
 */

class Controller{
    protected $data;

    public function __construct()
    {
        if (isset($_SESSION['id_user']) && isset($_SESSION['userStatus'])){
            $this->data['sessionIsOpen'] = ['status' => true];
        } else{
            $this->data['sessionIsOpen'] = ['status' => false];
        }

        $this->data['URLROOT'] = URLROOT;
        $this->data['SITE_TITLE'] = SITENAME;
//        $this->data['currentPage'] = array('page' => strtolower(get_class($this)));
        $this->data['currentPage'] = array('page' => strtolower($this->getCurrentPage()));
        $this->data['menu'] = $this->getNavigationBlock(strtolower(get_class($this)));
        $this->data['loginMenu'] = $this->getLoginMenu();
        $this->data['menuFooter'] = $this->getFooter();
    }

    /**
     * MODEL LOADER
     * @param $model
     * @return mixed
     */
    public function Model($model){
//        connect the model file
        require_once ('../app/model/' . $model . '.php');
//        create new model
        return new $model;
    }

    /**
     * VIEW LOADER
     * @param $view
     * @param array $data
     * @throws Twig_Error_Loader
     * @throws Twig_Error_Runtime
     * @throws Twig_Error_Syntax
     */
    public function View($view, $data = []){
//        Load Twig
        $loader = new Twig_Loader_Filesystem('../app/views');
        $twig = new Twig_Environment($loader);

//        Check if the view file exists
        if (file_exists('../app/views/' . $view . '.tpl')){
            return $twig -> load($view . '.tpl') -> render($data);
        }

        else
            die('The View file does not exist');
    }

    /**
     * GET MAIN MENU
     * @param null $page
     * @return array
     */
    protected function getNavigationBlock($page = null){
        $page = strtolower($page);
        $pageMenu =[];

        switch ($page){
                case 'footer':
                    // Собираем меню футера
                    $pageMenu["gastro"] = ["link" => URLROOT."/service/gastro", "link_name" => "Гастроскопы"];
                    $pageMenu["about"] = ["link" => URLROOT."/service/colono", "link_name" => "Колоноскопы"];
                    $pageMenu["service"] = ["link" => URLROOT."/service/broncho", "link_name" => "Бронхоскопы"];
                    $pageMenu["news"] = ["link" => URLROOT."/service/duodeno", "link_name" => "Дуодэноскопы"];
                    $pageMenu["shop"] = ["link" => URLROOT."/service/hard", "link_name" => "Жесткие эндоскопы"];
                    break;
                default:
                    // Собираем основное меню
                    $pageMenu["main"] = ["link" => URLROOT, "link_name" => "Главная"];
                    $pageMenu["about"] = ["link" => URLROOT."/about", "link_name" => "О нас"];
                    $pageMenu["service"] = ["link" => URLROOT."/service", "link_name" => "Сервис"];
                    $pageMenu["news"] = ["link" => URLROOT."/news", "link_name" => "Новости"];
                    $pageMenu["shop"] = ["link" => URLROOT."/shop", "link_name" => "Продукция"];
                    $pageMenu["contacts"] = ["link" => URLROOT."/contacts", "link_name" => "Контакты"];
                    if (array_key_exists($page, $pageMenu))
                        $pageMenu[$page]["link_active"] = "navigation__menu_active";
            }
        return $pageMenu;
    }

    /**
     * GET FOOTER MENU
     * @return mixed
     */
    protected function getFooter($page = 'footer')
    {
        return $this->getNavigationBlock($page);
    }

    /**
     * GET LOGIN MENU
     * @return mixed
     */
    protected function getLoginMenu()
    {
        // Определяем текущую страницу
        $currentPage = explode("/",$_SERVER['REQUEST_URI']);
        $currentPage = array_pop($currentPage);

        $this->data['menu'] = $this->getNavigationBlock(strtolower(get_class($this)));
        if ($this->data['sessionIsOpen']['status']) {
            $topLinks['userName'] = $_SESSION['name'];
            $topLinks['logout'] = URLROOT . "/login/logout";
            $topLinks['profileLinks']['order'] = [
                "link" => URLROOT."/order",
                "link_name" => "ОНЛАЙН ЗАЯВКА",
                "class" => "ti-shopping-cart",
            ];
            $topLinks['profileLinks']['account'] = [
                "link" => URLROOT."/account",
                "link_name" => "ЛИЧНЫЙ КАБИНЕТ",
                "class" => "ti-user",
            ];
            // определяем активную ссылку
            if (array_key_exists($currentPage, $topLinks['profileLinks']))
                $topLinks['profileLinks']["{$currentPage}"]["link_active"] = "navigation__menu_active";
        }
        else {
            // Собираем ссылки линии регистрации
            $topLinks["login"] = ["link" => URLROOT."/login", "link_name" => " Войти в личный кабинет", "class" => "ti-key"];
            $topLinks["register"] = ["link" => URLROOT."/register", "link_name" => " Регистрация", "class" => "ti-pencil-alt"];
            $topLinks["order"] = ["link" => URLROOT."/order", "link_name" => " ОНЛАЙН ЗАЯВКА", "class" => "ti-shopping-cart"];
            // определяем активную ссылку
            if (array_key_exists($currentPage, $topLinks))
                $topLinks["{$currentPage}"]["link_active"] = "navigation__menu_active";
        }
        return $topLinks;
    }

    /**
     * get BREADCRUMBS
     * @param $url
     * @return array for template
     */
    protected function getBreadcrumbs($url, $category = null, $item = null){
        $breadcrumbs = [];
        $url = explode('/', $url);
        array_shift($url);

        // Check if it shop/service page or not
        if ((!is_null($category) && $url[1] != 'shop') ||
            (!empty($url[2]) && $url[2] == 'catalog') ||
            (!empty($url[2]) && $url[2] == 'article'))
                array_pop($url);

        foreach ($url as $key => $value){
            if ($key == 0)
                $breadcrumbs[$key] = ['link' => URLROOT, 'link_name' => 'Главная'];
            else {
                switch ($value){
                    case 'shop':
                        $breadcrumbs[$key] = ['link' => URLROOT . '/' . $value, 'link_name' => 'Продукция'];
                        break;
                    case 'order':
                        $breadcrumbs[$key] = ['link' => URLROOT . '/' . $value, 'link_name' => 'Онлайн заявка'];
                        break;
                    case 'catalog':
                        $breadcrumbs[$key] = ['link' => URLROOT . '/' . $value . '/' . $category->id_category,
                            'link_name' => $category->category_name];
                        break;
                    case 'about':
                        $breadcrumbs[$key] = ['link' => URLROOT . '/' . $value, 'link_name' => 'О нас'];
                        break;
                    case 'service':
                        $breadcrumbs[$key] = ['link' => URLROOT . '/' . $value, 'link_name' => 'Сервис'];
                        break;
                    case 'product':
                        if ($url[1] != 'shop')
                            $breadcrumbs[$key] = ['link' => URLROOT . '/' . $category->id, 'link_name' => $category->name];
                        else
                            $breadcrumbs[$key] = ['link' => URLROOT . '/shop/catalog/' . $category->id, 'link_name' =>
                                $category->name];
                        break;
                    case (!is_null($item) && isset($item->id_equipment)):
                        $breadcrumbs[$key] = ['link' => URLROOT . '/shop/product' . $item->id_equipment, 'link_name' =>
                            $item->name];
                        break;
                    case 'news':
                        $breadcrumbs[$key] = ['link' => URLROOT . '/' . $value, 'link_name' => 'Новости'];
                        break;
                    case 'article':
                        $breadcrumbs[$key] = ['link' => URLROOT . '/news/article' . $item->id_news, 'link_name' =>
                            $item->title];
                        break;
                }
                if ($key == count($url) - 1)
                    $breadcrumbs[$key]['active'] = 'active';
                else
                    $breadcrumbs[$key]['active'] = 'passive';
            }
        }
        return $breadcrumbs;
    }

    protected function getCurrentPage(){
        $currentPage = explode("/",$_SERVER['REQUEST_URI']);
        return array_pop($currentPage);
    }
}