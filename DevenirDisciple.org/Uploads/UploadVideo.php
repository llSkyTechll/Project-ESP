<?php

function UploadVideo($FILES){
	$target_dir = "../Ressource/Video/";
		if (!file_exists($target_dir)) {
    mkdir($target_dir, 0777, true);
	}
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
	
	for($x = 0; $x <count($FILES["name"]);$x++ ){
		$arrayError = array();	
		$arrayImage = array();
		
		
		$target_file = $target_dir . basename($FILES["name"][$x]);
		$uploadOk = 1;
		$file_type=$FILES['type'][$x];
		
		if($FILES["error"][$x] == 0){
						
			if (file_exists($target_file)) {
				array_push($arrayError,"Désolé, le fichier existe déjà.");
				$uploadOk = 0;
			}
			
			if ($FILES["size"][$x] > 200000000) {
				array_push($arrayError, "Désolé, seul les fichier moins de 200Mo sont accespté.");
				$uploadOk = 0;
			}
			if($file_type != "video/mp4" &&
				 $file_type != "video/quicktime" &&
				 $file_type != "video/avi" &&
				 $file_type != "video/webm" ){
				array_push($arrayError, "Sorry, mp4, MOV, AVI, WEBM are allowed.");
				$uploadOk = 0;
			}
			
			
			if ($uploadOk != 0 )  {
				if (move_uploaded_file($FILES["tmp_name"][$x], $target_file)) {

				$arrayImage = array(
					'videoPath' => $target_file,
					'videoName' => basename($FILES["name"][$x])
				);
				array_push($arrayError,"success");
				} 
				else{
						array_push($arrayError,  "Sorry, there was an error uploading your file.");
				}
			}
		}
		else{			
			array_push($arrayError,$phpFileUploadErrors[$FILES["error"][$x]]);
		}
		array_push($arrayErrors,$arrayError);
		array_push($arrayImages,$arrayImage);

	}
	
$arrayToReturn = array(
					'errors' => $arrayErrors,
					'videos' => $arrayImages
				);
return $arrayToReturn;
}

?>


