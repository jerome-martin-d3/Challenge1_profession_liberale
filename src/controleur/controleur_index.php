<?php
function actionAccueil($twig, $db){
    $client = new Client($db);
    if(isset($_POST['ajoutCli'])){
        $nomCli = $_POST['nomCli'];                 $prenomCli = $_POST['prenomCli'];
        $dateNaissCli = $_POST['dateNaissCli'];     $adressCli = $_POST['adressCli'];
        $numCli = $_POST['numCli'];
        $client->insert($nomCli, $prenomCli, $dateNaissCli, $adressCli, $numCli);
    }
    if(isset($_GET['supCli'])){
        $client->delete($_GET['supCli']);
    }
    if(isset($_GET['modifCli'])){
        $listeClients['leClient'] = $client->selectById($_GET['modifCli']);
    }
    if(isset($_POST['modifCli'])){
        $idCli = $_POST['modifCli'];                    $nomCli = $_POST['nomCli'];                 
        $prenomCli = $_POST['prenomCli'];               $dateNaissCli = $_POST['dateNaissCli'];     
        $adressCli = $_POST['adressCli'];               $numCli = $_POST['numCli'];
        
        $client->update($idCli, $nomCli, $prenomCli, $dateNaissCli, $adressCli, $numCli);
    }
    $listeClients["lesClients"] = $client->select();
    
    if(isset($_GET['extcli'])){
        $infosCli = $client->selectById($_GET['extcli']);
        $html = $twig->render('dossier_client.html.twig', array('infosCli'=>$infosCli));
        try{
            ob_end_clean();
            $html2pdf = new  \Spipu\Html2Pdf\Html2Pdf('P', 'A4', 'fr'); 
            $html2pdf->setTestIsImage(false);
            $html2pdf -> writeHTML($html);     
            $nomPdf = strtolower(substr($infosCli['prenomCli'], 0, 1)) . strtoupper($infosCli['nomCli']). '.pdf';
            $html2pdf -> output($nomPdf);
        } catch (Html2PdfException $e) {
            echo 'Erreur :'.$e;
        }
    }
    
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