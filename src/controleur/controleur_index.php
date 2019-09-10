<?php
function actionAccueil($twig){
 echo $twig->render('index.html.twig', array());
} 
function actionMateriel($twig){
    echo $twig->render('materiel.html.twig', array());
}
function actionAgenda($twig){
    echo $twig->render('prestation_prevue.html.twig', array());
}
function actionRdv($twig){
    echo $twig->render('prise_rdv.html.twig', array());
}
function actionMaintenance($twig){
    echo $twig->render('maintenance.html.twig', array());
}
?>