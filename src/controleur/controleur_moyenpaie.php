<?php

function actionMoyPaie($twig, $db){
    $moyen = new MoyenPaiement($db);
    if(isset($_POST['addMoy'])){
        $moyen->insert($_POST['libelle']);
    }
    if(isset($_GET['supMoy'])){
        $moyen->delete($_GET['supMoy']);
    }
    if(isset($_POST['editMoy'])){
        $moyen->update($_POST['editMoy'], $_POST['libelle']);
    }
    $listeMoyens["lesMoyens"] = $moyen->select();
     if(isset($_GET['editMoy'])){
        $listeMoyens["unMoy"] = $moyen->selectById($_GET['editMoy']);
    }
    
    echo $twig->render("gestionMoyPaie.html.twig", array("listeMoy"=>$listeMoyens));
}