<?php
function actionAccueil($twig, $db){
    $client = new Client($db);
    if(isset($_POST['ajoutCli'])){
        $nomCli = $_POST['nomCli'];                 $prenomCli = $_POST['prenomCli'];
        $dateNaissCli = $_POST['dateNaissCli'];     $adressCli = $_POST['adressCli'];
        $numCli = $_POST['numCli'];
        
        $client->insert($nomCli, $prenomCli, $dateNaissCli, $adressCli, $numCli);
    }
    $listeClients = $client->select();

 echo $twig->render('index.html.twig', array("listeClients"=>$listeClients));
} 
function actionAgenda($twig){
    echo $twig->render('prestation_prevue.html.twig', array());
}
function actionExportAgenda($twig){
    $html = $twig->render('agendaPdf.html.twig', array());
    try{
        ob_end_clean(); // Permet d'envoyer aucune données avant le fichier PDF
        $html2pdf = new \Spipu\Html2Pdf\Html2Pdf('P','A4','fr'); // Création d'une page format A4 en français orienté en mode portrait
        $html2pdf->writeHTML($html); //Ecrit contenu résultat twig dans la variable html2pdf
        $html2pdf->output('Consultations_du_jour.pdf'); //Extrait la variable html2pdf en pdf sous le nom de listedesproduits.pdf.
    } catch (Html2PdfException $e) {
        echo 'erreur'.$e;
    }
    
}
function actionRdv($twig){
    echo $twig->render('prise_rdv.html.twig', array());
}
function actionMaintenance($twig){
    echo $twig->render('maintenance.html.twig', array());
}
?>