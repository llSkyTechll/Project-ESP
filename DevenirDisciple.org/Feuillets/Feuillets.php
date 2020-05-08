<?php

require_once '../PHPFunctions.php';
require_once 'Feuillets_pr.php';
require_once '../Uploads/UploadImage.php';

?>
<!doctype html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- Bootstrap4-->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<script src="../JavaScript/JSFunction.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
	<link rel="stylesheet" href="../css/include.css">
	
	
	<title>Devenir Disciple</title>
</head>
	
	
	<script>
		/*function fnAddFeuillets() {		

			$(function() {	
				alert(document.getElementById("fileToUpload").nodeValue);
				$.ajax({
					type: 'post',
					url: 'Feuillets.php',
					data: ({
						action: 'AddNewFeuillets',
						fileToUpload: document.getElementById("fileToUpload").nodeValue
					}),
					success: function(data) {
						var newData = JSON.parse(data);
						var MessageError= 0;
						var UploadsDB= 1;
						var message = '';
						
						for(x = 0; newData.length;x++){
							if(newData[UploadsDB].succes =='succes'){
								 	
								 }
						}
						Swal.fire("Veuillez remplir tous les champs", '', 'warning');
						
						
						if (data == 'fail') {
							Swal.fire("Une erreur c'est produite", '', 'warning');
						} else if (data == 'success') {
							Swal.fire({
								title: 'Ajout réussi.',
								icon: 'success'
							}).then((result) => {
								window.top.location.reload();
							});
						} else if (data == 'emptyFields') {
							Swal.fire("Veuillez remplir tous les champs", '', 'warning');
						}
					}
				})
			});
		}*/
      $(function () {
        $('form').on('submit', function (e) {
					//alert(document.getElementById("fileToUpload").files);
					//console.dir(document.getElementById("fileToUpload").files);
					//console.dir($(document.getElementById("fileToUpload").files).serializeArray());
					//alert($("form").serializeArray());
					//alert(document.getElementById("fileToUpload").files);
				//e.preventDefault()

				 /*var files = document.getElementById("fileToUpload").files;
				 var formData = new FormData();

				for (var i = 0; i < files.length; i++) {
				//var file = files[i];
					alert(files[i]);

					formData.append('files[]', files[i]);
				}*/
					//alert(formData);
          //e.preventDefault();
					//alert($('form').serialize());
					//alert(document.getElementById("fileToUpload").files);
					//alert("reee");
					
          $.ajax({
					type: 'post',
					url: 'Feuillets.php',
					data: ({
						action: 'AddNewFeuillets',
						fileToUpload : document.getElementById("fileToUpload").files
					}),
						contentType: "multipart/form-data",
						processData: false,
					success: function(data) {
						alert(data);
              //alert('form was submitted');
            }
          });
					
					

        });
      });
	
	</script>

<body>

	

	<!--<form action="../Uploads/UploadImage.php" method="post" enctype="multipart/form-data">
    <label for="fileToUpload">Select image to upload:</label>
    <input type="file" name="fileToUpload[]" id="fileToUpload" multiple>
    <input type="submit" value="Upload Image" name="submit">
</form>-->
	<form action="javascript:void(0);" method="post" enctype="multipart/form-data">
    <label for="fileToUpload">Select PDF to upload:</label>
    <input type="file" name="fileToUpload" id="fileToUpload" multiple>
    <input type="submit" value="Upload PDF" name="submit">
</form>
	<!--<form action="../Uploads/UploadVideo.php" method="post" enctype="multipart/form-data">
    <label for="fileToUpload">Select Video to upload:</label>
    <input type="file" name="fileToUpload[]" id="fileToUpload" multiple>
    <input type="submit" value="Upload Image" name="submit">
</form>-->
	
	
	<!--lire PDF-->
	<!--<a href="../Ressource/PDF/Travail2.pdf" >ok</a>-->
	<!--Download PDF-->
	<!--<a href="../Ressource/PDF/Travail2.pdf" download>ok</a>-->
		<div class="container">
		<?php		
			loadPageContent();	
	?>
	</div>
<?php require_once '../Footer.php';?>
	
</body>


</html>
