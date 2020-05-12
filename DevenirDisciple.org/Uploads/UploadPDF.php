<?php


function UploadPDF(){
	$target_dir = "../Ressource/PDF/";
	$arrayErrors = array();
	$arrayPdfs = array();
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
			if (file_exists($target_file)) {
				array_push($arrayError,"Désolé, le fichier existe déjà.");
				$uploadOk = 0;
			}
			if($file_type!="application/pdf" ) {
				echo "Sorry, PDF are allowed.";
				$uploadOk = 0;
			}
			if ($uploadOk == 0 ) {
				array_push($arrayError,"Désolé, votre fichier n'a pas été télécharger.");
			} 
			else {
				if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"][$x], $target_file)) {

				$arrayPdf = array(
					'pdfPath' => $target_file,
					'pdfName' => basename($_FILES["fileToUpload"]["name"][$x]),
					'actif' => 0,
					'orderDisplay' => 0,
					'size' => formatSizeUnits($_FILES["fileToUpload"]["size"][$x])
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
		array_push($arrayPdfs,$arrayPdf);

	}
	
$arrayToReturn = array(
					'errors' => $arrayErrors,
					'pdfs' => $arrayPdfs
				);
return $arrayToReturn;
}

function formatSizeUnits($bytes){

	if ($bytes >= 1073741824)
	{
			$bytes = number_format($bytes / 1073741824, 2) . ' Go';
	}
	elseif ($bytes >= 1048576)
	{
			$bytes = number_format($bytes / 1048576, 2) . ' Mo';
	}
	elseif ($bytes >= 1024)
	{
			$bytes = number_format($bytes / 1024, 2) . ' Ko';
	}
	elseif ($bytes > 1)
	{
			$bytes = $bytes . ' Octets';
	}
	elseif ($bytes == 1)
	{
			$bytes = $bytes . ' Octet';
	}
	else
	{
			$bytes = '0 Octets';
	}

	return $bytes;
}
?>
