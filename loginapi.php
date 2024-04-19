<?php
// Connexion à la base de données
$connexion = mysqli_connect("localhost", "root", "0000", "mgsb");

// Récupération des paramètres de la requête GET
$username = $_GET['username'];
$password = $_GET['mdpapi'];

// Vérification de la connexion à la base de données
if ($connexion) {
    // Requête SQL pour récupérer le mot de passe associé à l'utilisateur
    $sqlrequest = sprintf("SELECT mdpapi FROM users WHERE username = '%s'", $username);
    $resultat = mysqli_query($connexion, $sqlrequest);

    // Vérification de la requête SQL
    if ($resultat) {
        // Définition du type de contenu de la réponse comme JSON
        header("Content-Type: JSON");

        // Vérification du mot de passe
        if ($password == $resultat->fetch_assoc()['mdpapi']) {
            // Génération d'un token sécurisé
            $token = bin2hex(random_bytes(16));
            

            // Mise à jour du token dans la base de données avec l'ajout automatique du datetime de htoken
            $sqlrequest = sprintf("UPDATE users SET cleapi ='%s', htoken = now() WHERE username = '%s'", $token, $username);
    
            mysqli_query($connexion, $sqlrequest);

            // Envoi du token encodé en JSON comme réponse
            echo json_encode($token, JSON_PRETTY_PRINT);
        }
    }
} else {
    // En cas d'échec de la connexion à la base de données
    echo json_encode("Echec de la connexion, veuillez réessayer", JSON_PRETTY_PRINT);
}
?>
