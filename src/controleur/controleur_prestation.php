<?php
function actionPrestation($twig, $db){
    $prestation = new Prestation($db);

    if(isset($_POST['ajoutPres'])){
        $prestation->insert($_POST['libellePres']);
    }

    if(isset($_GET['idPresSup'])){

      $id= $_GET['idPresSup'];
        $prestation->delete($id);
    }

    $json = json_encode($prestation->select());



    $listePrestation = $prestation->select();
    echo $twig->render('prestation.html.twig', array("listePrestation"=> $listePrestation));
}