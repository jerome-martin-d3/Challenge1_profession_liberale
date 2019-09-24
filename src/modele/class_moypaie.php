<?php

Class MoyenPaiement{
    private $db;
    private $select;
    private $selectById;
    private $insert;
    private $delete;
    private $update;
    
    public function __construct($db) {
        $this->db = $db;
        $this->select = $db->prepare("SELECT * FROM paiement");
        $this->selectById = $db->prepare("SELECT * FROM paiement WHERE idPay = :id");
        $this->insert = $db->prepare("INSERT INTO paiement(libellePay) VALUES(:libelle)");
        $this->delete = $db->prepare("DELETE FROM paiement WHERE idPay = :id");
        $this->update = $db->prepare("UPDATE paiement set libellePay = :libelle WHERE idPay = :id");
    }
    
    public function select(){
        $this->select->execute();
        if($this->select->errorCode()!=0){
            print_r($this->select->errorInfo());
        }
        return $this->select->fetchAll();
    }
    
    public function selectById($id){
        $this->selectById->execute(array(":id"=>$id));
        if($this->selectById->errorCode()!=0){
            print_r($this->selectById->errorInfo());
        }
        return $this->selectById->fetch();
    }
    
    public function insert($libelle){
        $this->insert->execute(array(":libelle"=>$libelle));
        if($this->insert->errorCode()!=0){
            print_r($this->insert->errorInfo());
        }
    }
    
    public function delete($id){
        $this->delete->execute(array(":id"=>$id));
        if($this->delete->errorCode()!=0){
            print_r($this->delete->errorInfo());
        }
    }
    
    public function update($id, $libelle){
        $this->update->execute(array(":id"=>$id, ":libelle"=>$libelle));
        if($this->update->errorCode()!=0){
            print_r($this->update->errorInfo());
        }
    }
}