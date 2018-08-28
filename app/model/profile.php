<?php
/**
 * Created by PhpStorm.
 * User: guzepp
 * Date: 03.08.2018
 * Time: 13:41
 */

class Profile
{
    private $db;
    public function __construct()
    {
        $this->db = new Database();
    }

    public function getUsers(){
        $allUsers = [];
        $sql = "SELECT t1.id_user, t1.email, t1.name, t1.phone, t1.position, t1.company, t1.city, t1.address, t1.comment, t2.status
                FROM users AS t1
                LEFT JOIN user_status AS t2 ON t1.user_status = t2.id_user_status";
        $this->db->query($sql);
        $allUsers['registered'] = $this->db->resultSet();

        $sql_unreg = "SELECT t1.id_user, t1.email, t1.name, t1.phone, t1.position, t1.company, t1.city, t1.address, t1.comment
                FROM users_unreg AS t1
                WHERE 1";
        $this->db->query($sql_unreg);

        $allUsers['unregistered'] = $this->db->resultSet();
        return $allUsers;
    }

    public function getQuestions(){
        $sql = "SELECT * FROM questions WHERE 1";
        $this->db->query($sql);
        return $this->db->resultSet();
    }

    public function getOrders($userId, $userStatus = 1){
        $orders = [];

        if ($userStatus === 4){
            // Получаем перечень заказов
            $sql_order = "SELECT orders.* FROM orders WHERE 1";

            $this->db->query($sql_order);
            $orders = $this->db->resultSet();
        } elseif ($userStatus === 1){
            // Получаем перечень заказов
            $sql_order = "SELECT orders.* FROM orders WHERE id_user = :userId";
            $this->db->query($sql_order);
            $this->db->bind(":userId", $userId);
            $orders = $this->db->resultSet();
        }


        // получаем подробную информацию о приборах по каждому заказу
        foreach ($orders as $order){
            // запросы на сервис
            $sql_service = "SELECT service.id_model, 
                                    endo_types.type, 
                                    endo_vendors.vendor, 
                                    endo_models.model, 
                                    service.year, 
                                    service.tightness, 
                                    service.clear_agent, 
                                    service.defect 
                            FROM orders_service AS service 
                            LEFT JOIN endo_models ON endo_models.id_model = service.id_model
                            LEFT JOIN endo_types ON endo_types.id_type = endo_models.type
                            LEFT JOIN endo_vendors ON endo_vendors.id_vendor = endo_models.vendor
                            WHERE service.id_order = :order";
            $this->db->query($sql_service);
            $this->db->bind(':order', $order->id_order);
            $order->need_service = $this->db->resultSet();

            // запросы на оборудование
            $sql_equip = "SELECT orders_equip.id_equip, equip.name, cat.category_name, equip.part_number 
                          FROM orders_equip
                          LEFT JOIN equipment AS equip ON orders_equip.id_equip = equip.id_equipment
                          LEFT JOIN category AS cat ON equip.id_category = cat.id_category
                          WHERE orders_equip.id_order = :order";
            $this->db->query($sql_equip);
            $this->db->bind(':order', $order->id_order);
            $order->need_equipment = $this->db->resultSet();

            // Выборка информации о клиенте запроса
            // проверяем зарегистрирован ли пользователь
            if ($order->id_user == null){
                $sql_user = "SELECT id_user, name, company FROM users_unreg WHERE users_unreg.id_user = :order";
                $this->db->query($sql_user);
                $this->db->bind(':order', $order->id_order);
            } else {
                $sql_user = "SELECT users.id_user, users.name, users.company FROM users, orders WHERE users.id_user = :id_user";
                $this->db->query($sql_user);
                $this->db->bind(':id_user', $order->id_user);
            }

            $order->user = $this->db->single();

        }
        return $orders;

    }


}