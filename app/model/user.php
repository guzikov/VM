<?php
class User{
    private $db;

    public function __construct()
    {
//        Connecting model to DB
        $this->db = new Database();
    }

//    User Registration function
    public function register($data){
        $this->db->query("INSERT INTO users (email, name, password, phone, position, company, city, address)
                              VALUES (:email, :name, :password, :phone, :position, :company, :city, :address)");
        $this->db->bind(':email', $data['email']);
        $this->db->bind(':name', $data['name']);
        $this->db->bind(':password', $data['password']);
        $this->db->bind(':phone', $data['phone']);
        $this->db->bind(':position', $data['position']);
        $this->db->bind(':company', $data['company']);
        $this->db->bind(':city', $data['city']);
        $this->db->bind(':address', $data['address']);
        if ($this->db->execute())
            return true;
        else return false;
    }

//    Find USER by EMAIL
    public function findUserByEmail($email){
        $this->db->query("SELECT * FROM users WHERE email = :email");
        $this->db->bind(':email', $email);
        $this->db->single();

        if ($this->db->countRow() > 0)
            return true;
        else return false;
    }

//    Login User
    public function login($email, $password){
        $this->db->query("SELECT * FROM users WHERE email = :email");
        $this->db->bind(':email', $email);
        $row = $this->db->single();

        $hash_password = $row->password;
        if (password_verify($password, $hash_password))
            return $row;
        else
            return false;
    }

}