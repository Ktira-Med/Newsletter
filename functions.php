<?php

// function connexion(){
//    // Construction du Data Source Name
//    $dsn = 'mysql:dbname=' . DB_NAME . ';host=' . DB_HOST;

//    // Tableau d'options pour la connexion PDO
//    $options = [
//        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
//        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
//    ];

//    // Création de la connexion PDO (création d'un objet PDO)
//    $pdo = new PDO($dsn, DB_USER, DB_PASSWORD, $options);
//    $pdo->exec('SET NAMES UTF8'); 
//    return $pdo;
// }

// /**
//  * Récupère tous les emails de la table subscribers
//  */
// function existEmail(string $email)
// {
//     $pdo = connexion();

//     $sql = "SELECT id 
//     FROM subscribers 
//     WHERE email='".$email."'";
        
 
//     $query = $pdo->prepare($sql);
//     $query->execute();
   
//     return $query->fetchAll();
// }
// /**
//  * Récupère tous les enregistrements de la table origins
//  */
// function getAllOrigins()
// {
//     $pdo = connexion();

//     $sql = 'SELECT *
//             FROM origins
//             ORDER BY origin_label';

//     $query = $pdo->prepare($sql);
//     $query->execute();

//     return $query->fetchAll();
// }

// /**
//  * Récupère tous les enregistrements de la table interests
//  */
// function getAllInterests()
// {
//     $pdo = connexion();

//     $sql = 'SELECT *
//             FROM interests
//             ORDER BY interest_label';

//     $query = $pdo->prepare($sql);
//     $query->execute();

//     return $query->fetchAll();
// }


// // Verification existance centres d'interets pour le même subscriber

// function existInterest(int $subscriberId, int $interestId)
// {
//     $pdo = connexion();

//     $sql = "SELECT *
//     FROM fill_interest 
//     WHERE subscriber_id='".$subscriberId."' and interest_id= '".$interestId."' ";
        
 
//     $query = $pdo->prepare($sql);
//     $query->execute();
   
//     return $query->fetchAll();
// }

// /**
//  * Ajoute un abonné à la liste des emails
//  */
// function addSubscriber(string $email, string $firstname, string $lastname, int $originId, $interests)
// {
//     $pdo = connexion();

//     // Insertion de l'email dans la table subscribers
//     $sql = 'INSERT INTO subscribers
//             (email, firstname, lastname, origin_id, created_on) 
//             VALUES (?,?,?,?, NOW())';

//     $query = $pdo->prepare($sql);

//     // Verification de l'existance d'email 
//     if(count(existEmail($email))==0){
       
//         $query->execute([$email, $firstname, $lastname, $originId]);
        
//         $SubscriberId=existEmail($email)[0];
//         foreach($SubscriberId as $key=>$value)
//         {
//             $SubscriberId= $value;
//         }
       
//         foreach($interests as $interestId)
//         {
//            addInterest($SubscriberId,$interestId);
//         }
       
//     }else{
//        return true;
//     }
// }


// /**
//  * ajoute des interests dans la table fill_interest
//  */
// function addInterest($subscriberId, $interestId){

//     $pdo = connexion();

//     // Insertion des interests dans la table fill_interest
//     $sql = 'INSERT INTO fill_interest
//             (subscriber_id, interest_id) 
//             VALUES (?,?)';

//     $query = $pdo->prepare($sql);
//     $query->execute([$subscriberId, $interestId]);
// }

