<?php
function actionConsultation($twig, $db){
    $consultation = new Consultation($db);
    
    if(isset($_POST['Valider'])){
        $consultation->insert($_POST['datePres'], $_POST['heurePres'], $_POST['montantPay'], $_POST['idClient'], $_POST['idPres'], $_POST['idPay']);
    }
    
    $listeConsultation = $consultation->select();
    echo $twig->render('consultation.html.twig', array("listeConsultation"=> $listeConsultation));
}
