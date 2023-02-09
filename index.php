<?php


// Inclusion des dépendances
require 'config.php';
require 'functions.php';

$errors = [];
$success = null;
$email = '';
$firstname = '';
$lastname = '';

// Si le formulaire a été soumis...
if (!empty($_POST)) {

    // On récupère les données
    $email = trim($_POST['email']);
    $firstname = trim($_POST['firstname']);
    $lastname = trim($_POST['lastname']);
    $firstname = ucwords(strtolower($firstname), " -");
    $lastname = ucwords(strtolower($lastname), " -");

    // On récupère l'origine
    $originSelected = $_POST['origin'];

    // Validation 
    if (!$email) {
        $errors['email'] = "Please enter an email address";
    }

    if (!$firstname) {
        $errors['firstname'] = "Please enter a first lastname";
    }

    if (!$lastname) {
        $errors['lastname'] = "Please enter a lastname";
    }

    // Si tout est OK (pas d'erreur)
    if (empty($errors)) {

        // Ajout de l'email dans le fichier csv
        addSubscriber($email, $firstname, $lastname, $originSelected);

        // Message de succès
        $success  = 'Thank you for your registration';
    }
}

//////////////////////////////////////////////////////
// AFFICHAGE DU FORMULAIRE ///////////////////////////
//////////////////////////////////////////////////////

// Sélection de la liste des origines et interests
$origins = getAllOrigins();
// Inclusion du template
include 'index.phtml';
