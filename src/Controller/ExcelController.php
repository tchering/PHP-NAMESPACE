<?php

namespace App\Controller;

use App\Model\ArticleManager;
use App\Model\Client;
use App\Model\ClientManager;
use App\Service\MyFct;
use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class ExcelController extends MyFct
{
    function __construct()
    {
        $this->readExcel();

        // $this->writeExcel();    //to write excel
    }

    function readExcel()
    {
        $spreadsheet = IOFactory::load("Public/maj-table/article.xlsx");
        $sheet = $spreadsheet->getActiveSheet();
        $articles = $sheet->toArray();
  
        $am = new ArticleManager();

        foreach ($articles as $key => $value) {
            if ($key != 0) {
                $numArticle = $value[1];
                $designation = $value[2];
                $prixUnitaire = $value[3];

                // Skip this iteration if $numArticle is null
                if ($numArticle === null) {
                    continue;
                }

                $data = [
                    'numArticle' => $numArticle,
                    'designation' => $designation,
                    'prixUnitaire' => $prixUnitaire
                ];

                $art = $am->findOneByCondition(['numArticle' => $numArticle], 'array');

                // Check if $art is an array before trying to access $art['numArticle']
                if (is_array($art) && isset($art['numArticle'])) {
                    $id = $art['id'];
                    $am->update($data, $id);
                } else {
                    $am->insert($data);
                }
            }
        }
        echo "Migration bien faite";
        die;
    }
    //------------------------------------------
    //! Here we have already excel model and need to only insert data in excel file
    // function writeExcel()
    // {
    //     // $spreadSheet=new PhpOffice\PhpSpreadsheet\Spreadsheet;
    //     //exportation de la table client. N° Nom Adresse 

    //     $spreadsheet = IOFactory::load('Public/modele-document/value.Xlsx');
    //     $sheet = $spreadsheet->getActiveSheet();
    //     $row = 4; //ligne de depart dans fichier Excel
    //     $cm = new ClientManager();
    //     $client = $cm->findAll();
    //     $nbre = 0;
    //     foreach ($client as $client) {
    //         extract($client);
    //         $sheet->insertNewRowBefore($row);

    //         // $numClient = $client['numClient'];
    //         // $nomClient = $client['nomClient'];
    //         // $adresseClient = $client['adresseClient'];
    //         $sheet->setCellValue("A$row", $numClient);
    //         $sheet->setCellValue("B$row", $nomClient);
    //         $sheet->setCellValue("C$row", $adresseClient);
    //         $nbre++;
    //         $row++;
    //     }
    //     $a3 = $sheet->getCell('A3')->getValue();
    //     if ($a3 != "") {
    //         $sheet->removeRow(3);
    //     }
    //     $row = $row - 1;
    //     $sheet->setCellValue("A$row", "Nombre Clients = $nbre");
    //     $writer = new Xlsx($spreadsheet);
    //     $writer->save('Public/upload/Export n table Client.xlsx');
    //     // $writer->save('Export table Client.xlsx');
    //     echo "Exportation réussie";
    //     die;
    // }


    //! This  function is to export articles from database to excel.
    function writeExcel()
    {
        $spreadsheet = IOFactory::load('Public/modele-document/article.Xlsx');
        $sheet = $spreadsheet->getActiveSheet();
        $row = 4; //ligne de depart dans fichier Excel
        $cm = new ArticleManager();
        $article = $cm->findAll();
        $nbre = 0;
        foreach ($article as $article) {
            extract($article);
            $sheet->insertNewRowBefore($row);

            // $numClient = $article['numClient'];
            // $nomClient = $article['nomClient'];
            // $adresseClient = $article['adresseClient'];
            $sheet->setCellValue("A$row", $id);
            $sheet->setCellValue("B$row", $numArticle);
            $sheet->setCellValue("C$row", $designation);
            $sheet->setCellValue("D$row", $prixUnitaire);
            $nbre++;
            $row++;
        }
        $a3 = $sheet->getCell('A3')->getValue();
        if ($a3 != "") {
            $sheet->removeRow(3);
        }
        $row = $row - 1;
        $sheet->setCellValue("A$row", "Nombre Article = $nbre");
        $writer = new Xlsx($spreadsheet);
        // $writer->save('Public/upload/Export n table Client.xlsx');
        $writer->save('Public/modele-document/article.Xlsx');
        // $writer->save('Export table Client.xlsx');
        echo "Exportation réussie";
        die;
    }
    //! Here this function is used to create new excel file and insert data in it
    // function writeExcel()
    // {
    //     // $spreadSheet=new PhpOffice\PhpSpreadsheet\Spreadsheet;
    //     //exportation de la table article. N° Nom Adresse 

    //     $spreadsheet = new Spreadsheet();
    //     $sheet = $spreadsheet->getActiveSheet();
    //     $sheet->setCellValue("A1", "N°");
    //     $sheet->setCellValue("B1", "Nom");
    //     $sheet->setCellValue("C1", "Adresse");
    //     $row = 2;
    //     $cm = new ClientManager();
    //     $client = $cm->findAll();
    //     foreach ($client as $client) {
    //         extract($client);
    //         // $numClient = $client['numClient'];
    //         // $nomClient = $client['nomClient'];
    //         // $adresseClient = $client['adresseClient'];

    //         $sheet->setCellValue("A$row", $numClient);
    //         $sheet->setCellValue("B$row", $nomClient);
    //         $sheet->setCellValue("C$row", $adresseClient);
    //         $row++;

    //         // $sheet->setCellValue("A$row", $client->getId());
    //         // $sheet->setCellValue("B$row", $client->getNom());
    //         // $sheet->setCellValue("C$row", $client->getAdresse());
    //         // $row++;
    //     }
    //     $writer = new Xlsx($spreadsheet);
    //     $writer->save('Public/upload/Export new table Client.xlsx');
    //     // $writer->save('Export table Client.xlsx');
    //     echo "Exportation réussie";
    //     die;



    //     $sheet->setCellValue("A1", "Bonjour les DWWM");

    //     $writer = new Xlsx($spreadsheet);
    //     // $writer->save('ExcelTest.Xlsx');
    //     $writer->save('Public/upload/ExcelTest.Xlsx');
    // }
}
