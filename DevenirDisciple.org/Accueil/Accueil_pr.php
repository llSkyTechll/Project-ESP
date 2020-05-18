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
            <img class="d-block imageBandeau" src="'.$arrayNouvelles[$x]->getImagePath().'" alt="'.$arrayNouvelles[$x]->getTitle().'" title="'.$arrayNouvelles[$x]->getTitle().'">
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
		<div class="mt-5">
			<div class="basPage row m-auto">
				<div class="col-md-10 col-lg-6 col-sm-12 row m-auto">
					<div class="col-md-6 col-sm-6 col-10 m-auto">
						<a onclick="parent.fnRedirection(\'InformationPages/TemplateText.php\',101)">
							<img  class="rounded imageBasPageAccueil " src="'.$basPage['imageHomeliePath'] .'" alt="Homélie du curé" title="Homélie du curé">
						</a>
					</div>
					<div class="col-md-6 col-sm-6 col-10 m-auto">
            <a onclick="parent.fnRedirection(\'InformationPages/TemplateText.php\',102)">
              <img  class="rounded imageBasPageAccueil "  src="'.$basPage['imageTemoignagePath'] .'" alt="Témoinage" title="Témoinage">
            </a>
					</div>
				</div>
				<div class="col-md-10 col-lg-6 col-sm-12 row m-auto">
					<div class="col-md-6 col-sm-6 col-10 m-auto">
						<div class="embed-responsive embed-responsive-1by1">
							<video class="embed-responsive-item" controls="controls">
								<source src="'.$basPage['videoBienvenuePath'] .'" type="video/mp4" />
								vidéo curé
							</video>							
						</div>
					</div>
					<div class="col-md-6 col-sm-6 col-10 m-auto">
						<a onclick="parent.fnRedirection(\'Formulaire/FormulaireBenevolat.php\',0)">
							<img  class="rounded imageBasPageAccueil"  src="'.$basPage['imageFormulairePath'] .'" alt="Formulaire Bénévolat" title="Formulaire Bénévolat">
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
  <div class="mt-5">
    <div class="basPage row m-auto">
      <div class="col-md-10 col-lg-6 col-sm-12 row m-auto">
        <div class="col-md-6 col-sm-6 col-10 m-auto">
          <a onclick="parent.fnRedirection(\'InformationPages/TemplateText.php\',101)">
            <img  class="rounded imageBasPageAccueil " src="'.$basPage['imageHomeliePath'] .'" alt="Homélie du curé" title="Homélie du curé">
          </a>
          <form  action="#" method="post" enctype="multipart/form-data">
            <div class="form-group">
              <label for="fileToUploadImageHomelie">Sélectionner une image à télécharger:</label>
              <input type="file" name="fileToUploadImageHomelie[]" id="fileToUploadImageHomelie">
              <input class="btn btn-primary" type="submit" value="Télécharger l\'image" name="submit">
            </div>
          </form>
        </div>
        <div class="col-md-6 col-sm-6 col-10 m-auto">
          <a onclick="parent.fnRedirection(\'InformationPages/TemplateText.php\',102)">
            <img  class="rounded imageBasPageAccueil "  src="'.$basPage['imageTemoignagePath'] .'" alt="Témoinage" title="Témoinage">
          </a>
          <form  action="#" method="post" enctype="multipart/form-data">
            <div class="form-group">
              <label for="fileToUploadImageTemoignage">Sélectionner une image à télécharger:</label>
              <input type="file" name="fileToUploadImageTemoignage[]" id="fileToUploadImageTemoignage">
              <input class="btn btn-primary" type="submit" value="Télécharger l\'image" name="submit">
            </div>
          </form>
        </div>
      </div>
      <div class="col-md-10 col-lg-6 col-sm-12 row m-auto">
        <div class="col-md-6 col-sm-6 col-10 m-auto">
          <div class="embed-responsive embed-responsive-1by1">
            <video class="embed-responsive-item" controls="controls">
              <source src="'.$basPage['videoBienvenuePath'] .'" type="video/mp4" />
              vidéo curé
            </video>
          </div>
          <form  action="#" method="post" enctype="multipart/form-data">
            <div class="form-group">
              <label for="fileToUploadVideoBienvenue">Sélectionner une vidéo à télécharger:</label>
              <input type="file" name="fileToUploadVideoBienvenue[]" id="fileToUploadVideoBienvenue">
              <input class="btn btn-primary" type="submit" value="Télécharger la vidéo" name="submit">
            </div>
          </form>
        </div>
        <div class="col-md-6 col-sm-6 col-10 m-auto">
          <a onclick="parent.fnRedirection(\'Formulaire/FormulaireBenevolat.php\',0)">
            <img  class="rounded imageBasPageAccueil"  src="'.$basPage['imageFormulairePath'] .'" alt="Formulaire Bénévolat" title="Formulaire Bénévolat">
          </a>
          <form  action="#" method="post" enctype="multipart/form-data">
            <div class="form-group">
              <label for="fileToUploadImageFormulaire">Sélectionner une image à télécharger:</label>
              <input type="file" name="fileToUploadImageFormulaire[]" id="fileToUploadImageFormulaire">
              <input class="btn btn-primary" type="submit" value="Télécharger l\'image" name="submit">
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>';}
	echo $html;
	
}

function loadPageContent(){
	DisplayMessage();
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
			array_push($arrayUploadsDB,UpdateImageHomelieDB($arrayFiles['images'][$x]));
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
			array_push($arrayUploadsDB,UpdateImageTemoignageDB($arrayFiles['images'][$x]));
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
			array_push($arrayUploadsDB,UpdateVideoBienvenueDB($arrayFiles['videos'][$x]));
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
	
	if(isset($_SESSION['fileToUpload'])){
		
		if(empty($_SESSION['fileToUpload']['MessageError'])){
			$Swal.='Swal.fire({
							icon: "success",
							title: "Modification avec succès"  
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
function UpdateVideoBienvenueDB($File){	
	if(AccueilDAO::UpdateVideoBienvenue($File['videoPath']) == 'success'){
		$uploadToDb = array(
		'videoName' =>$File['videoName'],
		'succes' =>'succes'
		);
	}
	else{
		$uploadToDb = array(
		'videoName' =>$File['videoName'],
		'succes' =>'fail'
		);
		
	}
	return $uploadToDb;
}
function UpdateImageHomelieDB($File){
	
	if(AccueilDAO::UpdateImageHomelie($File['imagePath']) == 'success'){
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
function UpdateImageTemoignageDB($File){
	
	if(AccueilDAO::UpdateImageTemoignage($File['imagePath']) == 'success'){
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
