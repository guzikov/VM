<?php
/**
 * Created by PhpStorm.
 * User: guzepp
 * Date: 21.05.2018
 * Time: 22:00
 */

class Goods
{
    private $db;

    public function __construct()
    {
        $this->db = new Database();
    }

//    GET ALL SHOP PRODUCTS OR CURRENT CATEGORY ITEMS
    public function getCatalog($value){
        if ($value == 'all')
            $sql = "SELECT * FROM equipment WHERE 1";
        else
            $sql = "SELECT * FROM equipment WHERE equipment.id_category = :category";
        $this->db->query($sql);
        $this->db->bind(':category', $value);
        return $this->db->resultSet();
    }

    public function getCategories($id_category = null){
        if (is_null($id_category) || $id_category == 'all'){
            $sql = "SELECT * FROM category WHERE 1";
            $this->db->query($sql);
            return $this->db->resultSet();
        }
        else{
            $sql = "SELECT * FROM category WHERE id_category = :id_category";
            $this->db->query($sql);
            $this->db->bind(':id_category', $id_category);
            return $this->db->resultSet();
        }

    }

    public function getCartList($session, $data = null){
        // get goods list for unregistered user
        if ($session == false){
            $productList = [];
            foreach ($data as $key => $id_item){
                $sql = "SELECT id_equipment, file, name, price, description, category_name
                FROM equipment, category 
                WHERE  equipment.id_equipment =:id_item 
                AND equipment.id_category=category.id_category";

                $this->db->query($sql);
                $this->db->bind(':id_item', $id_item);

                $productList[] = $this->db->single();
            }
            return $productList;
        } else {
            // get goods list for registered
            $sql = "SELECT id_equipment, file, name, price, description, equipment.id_category, category_name, part_number
                FROM cart, equipment, category 
                WHERE cart.id_user = :session
                AND cart.id_item = equipment.id_equipment 
                AND equipment.id_category=category.id_category";
            $this->db->query($sql);
            $this->db->bind(':session', $session);
            return $this->db->resultSet();
        }
    }

    public function emptyCart($session){
        $sql = "DELETE FROM cart WHERE cart.id_user = :session";
        $this->db->query($sql);
        $this->db->bind(':session', $session);
        $this->db->execute();
    }

    // Add item to order of registered (logged in) user
    public function addToBasket($item, $email = 0, $user = 0){
            $sql = "INSERT INTO cart (id_item, email, quantity, id_user) 
                VALUES (:id_item, :email, +1, :id_user)";


        $this->db->query($sql);
        $this->db->bind(':email', $email);
        $this->db->bind(':id_item', $item);
        $this->db->bind(':id_user', $user);
        $this->db->execute();

    }

    //get exact ITEM (equipment) information
    public function getProduct($id_equipment){
        $sql = "SELECT * FROM equipment, category  
                WHERE equipment.id_equipment = :id_equipment
                AND equipment.id_category = category.id_category";

        $this->db->query($sql);
        $this->db->bind(':id_equipment', $id_equipment);
        return $this->db->single();
    }

    //    GET SERVICE LIST
    public function getServiceList($value){
        if ($value == 'all')
            $sql = "SELECT * FROM service_info WHERE 1";
        else
            $sql = "SELECT * FROM service_info WHERE service_info.id = :category";
        $this->db->query($sql);
        $this->db->bind(':category', $value);

        return $this->db->resultSet();
    }
    //get exact SERVICE information
    public function getServiceItem($id){
        $sql = "SELECT * FROM service_info WHERE service_info.id = :id";

        $this->db->query($sql);
        $this->db->bind(':id', $id);
        return $this->db->single();
    }

}