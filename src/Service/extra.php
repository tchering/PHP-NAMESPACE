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





function printr($array)
{
    echo "<pre>";
    print_r($array);
    echo "</pre>";
}
