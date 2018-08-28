<?php
/**
 * Created by PhpStorm.
 * User: guzepp
 * Date: 21.05.2018
 * Time: 17:16
 */

class Order extends Controller
{
    public function __construct()
    {
        parent::__construct();
    }

    public function index(){
        $this->getEquipmentList();
        echo $this->View(__CLASS__, $this->data);
    }

    private function getEquipmentList(){
        if ($this->data['sessionIsOpen']['status']){
            return $this->data['itemList'] = $this->Model('goods')->getCartList($_SESSION['id_user'], null);
        }
        elseif (isset($_SESSION['id_items'])) {
            return $this->data['itemList'] = $this->Model('goods')->getCartList(false, $_SESSION['id_items']);
        }
    }

    public function getEndoType(){
        echo json_encode($this->Model('endoscope')->getEndoType(), JSON_UNESCAPED_UNICODE);
    }

    public function getEndoVendor(){
        echo json_encode($this->Model('endoscope')->getEndoVendor(), JSON_UNESCAPED_UNICODE);
    }

    public function getEndoModel($type, $vendor){
        echo json_encode($this->Model('endoscope')->getEndoModel($type, $vendor), JSON_UNESCAPED_UNICODE);
    }

    public function sendOrder(){

        // 1. Определяем количество приборов в запросе и записываем их в отдельный массив
        $endoCount = 0;
        $endoscopes = [];

        // Validate and sanitize POST

        if (isset($_POST)){
            // копируем пост массив в переменную для обработки
            $postData = $_POST;
            //делаем trim данных
            foreach ($postData as $key => $value){
                $postData[$key] = trim($value);
            }

            // Подсчет количества приборов
            for ($i = 1; $i < count($postData); $i++) {
                $type = 'endo-type-' . $i;
                $vendor = 'endo-vendor-' . $i;
                $model = 'endo-model-' . $i;

                if (array_key_exists($type, $postData)
                    || array_key_exists($vendor, $postData)
                    || array_key_exists($model, $postData)) {
                    $endoCount++;
                }
            }

            if ($endoCount >= 1){
                // валидация и санитазация, формируем массив с моделями приборов
                for ($i = 1; $i <= $endoCount; $i++) {
                    $type = 'endo-type-' . $i;
                    $vendor = 'endo-vendor-' . $i;
                    $model = 'endo-model-' . $i;
                    $year = 'endo-year-' . $i;
                    $tightness = 'endo-tightness-' . $i;
                    $cleanser = 'endo-cleanser-' . $i;
                    $defects = 'endo-defects-' . $i;

                    // проверка обязательных полей
                    if (empty($postData[$type]) || empty($postData[$vendor]) || empty($postData[$model])){
                        die("Одна или несколько из обязательных переменных пуста!");
                    } else {
                        $definition = [
                            $type => FILTER_VALIDATE_INT,
                            $vendor => FILTER_VALIDATE_INT,
                            $model => FILTER_VALIDATE_INT,
                            $year => FILTER_VALIDATE_INT,
                            $tightness => FILTER_SANITIZE_STRING,
                            $cleanser => FILTER_SANITIZE_STRING,
                            $defects => FILTER_SANITIZE_STRING
                        ];

                        $endoscopes[$i] = filter_var_array($postData, $definition, true);
                    }
                }
            } else
                die("Не указана модель!");

            // проверка корзины на наличие доп оборудования к заказу
            $equipmentList = $this->getEquipmentList();
            $equipment = [];

            //Если запрос на оборудование не пуст, берем id товара
            if (!empty($equipmentList)){
                foreach ($equipmentList as $item){
                    $equipment[] = $item->id_equipment;
                }
            } else
                $equipment = null;

            // Запись в БД в зависимости от типа пользователя
            if($this->data['sessionIsOpen']['status']){
                $this->Model('request')->sendRequest($_SESSION['id_user'], $endoscopes, $equipment);
                $this->Model('goods')->emptyCart($_SESSION['id_user']);
            }
            else {
                $def = [
                    "company" => FILTER_SANITIZE_STRING,
                    "city" => FILTER_SANITIZE_STRING,
                    "address" => FILTER_SANITIZE_STRING,
                    "name" => FILTER_SANITIZE_STRING,
                    "position" => FILTER_SANITIZE_STRING,
                    "phone" => FILTER_SANITIZE_NUMBER_INT,
                    "email" => FILTER_SANITIZE_EMAIL,
                    "comment" => FILTER_SANITIZE_STRING
                ];
                $result = filter_var_array($postData, $def);

                // Save request data to DB
                $this->Model('request')->sendRequest(null, $endoscopes, $equipment, $result);
                unset($_SESSION['id_items'], $this->data['itemList'], $endoscopes, $equipmentList);
            }
        }
    }
}