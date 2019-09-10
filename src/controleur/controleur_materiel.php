<?php
function actionMateriel($twig, $db){
    $materiel = new Materiel($db);
    
    if(isset($_POST['ajoutMat'])){
        $materiel->insert($_POST['nomMat'], $_POST['comMat']);
    }
    
    $listeMateriel = $materiel->select();
    echo $twig->render('materiel.html.twig', array("listeMateriel"=> $listeMateriel));
}