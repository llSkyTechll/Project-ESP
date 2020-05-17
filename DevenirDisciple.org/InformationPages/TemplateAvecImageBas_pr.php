<?php

require_once '../ConnexionDB.php';

require_once '../Class/clsImageMagasinDAO.php';

require_once '../Uploads/UploadImage.php';

	if(isset($_FILES['fileToUpload'])){
		AddImageMagasins(UploadImage($_FILES['fileToUpload']));
	}	

if (isset($_POST['action'])){
  $action = $_POST['action'];
  
  switch($action){
	case 'SaveImagesMagasins':
		fnSaveImagesMagasins();
		break;
	case 'DeleteImageMagasin':
		fnDeleteImageMagasin();
		break;
  }
}
function fnSaveImagesMagasins(){
	$id = 0;
	$orderDisplay = 2;
	$actif = 1;
	
	if(isset($_POST['arrayImageMagasin'])){
		$arrayImageMagasin = json_decode($_POST['arrayImageMagasin']);
		for($x = 0; $x < count($arrayImageMagasin);$x++){
			if(ImageMagasinDAO::UpdateImageMagasin($arrayImageMagasin[$x][$id],																		
																		$arrayImageMagasin[$x][$actif],
																	 $arrayImageMagasin[$x][$orderDisplay])  == 'fail'){
				exit('fail');
			}
		}
		exit('success');
	}
}
function fnDeleteImageMagasin(){
	
	if(isset($_POST['ImageMagasinId'])){
		
		$ImageMagasin = ImageMagasinDAO::getImageMagasin($_POST['ImageMagasinId']);
		
			if(ImageMagasinDAO::DeleteImageMagasin($_POST['ImageMagasinId'])  == 'fail'){
				exit('failDB');
			}else if(!unlink($ImageMagasin->getImagePath())){
				exit('failFile');
			}		
		exit('success');
	}
}
function GetHTMLAllImagesMagasin($arrayImageMagasin){
	
	$html = '';
	$html = '
		<table class="table table-striped" id="tableImageMagasin">
			<thead>
				<tr>
					<th scope="col">Fichier attaché</th>
					<th scope="col">Taille</th>
				</tr>
			</thead>
		<tbody>';			
	if(is_array($arrayImageMagasin)){
		for($x = 0; $x <count($arrayImageMagasin);$x++){
			$html .= getHTMLImageMagasin($arrayImageMagasin[$x]);
		}
	}

	$html .='</tbody>
	</table>';


	echo $html;

}
function GetHTMLImageMagasin($ImageMagasin){
	
	$html = '';
	$html .='
		<tr>
			<th scope="row">
				<a href="'.$ImageMagasin->getImagePath().'">'.$ImageMagasin->getImageName().'</a>							
			</th>
			
		</tr>';	

	return $html;

}
function GetHTMLImageMagasinEdit($ImageMagasin){
	
	$html = '';
	$html .='
		<tr>
			<th scope="row">
        
        <img class="d-block" src="'.$ImageMagasin->getImagePath().'" style="width:300px;height:auto"alt="'.$ImageMagasin->getImageName().'"/>				
			</th>
			<td><input type="number" id="OrderDisplay_'.$ImageMagasin->getImageMagasinId().'" name="OrderDisplay_'.$ImageMagasin->getImageMagasinId().'"
				min="0" value="'.$ImageMagasin->getOrderDisplay().'"></td>
			<td><input type="checkbox" id="checkbox_'.$ImageMagasin->getImageMagasinId().'" name="checkbox_'.$ImageMagasin->getImageName().'" value="'.$ImageMagasin->getActif().'" ';

			if($ImageMagasin->getActif() == 1)
			{
				$html.= "checked";
			}

			$html .='></td>';
			$html.='<td><input type="button" name="btnDelete" value="Delete" onclick="fnDeleteConfirmation('.$ImageMagasin->getImageMagasinId().')"></td>
			
		</tr>';
	return $html;

}
function GetHTMLAllImagesMagasinEdit($arrayImageMagasin){
	
	$html = '';
	$html = '
		<table class="table table-striped" id="tableImageMagasinEdit">
			<thead>
				<tr>
					<th scope="col">Image attaché</th>
					<th scope="col">Ordre d\'affichage</th>
					<th scope="col">Visible</th>
					<th scope="col"></th>
				</tr>
			</thead>
		<tbody>';			
	if(is_array($arrayImageMagasin)){
		for($x = 0; $x <count($arrayImageMagasin);$x++){
			$html .= GetHTMLImageMagasinEdit($arrayImageMagasin[$x]);
		}
	}
	

	$html .='</tbody>
	</table>';
	if(is_array($arrayImageMagasin)){
		$html.='<button type="button" id="btnSaveImagesMagasins" class="btn btn-primary" onclick="fnSaveImagesMagasins();">Sauvegarder</button>';
	}	
	
	$html .='<form  action="#" method="post" enctype="multipart/form-data">
			<label for="fileToUpload">Sélectionner une image à télécharger:</label>
			<input type="file" name="fileToUpload[]" id="fileToUpload" multiple>
			<input type="submit" value="Télécharger l\'image" name="submit">
	</form>';

	echo $html;

}
function loadPageContent(){

	if(isset($_SESSION['fileToUpload'])){
		DisplayMessage();
	}	

	if(validateAdminEditing()){
		GetHTMLAllImagesMagasinEdit(ImageMagasinDAO::getAllImageMagasinEdit());
	}
	else{
		GetHTMLAllImagesMagasin(ImageMagasinDAO::getAllImageMagasin());
	}		
}
function AddImageMagasins($arrayFiles){
	
	$arrayMessages = array();
	$arrayUploadsDB = array();
	$arrayToReturn = array();

	for($x = 0; $x <count($arrayFiles['errors']);$x++){
		
		
		if($arrayFiles['errors'][$x][0] == 'success'){
			array_push($arrayUploadsDB,AddImageMagasin($arrayFiles['images'][$x]));
		}
		else{			
			array_push($arrayMessages,arrayMessageError($arrayFiles['errors'][$x]));
		}

	}
	
	$arrayToReturn = array(
		'MessageError'=>$arrayMessages,
		'UploadsDB'=>$arrayUploadsDB
	);
	$_SESSION['fileToUpload'] = $arrayToReturn;
		
}
function AddImageMagasin($File){
	
	if(ImageMagasinDAO::AddImageMagasin($_SESSION['gmenuId'],$File['imagePath'], $File['imageName'], 0, 0) == 'success'){
		$uploadToDb = array(
		'imageName' =>$File['imageName'],
		'succes' =>'succes'
		);
	}
	else{
		$uploadToDb = array(
		'imageName' =>$File['imageName'],
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
	
	if(isset($_SESSION['fileToUpload'])){
		
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
	}
	$Swal.='</script>';
	echo $Swal;
	unset($_SESSION['fileToUpload']);
}

?>














