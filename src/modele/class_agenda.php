<?php
Class Agenda{
    private $db;
    private $select;
    private $selectByDate;
    
    public function __construct($db){
        $this->db = $db;
        $this->select = $db->prepare("  select *, DATE_FORMAT(datePres, '%d/%m/%Y') as dateRdv FROM consultation cons
                                        INNER JOIN client cli on cli.idCli = cons.idClient
                                        INNER JOIN prestation pres on pres.idPres = cons.idPres
                                        INNER JOIN paiement paie on cons.idPay = paie.idPay");
        $this->selectByDate = $db->prepare("    select * FROM consultation cons
                                                INNER JOIN client cli on cli.idCli = cons.idClient
                                                INNER JOIN prestation pres on pres.idPres = cons.idPres
                                                INNER JOIN paiement paie on cons.idPay = paie.idPay
                                                WHERE cons.datePres = :date");
        
        
    }
    
    public function select(){
        $this->select->execute();
        if($this->select->errorCode()!=0){
            print_r($this->select->errorInfo());
        }
        return $this->select->fetchAll();
    }
    public function selectByDate($date){
        $this->selectByDate->execute(array(":date"=>$date));
        if($this->selectByDate->errorCode()!=0){
            print_r($this->selectByDate->errorInfo());
        }
        return $this->selectByDate->fetchAll();
    }
}