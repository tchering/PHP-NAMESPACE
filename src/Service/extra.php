<?php

// function charger($class)
// {
//     //Dorenavant $class = "App\Dossier\NomClass" . Par exemple "App\Controller\ArticleController" 
//     $fileClass = str_replace("App\\", "", "src", $class) . ".php"; // src/
//     $fileClass = str_replace("\\", "/", $fileClass);
//     var_dump($fileClass);
//     exit;
//     if (file_exists($fileClass)) {
//         include($fileClass);
//     }
// }
function charger($class)
{
    // dorenavant $claas="App\Dossier\NomClass". Par exemple "App\Controller\articleController"

    $fileClass = str_replace("App", "src", $class) . ".php";
    $fileClass = str_replace("\\", "/", $fileClass);

    if (file_exists($fileClass)) {
        require_once($fileClass);
    }
}

// function charger_classic($class){ 
//         $fileModel="Model/$class.php"; 
//         $fileController="Controller/$class.php";
//         $fileView="View/$class.php";
//         $fileService="Service/$class.php";
//         $files=[$fileModel,$fileController,$fileView,$fileService];
//         foreach($files as $file){
//             if(file_exists($file)){
//                 require_once($file);
//             }
//         }
//     }



function printr($array)
{
    echo "<pre>";
    print_r($array);
    echo "</pre>";
}
