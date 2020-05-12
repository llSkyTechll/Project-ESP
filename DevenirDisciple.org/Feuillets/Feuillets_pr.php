<?php

require_once '../ConnexionDB.php';

require_once '../Class/clsFeuilletDAO.php';
require_once '../Uploads/UploadPDF.php';

	if(isset($_FILES['fileToUpload'])){
		//$_SESSION['fileToUpload'] = $_FILES['fileToUpload'];
		//DisplayMessage();
		AddFeuillets(UploadPDF());
	}	
function GetHTMLAllFeuillets($arrayFeuillet){
	
	$html = '';
	$html = '
		<table class="table table-striped" id="NouvelleEdit">
			<thead>
				<tr>
					<th scope="col">Fichier attaché</th>
					<th scope="col">Taille</th>
				</tr>
			</thead>
		<tbody>';			

	for($x = 0; $x <count($arrayFeuillet);$x++){
		$html .= getHTMLFeuillet($arrayFeuillet[$x]);
	}

	$html .='</tbody>
	</table>';


	echo $html;

}
function GetHTMLFeuillet($feuillet){
	
	$html = '';
	$html .='
					<tr>
						<th scope="row">
							<a href="'.$feuillet->getPdfPath().'">'.$feuillet->getPdfName().'</a>							
						</th>
						<td>'.$feuillet->getSize().'</td>
					</tr>';	

	return $html;

}
function GetHTMLFeuilletEdit($feuillet){
	
	$html = '';
	$html .='
					<tr>
						<th scope="row">
							<a href="'.$feuillet->getPdfPath().'">'.$feuillet->getPdfName().'</a>							
						</th>
						<td>'.$feuillet->getSize().'</td>
						<td><input type="number" id="OrderDisplay'.$feuillet->getFeuilletId().'" name="OrderDisplay'.$feuillet->getFeuilletId().'"
							min="0" value="'.$feuillet->getOrderDisplay().'"></td>
						<td><input type="checkbox" id="checkbox'.$feuillet->getFeuilletId().'" name="checkbox'.$feuillet->getPdfName().'" value="'.$feuillet->getActif().'" ';

						if($feuillet->getActif() == 1)
						{
							$html.= "checked";
						}

						$html .='></td>
						
					</tr>';
	return $html;

}
function GetHTMLAllFeuilletsEdit($arrayFeuillet){
	
	$html = '';
	$html = '
		<table class="table table-striped" id="NouvelleEdit">
			<thead>
				<tr>
					<th scope="col">Fichier attaché</th>
					<th scope="col">Taille</th>
					<th scope="col">Ordre d\'affichage</th>
					<th scope="col">Visible</th>
				</tr>
			</thead>
		<tbody>';			

	for($x = 0; $x <count($arrayFeuillet);$x++){
		$html .= GetHTMLFeuilletEdit($arrayFeuillet[$x]);
	}

	$html .='</tbody>
	</table>';
$html.='<button type="button" id="btnSaveFeuillets" class="btn btn-primary" onclick="fnSaveFeuillets();">Sauvegarder</button>';
$html .='<form  action="#" method="post" enctype="multipart/form-data">
    <label for="fileToUpload">Select PDF to upload:</label>
    <input type="file" name="fileToUpload[]" id="fileToUpload" multiple>
    <input type="submit" value="Upload PDF" name="submit">
</form>';
	echo $html;

}
function loadPageContent(){
	
	if(isset($_SESSION['fileToUpload'])){
		//$_SESSION['fileToUpload'] = $_FILES['fileToUpload'];
		DisplayMessage();
	}	
		
			if(validateAdminEditing()){
				GetHTMLAllFeuilletsEdit(FeuiletDAO::getAllFeuillet());
			}
			else{
				GetHTMLAllFeuillets(FeuiletDAO::getAllFeuillet());
			}		
}



function AddFeuillets($arrayFiles){
	
	$arrayMessages = array();
	$arrayUploadsDB = array();
	$arrayToReturn = array();

	for($x = 0; $x <count($arrayFiles['errors']);$x++){
		//print_r($arrayFiles['errors'][$x][0]);
		
		if($arrayFiles['errors'][$x][0] == 'success'){
			array_push($arrayUploadsDB,AddFeuillet($arrayFiles['pdfs'][$x]));
		}
		else{			
			array_push($arrayMessages,arrayMessageError($arrayFiles['errors'][$x]));
		}

	}
	//print_r($arrayMessages);		
	//echo'<br><br><br>';
	//print_r($arrayUploadsDB);	
	$arrayToReturn = array(
		'MessageError'=>$arrayMessages,
		'UploadsDB'=>$arrayUploadsDB
	);
	$_SESSION['fileToUpload'] = $arrayToReturn;
		
}
function AddFeuillet($File){
	
	if(FeuiletDAO::AddFeuillet($File['pdfPath'], $File['pdfName'], $File['actif'], $File['orderDisplay'], $File['size']) == 'success'){
		$uploadToDb = array(
		'pdfName' =>$File['pdfName'],
		'succes' =>'succes'
		);
	}
	else{
		$uploadToDb = array(
		'pdfName' =>$File['pdfName'],
		'succes' =>'fail'
		);
		
	}
	return $uploadToDb;
}
function arrayMessageError($message){
	$arrayMessage = array();
	for($x = 0; $x <count($message);$x++){
		array_push($arrayMessage,$message[$x]);				
	}

	return $arrayMessage;
}
function DisplayMessage(){
	$Swal='<script>';
	
	
	//

	if(empty($_SESSION['fileToUpload']['MessageError'])){
		$Swal.='Swal.fire({
						icon: "success",
						title: "Ajout avec success"  
						})';
	}
	else{
		
		$Swal.='Swal.fire({
						icon: "error",
						title: "Une erreur est survenue"  
						})';
	}
	
	$Swal.='</script>';
	echo $Swal;

	unset($_SESSION['fileToUpload']);
}

?>














