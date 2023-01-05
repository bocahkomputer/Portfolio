<?php
require_once __DIR__ . '/vendor/autoload.php';
$mpdf = new \Mpdf\Mpdf();
$conn = new mysqli('localhost','fit2104_ass2', 'fit2104_ass2','fit2104_ass2');
if($conn->connect_error){
    die("Error in DB connection: ".$conn->connect_errno." : ".$conn->connect_error);
}
$select = "SELECT * FROM `students`";
$result = $conn->query($select);
$data = array();
while($row = $result->fetch_object()){
    $data .= '<tr>'
        .'<td>'.$row->id.'</td>'
        .'<td>'.$row->firstName.'</td>'
        .'<td>'.$row->surname.'</td>'
        .'<td>'.$row->address.'</td>'
        .'<td>'.$row->phone.'</td>'
        .'<td>'.$row->dob.'</td>'
        .'<td>'.$row->email.'</td>'
        .'<td>'.$row->subscribe.'</td></tr>';
}



$pdfcontent = '<h1>Little Dreamer Music School</h1>
		<h2>Students List</h2>
		<table autosize="1">
		<tr>
		<td style="width: 33%"><strong>ID</strong></td>
		<td style="width: 36%"><strong>First Name</strong></td>
		<td style="width: 30%"><strong>Surname</strong></td>
		<td style="width: 33%"><strong>Address</strong></td>
		<td style="width: 36%"><strong>Phone(+61)</strong></td>
		<td style="width: 30%"><strong>DOB</strong></td>
		<td style="width: 36%"><strong>Email</strong></td>
		<td style="width: 30%"><strong>Subscribe</strong></td>
		</tr>
		'.$data.'
		</table>';

$mpdf->WriteHTML($pdfcontent);

$mpdf->SetDisplayMode('fullpage');
$mpdf->list_indent_first_level = 0;

//call watermark content and image
$mpdf->SetWatermarkText('Little Dreamer Music School');
$mpdf->showWatermarkText = true;
$mpdf->watermarkTextAlpha = 0.1;

//output in browser
$mpdf->Output();
?>
