<?php
function actionRdv($twig, $db){
    $client = new Client($db);
    $consultation = new Prise_rdv($db);
    $prestation = new Prestation($db);
    $activite = new Activite($db);
    $materiel = new Materiel($db);
  
    $clients = $client->select();
    if(isset($_POST['Valider'])){
        $consultation->insert($_POST['datePres'], $_POST['heurePres'], $_POST['montantPay'], $_POST['idClient'], $_POST['idPres'], $_POST['idPay']);
    }
    
    $prestations = $prestation->select();
    $activites = $activite->select();
    $materiels = $materiel->select();
  
    if(isset($_POST['infos_cli'])){
        $clients['unCli'] = $client->selectById($_POST['choixClient']);
    }else if(isset($_GET['idCli'])){
        $clients['unCli'] = $client->selectById($_GET['idCli']);
    }
  
    echo $twig->render('prise_rdv.html.twig', array("clients"=>$clients, "prestations"=>$prestations, "activites"=>$activites, "materiels"=>$materiels));
}