<?php
$class = "App \Controller\Article"; // This corresponds to App/Controller/Article 

$fileClass = str_replace("App\\", "", $class); //This corresponds to Controller\Article coz we removed App with empty string.

$fileClass = str_replace("\\", "/", $fileClass); // Here we replace \\ this with forward slash / Controller/Article

$fileClass = "src/$fileClass" . "Controller.php"; // here we have src/Controller/ArticleController.php 
echo $fileClass;




$c = 'cliant';
$c = str_replace('a', 'e', $c); // with this a in client will be replaced by e.
echo $c;
die;
