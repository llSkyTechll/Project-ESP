<?php
	$target_dir = "../Ressource/Video/";



for($x = 0; $x <count($_FILES["fileToUpload"]["name"]);$x++ ){

	$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"][$x]);
	$uploadOk = 1;
	$file_type=$_FILES['fileToUpload']['type'][$x];

	// Check if image file is a actual image or fake image
	/*if(isset($_POST["submit"])) {
			$check = getimagesize($_FILES["fileToUpload"]["tmp_name"]);

			if($check !== false) {
					echo "File is an image - " . $check["mime"] . ".";
					$uploadOk = 1;
			} else {
					echo "File is not an image.";
					$uploadOk = 0;
			}
	}*/
	// Check if file already exists
	if (file_exists($target_file)) {
			echo "Sorry, file already exists.";
			$uploadOk = 0;
	}
	// Check file size
	/*if ($_FILES["fileToUpload"]["size"] > 2000000) {
			echo "Sorry, your file is too large.";
			$uploadOk = 0;
	}*/

	// Allow certain file formats
	
	if($file_type != "video/mp4" && $file_type != "video/quicktime" && $file_type != "video/avi"
	&& $file_type != "video/webm" ){
			echo "Sorry, mp4, MOV, AVI, WEBM are allowed.";
			$uploadOk = 0;
	}
	// Check if $uploadOk is set to 0 by an error
	if ($uploadOk == 0) {
			echo "Sorry, your file was not uploaded.";
	// if everything is ok, try to upload file
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
