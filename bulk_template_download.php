<?php
require_once('db.inc.php');
require_once('facilities.inc.php');
if (!$person->BulkOperations) {
    header('Location: '.redirect());
    exit;
}

$templates = [
    'devices' => [
        'filename' => 'Bulk_Device_Import_Template.xlsx',
        'headers'  => ['DataCenter','Cabinet','Position','Label','Height','Manufacturer','Model','Hostname','SerialNo','AssetTag','HalfDepth','BackSide','ESX','InstallDate','Reservation','Owner','Contact','CustomTags'],
        'sample'   => ['OSTI','OSTI.AO14','1','Test-Server01','1','HP','Proliant DL 360 G7','','','1234','','','','','','CCSD','',''],
    ],
    'cabinets' => [
        'filename' => 'Bulk_Cabinet_Import_Template.xlsx',
        'headers'  => ['DataCenter','Label','Owner','Zone','Row','Height','Model','U1Position','MaxkW','MaxWeight','MapX1','MapX2','MapY1','MapY2','FrontEdge','Notes'],
        'sample'   => ['OSTI','OSTI.AO14','CCSD','','','42','','1','10','1000','','','','','Front',''],
    ],
    'containers' => [
        'filename' => 'Bulk_Container_Import_Template.xlsx',
        'headers'  => ['DataCenter','Container','Zone','Row'],
        'sample'   => ['OSTI','CNO','Zone A','Row 1'],
    ],
    'departments' => [
        'filename' => 'Bulk_Department_Import_Template.xlsx',
        'headers'  => ['DepartmentName','ExecutiveSponsor','AccountManager','DepartmentColor','Classification'],
        'sample'   => ['CCSD','Smith, John','Jones, Jane','FF0000',''],
    ],
    'users' => [
        'filename' => 'Bulk_User_Import_Template.xlsx',
        'headers'  => ['LastName','FirstName','UserID','Email','Phone1','Phone2','Phone3','AdminOwnDevices','ReadAccess','WriteAccess','DeleteAccess','ContactAdmin','RackRequest','RackAdmin','SiteAdmin','BulkOperations','DepartmentMembership'],
        'sample'   => ['Doe','John','jdoe','jdoe@example.com','0812345678','','','0','1','1','0','0','0','0','0','0','CCSD'],
    ],
    'templates' => [
        'filename' => 'Bulk_DeviceTemplate_Import_Template.xlsx',
        'headers'  => ['Manufacturer','Model','Height','Weight','DeviceType','NominalWatts','NumPower','NumPorts','PSNames','PortNames'],
        'sample'   => ['HP','Proliant DL 360 G7','1','20','Server','200','2','4','PS1,PS2','Port1,Port2,Port3,Port4'],
    ],
    'network' => [
        'filename' => 'Bulk_Network_Import_Template.xlsx',
        'headers'  => ['SourceDeviceID','SourcePort','TargetDeviceID','TargetPort','MediaType','ColorCode','Notes'],
        'sample'   => ['Test-Server01','Port1','Switch01','Gi0/1','CAT6','',''],
    ],
    'power' => [
        'filename' => 'Bulk_Power_Import_Template.xlsx',
        'headers'  => ['SourceDeviceID','SourcePort','TargetDeviceID','TargetPort','Notes'],
        'sample'   => ['Test-Server01','PS1','PDU01','Outlet1',''],
    ],
    'moves' => [
        'filename' => 'Bulk_Moves_Import_Template.xlsx',
        'headers'  => ['DeviceID','DataCenterID','Cabinet','Position','ProcessDate'],
        'sample'   => ['Test-Server01','OSTI','OSTI.AO14','2',''],
    ],
];

$type = isset($_GET['type']) ? $_GET['type'] : '';
if (!array_key_exists($type, $templates)) {
    http_response_code(400);
    die('Invalid template type');
}

$tpl = $templates[$type];

$spreadsheet = new \PhpOffice\PhpSpreadsheet\Spreadsheet();
$sheet = $spreadsheet->getActiveSheet();

// Header row - bold + background
$sheet->fromArray([$tpl['headers']], null, 'A1');
$headerStyle = [
    'font' => ['bold' => true, 'color' => ['rgb' => 'FFFFFF']],
    'fill' => ['fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID, 'startColor' => ['rgb' => '1F497D']],
    'borders' => ['allBorders' => ['borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN]],
];
$lastCol = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::stringFromColumnIndex(count($tpl['headers']));
$sheet->getStyle('A1:' . $lastCol . '1')->applyFromArray($headerStyle);

// Sample data row
$sheet->fromArray([$tpl['sample']], null, 'A2');
$sheet->getStyle('A2:' . $lastCol . '2')->applyFromArray([
    'fill' => ['fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID, 'startColor' => ['rgb' => 'EBF3FB']],
]);

// Auto width
foreach (range(1, count($tpl['headers'])) as $i) {
    $sheet->getColumnDimensionByColumn($i)->setAutoSize(true);
}

ob_end_clean();
header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
header('Content-Disposition: attachment; filename="' . $tpl['filename'] . '"');
header('Cache-Control: max-age=0');

$writer = new \PhpOffice\PhpSpreadsheet\Writer\Xlsx($spreadsheet);
$writer->save('php://output');
exit;
