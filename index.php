<?php
session_start();
if (!$_SESSION) {   //    la variable $_SESSION est encore vide ====  $_SESSION=[];
    $_SESSION['username'] = 'user';
    $_SESSION['roles'] = json_encode(['ROLE_USER']);
    $_SESSION['bg_navbar'] = 'bg_red';
}
require_once("src/Service/extra.php");
spl_autoload_register('charger');



$path = 'accueil';
extract($_GET);
// $nameController = ucfirst($path) . "Controller";
$nameController = "App\\Controller\\" . ucfirst($path) . "Controller"; //! App\Controller\AccueilController
//echo $nameController."<br>";
// $fileController = "Controller/$nameController.php";
$fileController = "src/Controller/" . ucfirst($path) . "Controller.php";
//echo $fileController; //! src/Controller/AccueilController.php
if (file_exists($fileController)) {
    $page = new $nameController();
} else {
    $myFct = new App\Service\MyFct;
    $file = "View/erreur/erreur.html.php";
    $message = "Le fichier $fileController n'existe pas!";
    $variables = ['message' => $message];
    $myFct->generatePage($file, $variables);
}
