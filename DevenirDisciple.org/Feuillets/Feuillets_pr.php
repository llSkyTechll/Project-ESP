<?php

require_once '../ConnexionDB.php';

require_once '../Class/clsFeuilletDAO.php';
require_once '../Uploads/UploadPDF.php';


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

	$html .='<button type="button" id ="btnAddFeuillet" class="btn btn-primary" onclick="fnAddFeuillet();">Ajouter</button>';

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
function GetHTMLNouvelleEdit($Nouvelles){
	
	$html = '';
	$html .= '<div class=" justify-content-center" ><header>
					<div > 
						<img id ="image"src="'.$Nouvelles->getImagePath().'" alt="Image de '.$Nouvelles->getTitle().'" height="200" width="200">
						<form action="../Uploads/UploadImage.php" method="post" enctype="multipart/form-data">
							<label for="fileToUpload">Select image to upload:</label>
							<input type="file" name="fileToUpload[]" id="fileToUpload" multiple>
							<input type="submit" value="Upload Image" name="submit">
						</form>
					</div>	

						<h1 id="title"> 
							'.$Nouvelles->getTitle().'
						</h1>
					</header>						

					<div id="content"> 
						'.$Nouvelles->getDescrTot().'
					</div>
					</div>
					<hr>';

	echo $html;

}
function GetHTMLAllNouvellesEdit($arrayNouvelles){
	
	$html = '';
	$html = '
		<table class="table table-striped" id="NouvelleEdit">
		<thead>
			<tr>
				<th scope="col">Titre</th>
				<th scope="col">Date de début</th>
				<th scope="col">Date de fin</th>
				<th scope="col">Actif</th>
			</tr>
		</thead>
		<tbody>';
			
			
			for($x = 0; $x <count($arrayNouvelles);$x++){
				$epochDebut = $arrayNouvelles[$x]->getDateDebut();
				$epochFin = $arrayNouvelles[$x]->getDateFin();
				$dateDebut = new DateTime("@$epochDebut");  
				$dateFin = new DateTime("@$epochFin");  
				
					$html .= 
				'<tr>
					<th scope="row">
						<a href onclick="parent.fnRedirectionNouvelle(\'Nouvelles/Nouvelles.php\',0,'.$arrayNouvelles[$x]->getNouvellesId().')">'.$arrayNouvelles[$x]->getTitle().'</a></th>
					<td>'.$dateDebut->format('Y-m-d').'</td>
					<td>'.$dateFin->format('Y-m-d').'</td>
					<td><input type="checkbox" id="checkbox'.$arrayNouvelles[$x]->getNouvellesId().'" name="checkbox'.$arrayNouvelles[$x]->getTitle().'" value="'.$arrayNouvelles[$x]->getActif().'" ';
					
				if($arrayNouvelles[$x]->getActif() == 1)
				{
					$html.= "checked";
				}
				
				$html .='>
					</td>
				</tr>';
				}
	
	$html .='</tbody>
	</table>';
	
	$html .='<button type="button" id ="btnAddNouvelle" class="btn btn-primary" onclick="fnAddNouvelle();">Ajouter</button>';
	
	echo $html;
}
function loadPageContent(){
	
		GetHTMLAllFeuillets(FeuiletDAO::getAllFeuillet());
			/*if(validateAdminEditing()){
				if($_SESSION["FeuilletId"] == 0){
					GetHTMLAllFeuillets(FeuiletDAO::getAllFeuillet());
					//GetHTMLAllNouvellesEdit(NouvellesDAO::getAllNouvelles());
					//GetAddNouvelles();
				}
				else{
					GetHTMLNouvelleEdit(NouvellesDAO::getNouvelles($_SESSION["FeuilletId"]));
				}
			}
			else{
				if($_SESSION["FeuilletId"] == 0){
					GetHTMLAllnouvelles(NouvellesDAO::getAllNouvelles());
				}
				else{
					GetHTMLNouvelle(NouvellesDAO::getNouvelles($_SESSION["FeuilletId"]));
				}
			}		*/
}

if (isset($_POST['action'])){
	$action = $_POST['action'];
		
	switch($action){
		/*case 'updateNouvellesAll':
		FNUpdateEvent();
		case 'updateNouvelles':
		FNUpdateEvent();*/
		case 'AddNewFeuillets':
			if(isset($_POST['fileToUpload']))
			{
				exit($_POST['fileToUpload']);
			}
			if(isset($_FILES["fileToUpload"]))
			{
				exit("FILES");
			}
			exit("AddNewFeuillets");
			break;
		//	exit($_POST['fileToUpload']);
		//	exit('test');
		/*if(isset($_FILES["fileToUpload"]))
		{
			//exit("yer");
			
		// print_r(UploadPDF());
			//echo("submit");
			//exit($_POST['fileToUpload']);
		//AddFeuillets(UploadPDF());
			//exit($_POST['fileToUpload']);

		}*/
			//exit('succes2');
			
		//AddFeuillets(UploadPDF($_POST['fileToUpload']));
	}
	exit("post");
	
}
/*if(isset($_POST['fileToUpload']))
{
	echo("post");
}

if(isset($_FILES["fileToUpload"]))
{
	echo("FILES");
}*/

function AddFeuillets($arrayFiles){
	
	$arrayMessages = array();
	$arrayUploadsDB = array();
	$arrayToReturn = array();
	//print_r($arrayFiles['errors']);
	//echo'<br><br><br>';
	//print_r($arrayFiles['pdfs']);

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
	//	print_r($arrayToReturn);
	echo json_encode($arrayToReturn);
	
	
	
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


?>
