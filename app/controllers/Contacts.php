<?php
/**
 * Created by PhpStorm.
 * User: guzepp
 * Date: 21.05.2018
 * Time: 18:21
 */

class Contacts extends Controller
{

    public function __construct()
    {
        parent::__construct();
    }


    public function index(){
        echo $this->View(__CLASS__, $this->data);
    }

    public function askQuestion(){
        if (!empty($_POST['check']))
            die("SPAM!");
        else{
            $definition = [
                "company" => FILTER_SANITIZE_STRING,
                "city" => FILTER_SANITIZE_STRING,
                "address" => FILTER_SANITIZE_STRING,
                "name" => FILTER_SANITIZE_STRING,
                "position" => FILTER_SANITIZE_STRING,
                "phone" => FILTER_SANITIZE_NUMBER_INT,
                "email" => FILTER_SANITIZE_EMAIL,
                "comment" => FILTER_SANITIZE_STRING
            ];
            $result = filter_input_array(INPUT_POST, $definition);
            $result = array_map('trim', $result);
            $this->Model('question')->setQuestionData($result);
            $this->sendMail($result);
        }
    }

    private function sendMail($data){
        $mailSMTP = new SendMailSmtpClass('backbox7@yandex.ru', 'serjermen', 'ssl://smtp.yandex.ru', 465,
            "UTF-8");

        $from = array(
            "Vertex Medical",
            "robot@vertexmedical.ru"
        );

        $to = 'sguzikov@gmail.com,backbox7@yandex.ru';
        $message = "Test5 new version with HTML <b>this is in bold</b> <p>and this is new paragraph</p>";
        $message .= "<br><hr><br>Компания: " . $data['company']."<br>";
        $message .= "Город: " . $data['city']."<br>";
        $message .= "Адрес: " . $data['address']."<br>";
        $message .= "ФИО: " . $data['name']."<br>";
        $message .= "Должность: " . $data['position']."<br>";
        $message .= "Тел: " . $data['phone']."<br>";
        $message .= "Email: " . $data['email']."<br>";
        $message .= "Вопрос: " . $data['comment']."<br>";

        $result =  $mailSMTP->send($to, 'Vertex!', $message, $from);

        if($result === true){
            echo "Письмо успешно отправлено";
        }else{
            echo "Письмо не отправлено. Ошибка: " . $result;
        }
    }

}

