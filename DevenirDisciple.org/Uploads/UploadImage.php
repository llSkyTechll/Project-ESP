<?php
	$target_dir = "../Ressource/Image/";
	
	//print_r($_FILES["fileToUpload"]);
	/*print_r($_FILES["fileToUpload"]["name"]);
	print_r($_FILES["fileToUpload"]["type"]);
	print_r($_FILES["fileToUpload"]["tmp_name"]);
	print_r($_FILES["fileToUpload"]["error"]);
	print_r($_FILES["fileToUpload"]["size"]);*/
//echo(count($_FILES["fileToUpload"]["name"]));

/*$phpFileUploadErrors = array(
    0 => 'There is no error, the file uploaded with success',
    1 => 'The uploaded file exceeds the upload_max_filesize directive in php.ini',
    2 => 'The uploaded file exceeds the MAX_FILE_SIZE directive that was specified in the HTML form',
    3 => 'The uploaded file was only partially uploaded',
    4 => 'No file was uploaded',
    6 => 'Missing a temporary folder',
    7 => 'Failed to write file to disk.',
    8 => 'A PHP extension stopped the file upload.',
);*/

for($x = 0; $x <count($_FILES["fileToUpload"]["name"]);$x++ ){
	
echo($phpFileUploadErrors[$_FILES["fileToUpload"]["error"][$x]]);
	$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"][$x]);
	$uploadOk = 1;
	$file_type=$_FILES['fileToUpload']['type'][$x];
	if(isset($_POST["submit"])) {
			$check = getimagesize($_FILES["fileToUpload"]["tmp_name"][$x]);

			if($check !== false) {
					echo "File is an image - " . $check["mime"] . ".";
					$uploadOk = 1;
			} else {
					echo "File is not an image.";
					$uploadOk = 0;
			}
	}
	if (file_exists($target_file)) {
			echo "Sorry, file already exists.";
			$uploadOk = 0;
	}
	// Check file size
	if ($_FILES["fileToUpload"]["size"][$x] > 2000000) {
			echo "Sorry, your file is too large.";
			$uploadOk = 0;
	}

	if($file_type != "image/jpg" && $file_type != "image/png" && $file_type != "image/jpeg"
	&& $file_type != "image/gif" )
	{
			echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
			$uploadOk = 0;
	}
	if ($uploadOk == 0) {
			echo "Sorry, your file was not uploaded.";
	} else {
			if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"][$x], $target_file)) {
					echo "The file ". basename( $_FILES["fileToUpload"]["name"][$x]). " has been uploaded.";
			} else {
					echo "Sorry, there was an error uploading your file.";
			}
	}
	
	echo'<br><br><br>';
	}




?>
