<?php

require_once '../ConnexionDB.php';

require_once 'Nouvelles_pr.php';


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
	<link rel="stylesheet" href="../css/includeCalendar.css">
	<link rel="stylesheet" href="../css/include.css">



	<script src="../JavaScript/DatePickerCalendar.js"></script>
	<script src="../JavaScript/LanguageCalendar.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>


	<title>Devenir Disciple</title>

	<script>
		function fnSaveNouvelle() {
		
			var check = document.getElementById('checkbox').checked == 'true' ? 1 : 0;

			$(function() {
				var ddebut = new Date(document.getElementById('dateDebut').value);
				ddebut = ddebut.getTime() / 1000;
				var dfin = new Date(document.getElementById('dateFin').value);
				dfin = dfin.getTime() / 1000;
				$.ajax({
					type: 'post',
					url: 'Nouvelles.php',
					data: ({
						action: 'saveNouvelles',
						imageSommaire: document.getElementById('imageSommaire').src,
						dateDebut: ddebut,
						dateFin: dfin,
						descriptionSommaire: document.getElementById('descriptionSommaire').innerHTML,
						descriptionTotal: document.getElementById('descriptionTotal').innerHTML,
						title: document.getElementById('title').innerHTML,
						actif: check
					}),
					success: function(data) {
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
		}
		
			function fnUpdateNouvelle() {
			$(function() {
				var check = document.getElementById('checkbox').checked == true ? 1 : 0;
				var ddebut = new Date(document.getElementById('dateDebut').value);
				ddebut = ddebut.getTime() / 1000;
				var dfin = new Date(document.getElementById('dateFin').value);
				dfin = dfin.getTime() / 1000;
				$.ajax({
					type: 'post',
					url: 'Nouvelles.php',
					data: ({
						action: 'saveNouvelles',
						imageSommaire: document.getElementById('imageSommaire').src,
						dateDebut: ddebut,
						dateFin: dfin,
						descriptionSommaire: document.getElementById('descriptionSommaire').innerHTML,
						descriptionTotal: document.getElementById('descriptionTotal').innerHTML,
						title: document.getElementById('title').innerHTML,
						actif: check
					}),
					success: function(data) {
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
		}

		function fnAddPicture() {
			$(function() {
				$.ajax({
					type: 'post',
					url: '../Uploads/UploadImage.php',
					data: ({
						action: 'UploadImage',
						imageSommaire: document.getElementById('imageSommaire').src,
						dateDebut: document.getElementById('dateDebut').value,
						dateFin: document.getElementById('dateFin').value,
						descriptionSommaire: document.getElementById('descriptionSommaire').value,
						descriptionTotal: document.getElementById('descriptionTotal').value
					}),
					success: function(data) {
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
		}

		function fnAddNouvelle() {
			var nouvelleEdit = document.getElementById("NouvelleEdit");
			var addNouvelles = document.getElementById("addNouvelles");
			var btnAddNouvelle = document.getElementById("btnAddNouvelle");
			$(nouvelleEdit).addClass("d-none");
			$(btnAddNouvelle).addClass("d-none");
			$(addNouvelles).removeClass("d-none");


		}

		jQuery(document).ready(function() {
			jQuery('.datetimepicker').datepicker({
				timepicker: true,
				language: 'en'
				
				
				
			});
		});

	</script>

</head>

<body>
	<div class="container">
		<?php		
			if(validateAdminEditing()){
				if($_SESSION["nouvelleId"] == 0){
					GetHTMLAllNouvellesEdit(NouvellesDAO::getAllNouvelles());
					GetAddNouvelles();
				}
				else{
					GetHTMLNouvelleEdit(NouvellesDAO::getNouvelles($_SESSION["nouvelleId"]));
				}
			}
			else{
				if($_SESSION["nouvelleId"] == 0){
					GetHTMLAllnouvelles(NouvellesDAO::getAllNouvelles());
				}
				else{
					GetHTMLNouvelle(NouvellesDAO::getNouvelles($_SESSION["nouvelleId"]));
				}
			}		
		
	?>
	</div>
	<?php require_once '../Footer.php';?>

</body>

</html>
