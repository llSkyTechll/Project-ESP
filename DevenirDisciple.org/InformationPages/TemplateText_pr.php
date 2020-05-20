<?php

require_once '../PHPFunctions.php';

require_once '../Class/clsTemplateTextDAO.php';

require_once '../Uploads/UploadImage.php';

if (isset($_POST['action'])){
  switch($_POST['action']){
  case 'saveContent':
      FNSavePageContent();
  }
}

if(isset($_FILES['fileToUpload'])){
		UpdateImageTemplateText(UploadImage($_FILES['fileToUpload']));
}	
function FNSavePageContent(){  

  if (Admin::isConnected()){
    $title    = $_POST['title'];
    $header   = $_POST['header'];
    $subtitle = $_POST['subtitle'];
    $content  = $_POST['content'];
    
    TemplateTextDAO::savePageContent($_POST['contentId'], $_SESSION['gmenuId'], $title, $header, $subtitle, $content);  
    
    exit ('success');
  }
  exit ('admin');
  
}

function UpdateImageTemplateText($arrayFiles){
	$arrayMessages = array();
	$arrayUploadsDB = array();
	$arrayToReturn = array();

	for($x = 0; $x <count($arrayFiles['errors']);$x++){
		if($arrayFiles['errors'][$x][0] == 'success'){
			array_push($arrayUploadsDB,UpdateImageTemplateTextDB($arrayFiles['images'][$x]));
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

function UpdateImageTemplateTextDB($File){
	
	if(TemplateTextDAO::UpdateImageTemplateText($_SESSION['gmenuId'],$File['imagePath']) == 'success'){
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
function 	DisplayMessage(){
	$Swal='<script>';
	
	if(isset($_SESSION['fileToUpload'])){
		
		if(empty($_SESSION['fileToUpload']['MessageError'])){
			$Swal.='Swal.fire({
							icon: "success",
							title: "Ajout/Modification avec succès"  
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


function arrayMessageError($message){
	$arrayMessage = array();
	for($x = 0; $x <count($message);$x++){
		array_push($arrayMessage,$message[$x]);				
	}

	return $arrayMessage;
}




?>
