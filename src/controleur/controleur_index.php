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