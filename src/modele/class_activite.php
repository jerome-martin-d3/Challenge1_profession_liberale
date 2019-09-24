<?php
Class Activite{
    private $db;
    private $select;
    private $insert;
    private $delete;

    public function __construct($db){
        $this->db = $db;
        $this->select = $db->prepare("select * FROM activite");
        $this->insert = $db->prepare("insert into activite (nomAct, descAct) VALUES(:nomAct, :descAct) ");
        $this->delete = $db->prepare("delete from activite WHERE idAct = :id");
    }

    public function select(){
        $this->select->execute();
        if($this->select->errorCode()!=0){
            print_r($this->select->errorinfo());
        }
        return $this->select->fetchAll();
    }
    public function insert($nomAct, $descAct){
        $this->insert->execute(array(":nomAct"=>$nomAct, ":descAct"=>$descAct));
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
