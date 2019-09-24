<?php
function actionAgenda($twig, $db){
    $agenda = new Agenda($db);
    
    if(isset($_GET['supCons'])){
        $agenda->delete($_GET['supCons']);
    }
    $date = date('o-m-j');
    $consultations = $agenda->selectByDate($date);
    
    echo $twig->render('prestation_prevue.html.twig', array("consultations"=>$agenda));
}
function actionExportAgenda($twig, $db){
    $agenda = new Agenda($db);
    $date = date('o-m-j');
    $consultations = $agenda->selectByDate($date);
    $html = $twig->render('agendaPdf.html.twig', array("consultations"=>$consultations));
    try{
        ob_end_clean(); // Permet d'envoyer aucune données avant le fichier PDF
        $html2pdf = new \Spipu\Html2Pdf\Html2Pdf('P','A4','fr'); // Création d'une page format A4 en français orienté en mode portrait
        $html2pdf->writeHTML($html); //Ecrit contenu résultat twig dans la variable html2pdf
        $html2pdf->output('Consultations_du_jour.pdf'); //Extrait la variable html2pdf en pdf sous le nom de listedesproduits.pdf.
    } catch (Html2PdfException $e) {
        echo 'erreur'.$e;
    }
    
}