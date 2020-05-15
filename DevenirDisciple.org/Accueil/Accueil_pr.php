<?php

require_once '../ConnexionDB.php';

require_once '../Class/clsAccueilDAO.php';

require_once '../Class/clsNouvellesDAO.php';

require_once '../Class/clsNouvelles.php';

require_once '../Uploads/UploadImage.php';
require_once '../Uploads/UploadVideo.php';


if(isset($_FILES['fileToUploadImageHomelie'])){
		UpdateImageHomelie(UploadImage($_FILES['fileToUploadImageHomelie']));
	}	
if(isset($_FILES['fileToUploadImageTemoignage'])){
		UpdateImageTemoignage(UploadImage($_FILES['fileToUploadImageTemoignage']));
	}	
if(isset($_FILES['fileToUploadVideoBienvenue'])){
		UpdateVideoBienvenue(UploadVideo($_FILES['fileToUploadVideoBienvenue']));
	}	
if(isset($_FILES['fileToUploadImageFormulaire'])){
		UpdateImageFormulaire(UploadImage($_FILES['fileToUploadImageFormulaire']));
	}	


function GetHTMLBandeau($arrayNouvelles){
	
	
	$html = '';
	$html = '<div id="carouselExampleIndicators" class=" carousel slide  container pt-1" data-ride="carousel" data-interval="10000">
						<ol class="carousel-indicators">';

	for($x = 0; $x <count($arrayNouvelles);$x++){
		$html .= '<li data-target="#carouselExampleIndicators" data-slide-to="'.$x.'"';
		if($x==0){ $html .= 'class="active"'; }
		$html .= '></li>';				
	}
	$html .='</ol><div class="carousel-inner">';

	for($x = 0; $x <count($arrayNouvelles);$x++){

		$html .= '<div class="carousel-item';
		if($x==0){ $html.=' active';	}
		$html .= '">
						<div class="">
								<a onclick="parent.fnRedirectionNouvelle(\'Nouvelles/Nouvelles.php\',0,'.$arrayNouvelles[$x]->getNouvellesId().')">
									<img class="d-block w-100 h-100" src="'.$arrayNouvelles[$x]->getImagePath().'" alt="'.$arrayNouvelles[$x]->getTitle().'" title="'.$arrayNouvelles[$x]->getTitle().'">
								</a>
							</div>
						</div>';
	}
	$html.='<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		</a>
		<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
		</div>
		</div>';
	
	echo $html;

}

function GetBasPage($basPage){
	$html = '';
	if(!is_null($basPage) && !empty($basPage))
	{
		$html ='
		<div class="container mt-5">
			<div class="basPage row m-auto">
				<div class="col-md-6 col-sm-12 row m-auto">
					<div class="col-md-6 col-sm-6 col-10 m-auto">
						<a onclick="parent.fnRedirection(\'Formulaire/FormulaireBenevolat.php\',0)">
							<img class="d-block img-fluid rounded w-100 " src="'.$basPage['imageHomeliePath'] .'" alt="Homéli du curé" title="Homéli du curé">
						</a>
					</div>
					<div class="col-md-6 col-sm-6 col-10 m-auto">
						<a onclick="parent.fnRedirection(\'Formulaire/FormulaireBenevolat.php\',0)">
							<img class="d-block img-fluid rounded w-100 "  src="'.$basPage['imageTemoignagePath'] .'" alt="Témoinage" title="Témoinage">
						</a>
					</div>
				</div>
				<div class="col-md-6 col-sm-12 row m-auto">
					<div class="col-md-6 col-sm-6 col-10 m-auto">
						<div class="embed-responsive embed-responsive-4by3">
							<video class="embed-responsive-item rounded " controls="controls">
								<source src="'.$basPage['videoBienvenuePath'] .'" type="video/mp4" />
								vidéo curé
							</video>
							
						</div>
					</div>
					<div class="col-md-6 col-sm-6 col-10 m-auto">
						<a onclick="parent.fnRedirection(\'Formulaire/FormulaireBenevolat.php\',0)">
							<img class="d-block img-fluid rounded w-100"  src="'.$basPage['imageFormulairePath'] .'" alt="Formulaire Bénévolat" title="Formulaire Bénévolat">
						</a>
					</div>
				</div>
			</div>
		</div>';
	}
	echo $html;
	
}


function GetBasPageEdit($basPage){
	$html = '';
	if(!is_null($basPage) && !empty($basPage))
	{
		$html ='
		<div class="container mt-5">
			<div class="basPage row m-auto">
				<div class="col-md-6 col-sm-12 row m-auto">
					<div class="col-md-6 col-sm-6 col-10 m-auto">
							<img class="d-block img-fluid rounded w-100 " src="'.$basPage['imageHomeliePath'] .'" alt="Homéli du curé" title="Homéli du curé">
						<form  action="#" method="post" enctype="multipart/form-data">
							<label for="fileToUploadImageHomelie">Select PDF to upload:</label>
							<input type="file" name="fileToUploadImageHomelie[]" id="fileToUploadImageHomelie">
							<input type="submit" value="Upload PDF" name="submit">
						</form>
					</div>
					<div class="col-md-6 col-sm-6 col-10 m-auto">
							<img class="d-block img-fluid rounded w-100 "  src="'.$basPage['imageTemoignagePath'] .'" alt="Témoinage" title="Témoinage">
						<form  action="#" method="post" enctype="multipart/form-data">
							<label for="fileToUploadImageTemoignage">Select PDF to upload:</label>
							<input type="file" name="fileToUploadImageTemoignage[]" id="fileToUploadImageTemoignage">
							<input type="submit" value="Upload PDF" name="submit">
						</form>
					</div>
				</div>
				<div class="col-md-6 col-sm-12 row m-auto">
					<div class="col-md-6 col-sm-6 col-10 m-auto">
						<div class="embed-responsive embed-responsive-4by3">
							<video class="embed-responsive-item rounded " controls="controls">
								<source src="'.$basPage['videoBienvenuePath'] .'" type="video/mp4" />
								vidéo curé
							</video>
						</div>
							<form  action="#" method="post" enctype="multipart/form-data">
								<label for="fileToUploadVideoBienvenue">Select PDF to upload:</label>
								<input type="file" name="fileToUploadVideoBienvenue[]" id="fileToUploadVideoBienvenue">
								<input type="submit" value="Upload PDF" name="submit">
							</form>
					</div>
					<div class="col-md-6 col-sm-6 col-10 m-auto">
							<img class="d-block img-fluid rounded w-100"  src="'.$basPage['imageFormulairePath'] .'" alt="Formulaire Bénévolat" title="Formulaire Bénévolat">
						<form  action="#" method="post" enctype="multipart/form-data">
							<label for="fileToUploadImageFormulaire">Select PDF to upload:</label>
							<input type="file" name="fileToUploadImageFormulaire[]" id="fileToUploadImageFormulaire">
						<input type="submit" value="Upload PDF" name="submit">
						</form>
					</div>
				</div>
			</div>
		</div>';
	}
	echo $html;
	
}

function loadPageContent(){
	GetHTMLBandeau(NouvellesDAO::getNouvellesBandeau());	
	if(validateAdminEditing()){
		GetBasPageEdit(AccueilDAO::getBasPage());		
	}else{
		
		GetBasPage(AccueilDAO::getBasPage());		
	}
}
function UpdateImageHomelie($arrayFiles){
	$arrayMessages = array();
	$arrayUploadsDB = array();
	$arrayToReturn = array();

	for($x = 0; $x <count($arrayFiles['errors']);$x++){
		if($arrayFiles['errors'][$x][0] == 'success'){
			array_push($arrayUploadsDB,AddFeuillet($arrayFiles['pdfs'][$x]));
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
function UpdateImageTemoignage($arrayFiles){
	$arrayMessages = array();
	$arrayUploadsDB = array();
	$arrayToReturn = array();

	for($x = 0; $x <count($arrayFiles['errors']);$x++){
		if($arrayFiles['errors'][$x][0] == 'success'){
			array_push($arrayUploadsDB,AddFeuillet($arrayFiles['pdfs'][$x]));
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
function UpdateVideoBienvenue($arrayFiles){
	$arrayMessages = array();
	$arrayUploadsDB = array();
	$arrayToReturn = array();

	for($x = 0; $x <count($arrayFiles['errors']);$x++){
		if($arrayFiles['errors'][$x][0] == 'success'){
			array_push($arrayUploadsDB,AddFeuillet($arrayFiles['pdfs'][$x]));
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
function UpdateImageFormulaire($arrayFiles){
	$arrayMessages = array();
	$arrayUploadsDB = array();
	$arrayToReturn = array();

	for($x = 0; $x <count($arrayFiles['errors']);$x++){
		if($arrayFiles['errors'][$x][0] == 'success'){
			array_push($arrayUploadsDB,UpdateImgageFormulaireDB($arrayFiles['images'][$x]));
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

function DisplayMessage(){
	$Swal='<script>';
	
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


function UpdateImgageFormulaireDB($File){
	
	if(AccueilDAO::UpdateImageFormulaire($File['imagePath']) == 'success'){
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
?>
