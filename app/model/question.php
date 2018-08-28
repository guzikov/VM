<?php
class Question
{
    private $db;

    public function __construct()
    {
        $this->db = new Database();
    }

    public function setQuestionData($data){
        $sql = "INSERT INTO questions (email, name, phone, position, company, city, address, comment)
                VALUES (:email, :name, :phone, :position, :company, :city, :address, :comment)";
        $this->db->query($sql);
        foreach ($data as $param => $value){
            $this->db->bind(':'.$param, $value);
        }
        $this->db->execute();
    }
}