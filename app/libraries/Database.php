<?php
/**
 * PDO Database Class
 * Created by PhpStorm.
 * User: guzepp
 * Date: 21.05.2018
 * Time: 21:50
 */

class Database
{
    private $host = DB_HOST;
    private $dbname = DB_NAME;
    private $user = DB_USER;
    private $pass = DB_PASS;

    private $dbh; //Database handler
    private $stmt;
    private $error;

    public function __construct()
    {
//        Setting DNS
        $dsn = 'mysql:host=' . $this->host . "; dbname=" . $this->dbname;
        $options = array(
            PDO::ATTR_PERSISTENT => true,
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
        );

//        Creating PDO instance and catching the exceptions

        try{
            $this->dbh = new PDO($dsn, $this->user, $this->pass, $options);
        } catch (PDOException $e){
            $this->error = $e->getMessage();
            echo $this->error;
        }
    }

//    Prepare statement with query
    public function query($sql){
        $this->stmt = $this->dbh->prepare($sql);
    }

//    Bind parameters
    public function bind($param, $value, $type = null){
        if (is_null($type)){
            switch (true){
                case is_int($value):
                    $type = PDO::PARAM_INT;
                    break;
                case is_bool($value):
                    $type = PDO::PARAM_BOOL;
                    break;
                case is_null($value):
                    $type = PDO::PARAM_NULL;
                    break;
                default:
                    $type = PDO::PARAM_STR;
            }
        }
        $this->stmt->bindValue($param, $value, $type);
    }
//    Execute the prepared statement
    public function execute(){
        return $this->stmt->execute();
    }

// Get result set as array of objects
    public function resultSet(){
        $this->execute();
        return $this->stmt->fetchAll(PDO::FETCH_OBJ);
    }

//    Get Single resulr
    public function single(){
        $this->execute();
        return $this->stmt->fetch(PDO::FETCH_OBJ);
    }

//    Get COUNT row
    public function countRow(){
        return $this->stmt->rowCount();
    }

//  Get last_insert_id
    public function lastInsert(){
        return $this->dbh->lastInsertId();
    }

}