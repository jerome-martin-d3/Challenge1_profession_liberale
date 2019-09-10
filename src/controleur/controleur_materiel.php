<?php
function actionMateriel($twig, $db){
    $materiel = new Materiel($db);
    
    if(isset($_POST['ajoutMat'])){
        $materiel->insert($_POST['nomMat'], $_POST['comMat']);
    }
    if(isset($_GET['idMatSup'])){
        $materiel->delete($_GET['idMatSup']);
    }
    
    $listeMateriel = $materiel->select();
    echo $twig->render('materiel.html.twig', array("listeMateriel"=> $listeMateriel));
}