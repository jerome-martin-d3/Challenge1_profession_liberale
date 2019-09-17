<?php

require_once 'controleur_index.php';
require_once 'controleur_materiel.php';


function photo(){
            $photo=NULL;      
        if(isset($_FILES['photo'])){
            if(!empty($_FILES['photo']['name'])){
                $extensions_ok = array('png', 'gif', 'jpg', 'jpeg');
                $taille_max = 500000;
                $dest_dossier = '/var/www/html/prof_liberale/web/img/';
                if( !in_array( substr(strrchr($_FILES['photo']['name'], '.'), 1), $extensions_ok ) ){
                    echo 'Veuillez sélectionner un fichier de type png, gif ou jpg !';
                    }else{
                        if( file_exists($_FILES['photo']['tmp_name'])&& (filesize($_FILES['photo']['tmp_name'])) >  $taille_max){
                            echo 'Votre fichier doit faire moins de 500Ko !';                
                        }else{
                            $photo = basename($_FILES['photo']['name']);// enlever les accents
                            $photo=strtr($photo,'ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëìíîïðòóôõöùúûüýÿ','AAAAAACEEEEIIIIOOOOOUUUUYaaaaaaceeeeiiiioooooouuuuyy');// remplacer les caractères autres que lettres, chiffres et point par
                            $photo = preg_replace('/([^.a-z0-9]+)/i', '_', $photo);// copie du fichier                
                            move_uploaded_file($_FILES['photo']['tmp_name'], $dest_dossier.$photo); 
                        }  
                    } 
                }
        }
}