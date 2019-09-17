<?php
Class Prise_rdv{
    private $db;
    private $select;
    private $insert;
    private $delete;
    private $selectById;
    
    public function __construct($db){
        $this->db = $db;
        $this->select = $db->prepare("select * FROM consultation");
        $this->insert = $db->prepare("insert into consultation (datePres, heurePres,montantPay,idClient,idPres,idPay) VALUES(:datePres, :heurePres, :montantPay, :idClient, :idClient, :idPres, :idPay) ");
        $this->selectById = $db->prepare("select id,datePres, heurePres, montantPay,idClient,idPres,idPay from consultation where id=:id ");
        $this->delete = $db->prepare("DELETE FROM consultation WHERE id = :id");
    }
    
    public function select(){
        $this->select->execute();
        if($this->select->errorCode()!=0){
            print_r($this->select->errorinfo());
        }
        return $this->select->fetchAll();
    }
    public function insert($datePres, $heurePres, $montantPay, $idClient,$idPres, $idPay){
        $this->insert->execute(array(":datePres"=>$datePres,":heurePres"=>$heurePres, ":montantPay"=>$montantPay, ":idClient"=>$idClient, ":idPres"=>$idPres, ":idPay"=>$idPay));
        if($this->insert->errorCode()!=0){
            print_r($this->insert->errorinfo());
        }
    }
    
        public function selectById($id) {
        $this->selectById->execute(array(':id' => $id));
        if ($this->selectById->errorCode() != 0) {
            print_r($this->selectById->errorInfo());
        }
        return $this->selectById->fetch();
    }
    
    public function delete($id){
        $this->delete->execute(array(":id"=>$id));
        if($this->delete->errorCode()!=0){
            print_r($this->delete->errorinfo());
        }
    }
}
