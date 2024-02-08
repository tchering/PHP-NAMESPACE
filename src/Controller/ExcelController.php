<?php

namespace App\Controller;

use App\Model\ClientManager;
use App\Service\MyFct;
use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class ExcelController extends MyFct
{
    function __construct()
    {
        // echo "Controller Excel";die;

        $this->writeExcel();
    }

    //------------------------------------------
    //! Here we have not model and need to insert data in excel file with heading and data
    // function writeExcel()
    // {
    //     // $spreadSheet=new PhpOffice\PhpSpreadsheet\Spreadsheet;
    //     //exportation de la table client. N° Nom Adresse 

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



    //! Here we have already model and need to only insert data in excel file
    function writeExcel()
    {
        // $spreadSheet=new PhpOffice\PhpSpreadsheet\Spreadsheet;
        //exportation de la table client. N° Nom Adresse 

        $spreadsheet = IOFactory::load('Public/modele-document/test.Xlsx');
        $sheet = $spreadsheet->getActiveSheet();
        $row = 4; //ligne de depart dans fichier Excel
        $cm = new ClientManager();
        $client = $cm->findAll();
        foreach ($client as $client) {
            extract($client);
            $sheet->insertNewRowBefore($row);

            // $numClient = $client['numClient'];
            // $nomClient = $client['nomClient'];
            // $adresseClient = $client['adresseClient'];
            $sheet->setCellValue("A$row", $numClient);
            $sheet->setCellValue("B$row", $nomClient);
            $sheet->setCellValue("C$row", $adresseClient);
            $row++;
        }
        $writer = new Xlsx($spreadsheet);
        $writer->save('Public/upload/Export n table Client.xlsx');
        // $writer->save('Export table Client.xlsx');
        echo "Exportation réussie";
        die;



        $sheet->setCellValue("A1", "Bonjour les DWWM");

        $writer = new Xlsx($spreadsheet);
        // $writer->save('ExcelTest.Xlsx');
        $writer->save('Public/upload/ExcelTest.Xlsx');
    }
}
