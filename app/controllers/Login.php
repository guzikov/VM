<?php
/**
 * Created by PhpStorm.
 * User: guzepp
 * Date: 21.05.2018
 * Time: 17:16
 */

class Login extends Controller
{
    public function __construct()
    {
        parent::__construct();

//        CALL user  MODEL
        $this->userModel = $this->Model('user');
    }

    public function index(){
        //        Check if it is a POST Request or not. If it is, validate the FORM and send data to DB
        if ($_SERVER['REQUEST_METHOD'] == 'POST'){
//            Чистим POST
            $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

            $this->data += [
                'email' => trim($_POST['email']),
                'password' => trim($_POST['password']),
                'email_err' => '',
                'password_err' => '',
            ];

//            Validate email
            if (empty($this->data['email']))
                $this->data['email_err'] = "Введите email";
            elseif (!$this->userModel->findUserByEmail($this->data['email'])){
                $this->data['email_err'] = "Пользователя с таким email не существует!";
            }

            //            Validate password
            if (empty($this->data['password']))
                $this->data['password_err'] = "Введите пароль!";

            //            LOGIN THE USER
            //            1. Check if all errors are empty
            if (empty($this->data['email_err']) && empty($this->data['password_err'])){
//                Check and set logged USER
                $loggedInUser = $this->userModel->login($this->data['email'], $this->data['password']);

                if ($loggedInUser){
                    // Create Session (loggedInUser is a row with User INFO)
                    self::createUserSession($loggedInUser);
                } else{
                    $this->data['password_err'] = "Неверный пароль!";
                    echo $this->View(strtolower(__CLASS__), $this->data);
                }
            }

            //        CALL the VIEW with DATA
            echo $this->View(strtolower(__CLASS__), $this->data);

        } else{
//                    IF NOT POST REQUEST CALL the VIEW with DATA
            echo $this->View(strtolower(__CLASS__), $this->data);
        }
    }

//CREATING USER SESSION
    private static function createUserSession($user){
        $_SESSION['id_user'] = $user->id_user;
        $_SESSION['email'] = $user->email;
        $_SESSION['name'] = $user->name;
        if ((int)$user->user_status === 1 || 2 || 3 || 4){
            $_SESSION['userStatus'] = $user->user_status;
            redirect('account');
        }
        else
            redirect('main');
    }

//    LOGOUT Func
    public function logout(){
        unset($_SESSION['id_user']);
        unset($_SESSION['email']);
        unset($_SESSION['name']);
        session_destroy();

        redirect('login');

    }

//    isLoggedIn
    public static function isLoggedIn(){
        if (isset($_SESSION['id_user']) && isset($_SESSION['email']))
            return true;
        else return false;
    }
}