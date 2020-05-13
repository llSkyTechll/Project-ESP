<?php

function UploadImage(){
	$target_dir = "../Ressource/Image/";
	$arrayErrors = array();
	$arrayImages = array();
	$phpFileUploadErrors = array(
		0 => 'There is no error, the file uploaded with success',
		1 => 'The uploaded file exceeds the upload_max_filesize directive in php.ini',
		2 => 'The uploaded file exceeds the MAX_FILE_SIZE directive that was specified in the HTML form',
		3 => 'The uploaded file was only partially uploaded',
		4 => 'No file was uploaded',
		6 => 'Missing a temporary folder',
		7 => 'Failed to write file to disk.',
		8 => 'A PHP extension stopped the file upload.',
	);
	
	for($x = 0; $x <count($_FILES["fileToUpload"]["name"]);$x++ ){
	$arrayError = array();	
		$arrayPdf = array();
		
		
		$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"][$x]);
		$uploadOk = 1;
		$file_type=$_FILES["fileToUpload"]['type'][$x];
		
		if($_FILES["fileToUpload"]["error"][$x] == 0){
			
			$check = getimagesize($_FILES["fileToUpload"]["tmp_name"][$x]);

			if($check !== true) {
					array_push($arrayError, "Le fichier n\'est pas une image.");
				$uploadOk = 0;
			} 
			
			if (file_exists($target_file)) {
				array_push($arrayError,"Désolé, le fichier existe déjà.");
				$uploadOk = 0;
			}
			
			if ($_FILES["fileToUpload"]["size"][$x] > 2000000) {
				array_push($arrayError, "Désolé, seul les fichier moins de 2Mo sont accespté.");
				$uploadOk = 0;
			}
			if($file_type != "image/jpg" && $file_type != "image/png" && $file_type != "image/jpeg"
			&& $file_type != "image/gif" )
			{
				array_push($arrayError, "Sorry, only JPG, JPEG, PNG & GIF files are allowed.");
				$uploadOk = 0;
			}
			
			
			if ($uploadOk == 0 ) {
				array_push($arrayError,"Désolé, votre fichier n'a pas été télécharger.");
			} 
			else {
				if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"][$x], $target_file)) {

				$arrayImage = array(
					'imagePath' => $target_file
				);
				array_push($arrayError,"success");
				} 
				else{
						echo "Sorry, there was an error uploading your file.";
				}
			}
		}
		else{			
			array_push($arrayError,$phpFileUploadErrors[$_FILES["fileToUpload"]["error"][$x]]);
		}
		array_push($arrayErrors,$arrayError);
		array_push($arrayImages,$arrayImage);

	}
	
$arrayToReturn = array(
					'errors' => $arrayErrors,
					'images' => $arrayImages
				);
return $arrayToReturn;
}

?>


