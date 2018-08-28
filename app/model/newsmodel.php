<?php
/**
 * Created by PhpStorm.
 * User: guzepp
 * Date: 21.05.2018
 * Time: 22:00
 */

class newsmodel
{
    private $db;

    public function __construct()
    {
        $this->db = new Database();
    }

//    GET NEWS
    public function getNews(){
        $sql = "SELECT news.*, users.id_user, users.name FROM news, users WHERE 1 AND news.user = users.id_user ORDER BY news.date DESC";
        $this->db->query($sql);
        return $this->db->resultSet();
    }
//    GET NEWS LIST FOR SIDE BAR (LAST 3 ARTICLES)
    public function getNewsList(){
        $sql = "SELECT * FROM news WHERE news.user IS NOT NULL ORDER BY date DESC LIMIT 3";
        $this->db->query($sql);
        return $this->db->resultSet();
    }

// GET current article

    public function getArticle($id_news){
        $sql = "SELECT * FROM news, users WHERE news.id_news = :id_news AND news.user = users.id_user";
        $this->db->query($sql);
        $this->db->bind(':id_news', $id_news);

        return $this->db->single();
    }


}