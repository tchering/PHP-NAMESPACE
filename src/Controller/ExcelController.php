<?php

namespace App\Controller;

use App\Service\MyFct;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class ExcelController extends MyFct
{
    public function __construct()
    {
        $this->writeExcel();
    }

    public function writeExcel()
    {
        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();
        $sheet->setCellValue('A1', 'Bonjour les Dwwm !');
        $writer = new Xlsx($spreadsheet);
        $writer->save('ExcelTest.xlsx');
    }
}
