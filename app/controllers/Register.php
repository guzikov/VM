<?php
/**
 * Created by PhpStorm.
 * User: guzepp
 * Date: 21.05.2018
 * Time: 17:16
 */

class Register extends Controller
{
    public function __construct()
    {
        parent::__construct();

//        Create the MODEL
        $this->userModel = $this->Model('user');

//        Check if it is a POST Request or not. If it is, validate the FORM and send data to DB

        if ($_SERVER['REQUEST_METHOD'] == 'POST'){
//            Чистим POST
            $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

            $this->data += [
                'name' => trim($_POST['name']),
                'email' => trim($_POST['email']),
                'password' => trim($_POST['password']),
                'confirm_pass' => trim($_POST['confirm_pass']),
                'email_err' => '',
                'name_err' => '',
                'password_err' => '',
                'confirm_pass_err' => '',
                'company' => trim($_POST['company']),
                'city' => trim($_POST['city']),
                'address' => trim($_POST['address']),
                'phone' => trim($_POST['phone']),
                'position' => trim($_POST['position']),
            ];

//            Validate email
            if (empty($this->data['email']))
                $this->data['email_err'] = "Введите email";
            elseif ($this->userModel->findUserByEmail($this->data['email'])){
                $data['email_err'] = "Пользователь с таким email уже существует!";

            }

            //            Validate name
            if (empty($this->data['name']))
                $this->data['name_err'] = "Введите имя";

            //            Validate password
            if (empty($this->data['password']))
                $this->data['password_err'] = "Введите пароль!";
            elseif (strlen($this->data['password']) < 6)
                $this->data['password_err'] = "Длина пароля должна быть не менее 6 симоволов!";

            //            Validate confirm password
            if (empty($this->data['confirm_pass']))
                $this->data['confirm_pass_err'] = "Введите подтверждение пароля";
            elseif ($this->data['confirm_pass'] != $this->data['password'])
                $this->data['confirm_pass_err'] = "Пароли не совпадают!";

            //            REGISTER THE USER
            //            1. Check if all errors are empty
            if (empty($this->data['email_err'])
                && empty($this->data['name_err'])
                && empty($this->data['password_err'])
                && empty($this->data['confirm_pass_err'])){

              //              2. Hash the password
                $this->data['password'] = password_hash($this->data['password'], PASSWORD_DEFAULT);

             //                3. Register USER and add to the DB

                if ($this->userModel->register($this->data))
                    redirect('login');
                else
                    die("Что-то пошло не так!");
            }

            //        Create VIEW
            echo $this->View(strtolower(__CLASS__), $this->data);
        }
    }

    public function index(){
        echo $this->View(__CLASS__, $this->data);
    }

}


