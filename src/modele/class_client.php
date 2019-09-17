<?php
Class Client{
    private $db;
    private $select;
    private $insert;
    private $delete;
    private $selectById;
    private $update;
    
    public function __construct($db){
        $this->db = $db;
        $this->select = $db->prepare("select * from client");
        $this->insert = $db->prepare("insert into client (nomCli, prenomCli, dateNaissCli, adressCli, numCli) VALUES(:nomCli, :prenomCli, :dateNaissCli, :adressCli, :numCli) ");
        $this->delete = $db->prepare("DELETE FROM client WHERE idCli = :id");
        $this->selectById = $db->prepare("select * from client WHERE idCli = :id");
        $this->update = $db->prepare("update client set nomCli = :nomCli, prenomCli = :prenomCli, dateNaissCli = :dateNaissCli, adressCli = :adressCli, numCli = :numCli WHERE idCli = :id");   
    }
    
    public function select(){
        $this->select->execute();
        if($this->select->errorCode()!=0){
            print_r($this->select->errorInfo());
            
        }
        return $this->select->fetchAll();
    }
    public function insert($nomCli, $prenomCli, $dateNaissCli, $adressCli, $numCli){
        $this->insert->execute(array(":nomCli"=>$nomCli, ":prenomCli"=>$prenomCli, ":dateNaissCli"=>$dateNaissCli, ":adressCli"=>$adressCli, ":numCli"=>$numCli));
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
    public function selectById($id){
        $this->selectById->execute(array(":id"=>$id));
        if($this->selectById->errorCode()!=0){
            print_r($this->selectById->errorInfo());
        }
        return $this->selectById->fetch();
    }
    public function update($idCli, $nomCli, $prenomCli, $dateNaissCli, $adressCli, $numCli){
        $this->update->execute(array(":id"=>$idCli, ":nomCli"=>$nomCli, ":prenomCli"=>$prenomCli, ":dateNaissCli"=>$dateNaissCli, ":adressCli"=>$adressCli, ":numCli"=>$numCli));
        if($this->update->errorCode()!=0){
            print_r($this->update->errorInfo());
        }
    }
}