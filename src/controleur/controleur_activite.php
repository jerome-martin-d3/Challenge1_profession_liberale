<?php
function actionActivite($twig, $db){
    $activite = new Activite($db);
    
    if(isset($_POST['ajoutMat'])){
        $activite->insert($_POST['nomAct'], $_POST['descAct']);
    }

    
    
    $liste = $activite->select();
    echo $twig->render('activite.html.twig', array("liste"=> $liste));
}
