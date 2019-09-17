<?php
function actionConsultation($twig, $db){
    $consultation = new Consultation($db);
    
    if(isset($_POST['Valider'])){
        $materiel->insert($_POST['datePres'], $_POST['heurePres'], $_POST['montantPay'], $_POST['idClient'], $_POST['idPres'], $_POST['idPay']);
    }
    if(isset($_GET['idMatSup'])){
        $materiel->delete($_GET['idMatSup']);
    }
    
    $listeMateriel = $materiel->select();
    echo $twig->render('materiel.html.twig', array("listeMateriel"=> $listeMateriel));
}
