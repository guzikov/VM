<?php
/**
 * Created by PhpStorm.
 * User: guzepp
 * Date: 10.07.2018
 * Time: 16:02
 */

class Endoscope
{
    private $db;

    public function __construct()
    {
        $this->db = new Database();
    }

    public function getEndoType(){
        $sql = "SELECT * FROM `endo_types` WHERE 1";
        $this->db->query($sql);
        return $this->db->resultSet();
    }

    public function getEndoVendor(){
        $sql = "SELECT * FROM `endo_vendors` WHERE 1";
        $this->db->query($sql);
        return $this->db->resultSet();
    }

    public function getEndoModel($type, $vendor){
        $sql = "SELECT * FROM `endo_models` WHERE type= :type AND vendor = :vendor ";
        $this->db->query($sql);
        $this->db->bind(':type', $type);
        $this->db->bind(':vendor', $vendor);
        return $this->db->resultSet();
    }
}