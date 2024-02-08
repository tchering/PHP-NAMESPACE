<?php
//added namespace 
namespace App\Controller;
use App\Service\MyFct;
// use App\Service\MyFct as fct; here i have rename fct which i can call below

//The line of code you provided is an import statement in PHP. It is used to include the functionality of a specific class or file in your current file.
class AccueilController{
    public function __construct(){
        $file="View/accueil/accueil.html.php";
        $myFct=new MyFct();
        // $myFct=new fct();
       $myFct->generatePage($file);

    }
    //-------------------------Mes Methodes------------




}