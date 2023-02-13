<?php


require 'config.php';
require 'functions.php';
$filename = $argv[1];

/**
 * On vérifie que le fichier existe bien. S'il n'existe pas on affiche simplement un message d'erreur
 */
if (!file_exists($filename)) {
    echo "Erreur : fichier '$filename' introuvable";
    exit; // On arrête l'exécution du script
}

/**
 * Si on arrive là c'est que le fichier existe bien, on va l'ouvrir en lecture
 * grâce à la fonction fopen()
 */
$file = fopen($filename, "r");


/**
 * On se connecte à la base de données avec PDO et on prépare la requête d'insertion
 */
$pdo = connexion();

// $pdo = new PDO('mysql:host=' . DB_HOST . ';dbname=' . DB_NAME . ';charset=utf8mb4', DB_USER, DB_PASSWORD);
// $pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
// $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);


$pdoStatement = $pdo->prepare('INSERT INTO subscribers (firstname, lastname, email, created_on) VALUES (?,?,?,?)');

/**
 * Ensuite on va lire chaque ligne du fichier CSV avec la fonction fgetcsv()
 * tant qu'il y a des lignes à lire. S'il n'y a plus de nouvelle ligne, fgetcsv() retourne false.
 */
while ($row = fgetcsv($file)) {

    /**
     * $row représente une ligne du fichier CSV, les données sont récupérées dans un tableau
     * La première colone est le nom du produit
     * La deuxième colone est son prix sous forme d'une chaîne de caractères
     */

    $firstname = $row[0];
    $lastname = $row[1];
    $email = $row[2];
    $date = new DateTime();
    $dateformat = $date->format('Y-m-d H-i-s');



    $firstname = ucwords(strtolower($firstname), " -");
    $lastname = ucwords(strtolower($lastname), " -");
    $email = strtolower($email);
    $email = str_replace(" ", "", $email);

    // Verification de l'existance d'email dans le fichier CSV
    if (count(existEmail($email)) == 0) {
        $pdoStatement->execute([$firstname, $lastname, $email, $dateformat]);
    } else {
        echo 'email address : ' . $email . ' is already exist! ';
    }
}

echo 'Import terminé!';
