<?php
function actionRdv($twig, $db){
    $client = new Client($db);
    $consultation = new Consultation($db);
  
    $clients = $client->select();
    if(isset($_POST['Valider'])){
        $consultation->insert($_POST['datePres'], $_POST['heurePres'], $_POST['montantPay'], $_POST['idClient'], $_POST['idPres'], $_POST['idPay']);
    }
  
    if(isset($_POST['infos_cli'])){
        $clients['unCli'] = $client->selectById($_POST['choixClient']);
    }else if(isset($_GET['idCli'])){
        $clients['unCli'] = $client->selectById($_GET['idCli']);
    }
  
    echo $twig->render('prise_rdv.html.twig', array("clients"=>$clients));
}