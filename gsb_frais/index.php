<?php
session_start();
require_once("include/fct.inc.php");
require_once ("include/class.pdogsb.inc.php");

include("vues/v_entete.php") ;

//PdoGsb("adresse_serveur", "nom_base", "nom_utilisateur", "mot_de_passe")
$pdo = new PdoGsb("localhost", "gsb_frais", "gsb", "gsbpass");
$tabErreurs = array();
$estConnecte = estConnecte();
$uc = lireDonneeUrl('uc');
if ($uc == 'connexion' || !$estConnecte) {
    include("controleurs/c_connexion.php");
}
else {
    switch($uc){
        case 'etatFrais' :
            include("controleurs/c_etatFrais.php");
            break;

        case 'gererFrais' :
            include("controleurs/c_gererFrais.php");
        break;

        default :
            include("controleurs/c_etatFrais.php");
    }
}
include("vues/v_finContenu.php") ;
include("vues/v_pied.php") ;
?>
