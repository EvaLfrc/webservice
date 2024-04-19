<?php
// Connexion à la base de données
$connexion = mysqli_connect("localhost", "root", "0000", "mgsb");

// Récupération des paramètres de la requête GET
$token = $_GET['token'];
$ficheid = $_GET['ficheid'];

// Requête pour récupérer la cleapi de la table users
$sqlrequest = 'SELECT cleapi FROM users';
$results = mysqli_query($connexion, $sqlrequest);

// creation d'un trigger ajoutant les données pour le fichier de log 
// Date_add(htoken+60 minutes);
// now<Date_add(htoken+60 minutes);


// Parcours des résultats pour trouver la correspondance avec le token
while ($row = $results->fetch_array()) {
    if ($token == $row['cleapi']) {
        // Récupération de l'ID utilisateur associé au token
        $sqlrequest = sprintf("SELECT user_id FROM fichefrais WHERE id = '%s'", $ficheid);
        $userid = mysqli_query($connexion, $sqlrequest)->fetch_assoc();
        
        // Récupération de l'ID utilisateur associé au token
        $sqlrequest = sprintf("SELECT id FROM users WHERE cleapi = '%s'", $token);
        $useridtoken = mysqli_query($connexion, $sqlrequest)->fetch_assoc();

        // Vérifie que l'ID utilisateur de la fiche correspond à celui du token
        if ($userid['user_id'] == $useridtoken['id']) {
            // Récupération des informations de la fiche de frais
            $sqlrequest = sprintf("SELECT * FROM fichefrais WHERE id = '%s'", $ficheid);
            $infofichefrais = mysqli_query($connexion, $sqlrequest)->fetch_assoc();
            
            // Récupération des lignes de frais forfaitaires associées à la fiche
            $sqlrequest = sprintf("SELECT LigneFraisForfait_id FROM fichefrais_lignefraisforfait WHERE FicheFrais_id = '%s'", $ficheid);
            $idslignefraisforfait = mysqli_query($connexion, $sqlrequest);
            $ids = array();
            while ($row2 = $idslignefraisforfait->fetch_assoc()) {
                $ids[] = $row2['LigneFraisForfait_id'];
            }
            $idstring = implode(",", $ids);
            $sqlrequest = "SELECT * FROM lignefraisforfait WHERE id IN ($idstring)";
            $lignefraisforfaitresults = mysqli_query($connexion, $sqlrequest);
            $lignefraitforfait_tableau = array();
            while ($row2 = $lignefraisforfaitresults->fetch_assoc()) {
                $lignefraitforfait_tableau[] = $row2;
            }
            
            // Récupération des lignes de frais hors forfait associées à la fiche
            $sqlrequest = sprintf("SELECT LigneFraisHorsForfait_id FROM fichefrais_lignefraishorsforfait WHERE FicheFrais_id = '%s'", $ficheid);
            $idslignefraishorsforfait = mysqli_query($connexion, $sqlrequest);
            $ids = array();
            while ($row2 = $idslignefraishorsforfait->fetch_assoc()) {
                $ids[] = $row2['LigneFraisHorsForfait_id'];
            }
            $idstring = implode(",", $ids);
            $sqlrequest = "SELECT * FROM lignefraishorsforfait WHERE id IN ($idstring)";
            $lignefraishorsforfaitresults = mysqli_query($connexion, $sqlrequest);
            $lignefraithorsforfait_tableau = array();
            while ($row2 = $lignefraishorsforfaitresults->fetch_assoc()) {
                $lignefraithorsforfait_tableau[] = $row2;
            }
            
            // Stockage des résultats dans un tableau
            $resultats = array();
            $resultats['ficheinfo'] = $infofichefrais;
            $resultats['ligneforfait'] = $lignefraitforfait_tableau;
            $resultats['lignehorsforfait'] = $lignefraithorsforfait_tableau;
            
            // Conversion en JSON et affichage
            echo json_encode($resultats, JSON_PRETTY_PRINT);
        }
    }
}
?>
