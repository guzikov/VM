<?php
/**
 * Created by PhpStorm.
 * User: guzepp
 * Date: 25.07.2018
 * Time: 19:42
 */

class request
{
    private $db;
    public $last;

    public function __construct()
    {
        $this->db = new Database();
    }

    public function sendRequest($id_user = null, $modelData, $equipment = null, $userData = null){
        // Запись информации о заказе в БД
        $sqlOrder = "INSERT INTO orders (id_user) VALUES (:id_user)";

        $this->db->query($sqlOrder);
        $this->db->bind(':id_user', $id_user);
        $this->db->execute();

        // Определение ID записанного заказа
        $orderId = $this->db->lastInsert();

        //Внесение заявки о моделях приборов с пивязкой к номеру заказа
        foreach ($modelData as $number => $deviceData){

            $sqlService = "INSERT INTO orders_service (id_order, id_model, year, tightness, clear_agent, defect)
                       VALUES (:id_order, :id_model, :year, :tightness, :clear_agent, :defect)";

            $this->db->query($sqlService);
            $this->db->bind(':id_order', $orderId);
            $this->db->bind(':id_model', $deviceData['endo-model-'.$number]);
            $this->db->bind(':year', $deviceData['endo-year-'.$number]);
            $this->db->bind(':tightness', $deviceData['endo-tightness-'.$number]);
            $this->db->bind(':clear_agent', $deviceData['endo-cleanser-'.$number]);
            $this->db->bind(':defect', $deviceData['endo-defects-'.$number]);
            $this->db->execute();
        }

        // Внесение заявки на доп.оборудование, если есть в запросе

        if ($equipment != null){
            foreach ($equipment as $id){
                $sqlEquip = "INSERT INTO orders_equip (id_order, id_equip)
                       VALUES (:id_order, :id_equip)";

                $this->db->query($sqlEquip);
                $this->db->bind(':id_order', $orderId);
                $this->db->bind(':id_equip', $id);
                $this->db->execute();
            }
        }

        //Если пользователь не зарегистрирован, то вносим данные пользователя в таблицу users_unreg
        if ($id_user == null){
            $sqlUnregUser = "INSERT INTO users_unreg (id_user, email, name, phone, position, company, city, address, comment)
                             VALUES (:id_order, :email, :name, :phone, :position, :company, :city, :address, :comment)";
            $this->db->query($sqlUnregUser);
            $this->db->bind(':id_order', $orderId);
            $this->db->bind(':email', $userData['email']);
            $this->db->bind(':name', $userData['name']);
            $this->db->bind(':phone', $userData['phone']);
            $this->db->bind(':position', $userData['position']);
            $this->db->bind(':company', $userData['company']);
            $this->db->bind(':city', $userData['city']);
            $this->db->bind(':address', $userData['address']);
            $this->db->bind(':comment', $userData['comment']);
            $this->db->execute();

        }
    }

}