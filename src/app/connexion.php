<?php
    function connect($config){
            try{
                $db = new PDO('mysql:host='.$config['serveur'].';dbname='.$config['bdLocal'],$config['loginLocal'],$config['mdpLocal']);
                
            }
            catch (Exception $e) {
                $db = NULL;
                
            }
        }
        return $db;
?>

