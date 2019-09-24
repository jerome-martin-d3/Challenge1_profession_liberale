<?php
function actionActivite($twig, $db){
    $activite = new Activite($db);

    if(isset($_POST['ajoutAct'])){
        $activite->insert($_POST['nomAct'], $_POST['descAct']);
    }

    if(isset($_GET['idActSup'])){

      $id= $_GET['idActSup'];
        $activite->delete($id);
    }

    $json = json_encode($activite->select());



    $listeActivite = $activite->select();
    echo $twig->render('activite.html.twig', array("listeActivite"=> $listeActivite));
}
