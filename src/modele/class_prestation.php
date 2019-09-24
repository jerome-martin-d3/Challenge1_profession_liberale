<?php
Class Prestation{
    private $db;
    private $select;
    private $insert;
    private $delete;

    public function __construct($db){
        $this->db = $db;
        $this->select = $db->prepare("select * FROM prestation");
        $this->insert = $db->prepare("insert into prestation (libellePres) VALUES(:libellePres) ");
        $this->delete = $db->prepare("delete from prestation WHERE idPres = :id");
    }

    public function select(){
        $this->select->execute();
        if($this->select->errorCode()!=0){
            print_r($this->select->errorinfo());
        }
        return $this->select->fetchAll();
    }
    public function insert($libellePres){
        $this->insert->execute(array(":libellePres"=>$libellePres));
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
