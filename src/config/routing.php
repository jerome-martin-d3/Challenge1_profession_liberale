<?php
function getPage($db){
 $lesPages['accueil'] = "actionAccueil;0";
 $lesPages['materiel']="actionMateriel;0";
 $lesPages['agenda']="actionAgenda;0";
 $lesPages['exportAgenda']="actionExportAgenda;0";
 $lesPages['rdv']="actionRdv;0";
 $lesPages['consultation']="actionConsultation;0";
 $lesPages['activite']="actionActivite;0";
 $lesPages['gestionMoyPaie'] = "actionMoyPaie;0";
 
 if ($db!=null){
    if(isset($_GET['page'])){
        $page = $_GET['page']; }
    else{
        $page = 'accueil';
    }
    if (!isset($lesPages[$page])){
        $page = 'accueil'; 
    }
    $explose = explode(";",$lesPages[$page]);
    $role = $explose[1]; 
    if ($role != 0){
        if(isset($_SESSION['login'])){  
            if(isset($_SESSION['role'])){  
                if($role!=$_SESSION['role']){  
                    $contenu = 'actionAccueil'; 
                }
                else{
                    $contenu = $explose[0]; 
                }
            } 
            else{
                $contenu = 'actionAccueil';   
            }
        }
        else{
            $contenu = 'actionAccueil';  
        }
    }else{
        $contenu = $explose[0];
    }
}
else{
   // Si $db est null
   $contenu = 'actionMaintenance'; 
}
return $contenu; 
}
?>

