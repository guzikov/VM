<?php
/**
 * Created by PhpStorm.
 * User: guzepp
 * Date: 21.05.2018
 * Time: 17:16
 */

class Account extends Controller
{
    private $userStatus;

    public function __construct()
    {
        parent::__construct();

        if (!$this->data['sessionIsOpen']['status'] && !isset($_SESSION['userStatus'])){
            redirect('login');
        } else
            $this->userStatus = (int)$_SESSION['userStatus'];

        print_r($_SESSION);
        print_r($this->data);
    }

    public function index(){
        $this->data['accountMenu'] = $this->getAccountMenu($this->userStatus);
        echo $this->View(__CLASS__, $this->data);
    }

    public function users(){
        $this->data['usersInfo'] = $this->Model('profile')->getUsers();
        $this->data['accountMenu'] = $this->getAccountMenu($this->userStatus);

        echo $this->View(__CLASS__, $this->data);
    }

    public function questions(){
        $this->data['questions'] = $this->Model('profile')->getQuestions();

        // преобразуем кавычки в комментариях из кода в кавычки
        foreach ($this->data['questions'] as $question){
            $question->company = htmlspecialchars_decode($question->company, ENT_COMPAT);
            $question->comment = htmlspecialchars_decode($question->comment, ENT_COMPAT);
        }
        $this->data['accountMenu'] = $this->getAccountMenu($this->userStatus);

        echo $this->View(__CLASS__, $this->data);
    }

    public function orders(){
        $this->data['accountMenu'] = $this->getAccountMenu($this->userStatus);

        $this->data['orders'] = $this->Model('profile')->getOrders($_SESSION['id_user'], $this->userStatus);
        foreach ($this->data['orders'] as $order){
            $order->user->company = htmlspecialchars_decode($order->user->company, ENT_COMPAT);
        }

        echo $this->View(__CLASS__, $this->data);
    }

    private function getUsers(){

    }

    private function getAccountMenu($userStatus){
        $menu = [];

        if ($userStatus === 4){
            $menu['users'] = [
                'link' => URLROOT . '/account/users',
                'link_name' => "Пользователи"
            ];

            $menu['orders'] = [
                'link' => URLROOT . '/account/orders',
                'link_name' => 'Заказы'
            ];

            $menu['questions'] = [
                'link' => URLROOT . '/account/questions',
                'link_name' => 'Вопросы'
            ];

            $menu['profile'] = [
                'link' => URLROOT . '/account/profile',
                'link_name' => 'Профиль'
            ];
        } elseif ($userStatus === 1){
            $menu['orders'] = [
                'link' => URLROOT . '/account/orders',
                'link_name' => 'Заказы'
            ];

            $menu['profile'] = [
                'link' => URLROOT . '/account/profile',
                'link_name' => 'Профиль'
            ];
        }


        // Определяем текущую страницу
        $currentPage = $this->data['currentPage']['page'];
        // определяем активную ссылку
        if (array_key_exists($currentPage, $menu))
            $menu["{$currentPage}"]["link_active"] = "account-menu-active";

        return $menu;
    }
}