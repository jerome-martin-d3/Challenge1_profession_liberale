<?php
Class Materiel{
    private $db;
    private $select;
    private $insert;
    private $delete;
    
    public function __construct($db){
        $this->db = $db;
        $this->select = $db->prepare("select * FROM materiel");
        $this->insert = $db->prepare("insert into materiel (nomMat, comMat) VALUES(:nom, :desc) ");
        $this->delete = $db->prepare("DELETE FROM materiel WHERE idMat = :id");
    }
    
    public function select(){
        $this->select->execute();
        if($this->select->errorCode()!=0){
            print_r($this->select->errorinfo());
        }
        return $this->select->fetchAll();
    }
    public function insert($nomMat, $comMat){
        $this->insert->execute(array(":nom"=>$nomMat, ":desc"=>$comMat));
        if($this->insert->errorCode()!=0){
            print_r($this->insert->errorinfo());
        }
    }
    public function delete($id){
        $this->delete->execute(array(":id"=>$id));
        if($this->delete->errorCode()!=0){
            print_r($this->delete->errorinfo());
        }
    }
}