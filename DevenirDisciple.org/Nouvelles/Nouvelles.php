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
	<link rel="stylesheet" href="../css/Bootstrap.css">
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

			var ddebut = "";
			var dfin = "";

			var check = document.getElementById('checkbox').checked == true ? 1 : 0;
			$(function() {
				if(isNaN(document.getElementById('dateDebut').value) && isNaN(document.getElementById('dateFin').value)){
					ddebut = new Date(document.getElementById('dateDebut').value);
					ddebut = ddebut.getTime() / 1000;
					dfin = new Date(document.getElementById('dateFin').value);
					dfin = dfin.getTime() / 1000;
				}
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
						if (data.trim() == 'fail') {
							Swal.fire("Une erreur c'est produite", '', 'warning');
						} else if (data.trim() == 'success') {
							Swal.fire({
								title: 'Ajout réussi.',
								icon: 'success'
							}).then((result) => {
								window.top.location.reload();
							});
						} else if (data.trim() == 'emptyFields') {
							Swal.fire("Veuillez remplir tous les champs", '', 'warning');
						}
					}
				})
			});
		}

		function fnUpdateNouvelle() {

			var check = document.getElementById('checkbox').checked == true ? 1 : 0;
			var ddebut = new Date(document.getElementById('dateDebut').value);
			ddebut = ddebut.getTime() / 1000;
			var dfin = new Date(document.getElementById('dateFin').value);
			dfin = dfin.getTime() / 1000;

			$.ajax({
				type: 'post',
				url: 'Nouvelles.php',
				data: ({
					action: 'UpdateNouvelle',
					dateDebut: ddebut,
					dateFin: dfin,
					descriptionSommaire: document.getElementById('descriptionSommaire').innerHTML,
					descriptionTotal: document.getElementById('descriptionTotal').innerHTML,
					title: document.getElementById('title').innerHTML,
					actif: check
				}),
				success: function(data) {
					if (data.trim() == 'fail') {
						Swal.fire("Une erreur c'est produite", '', 'warning');
					} else if (data.trim() == 'success') {
						Swal.fire({
							title: 'Sauvegarde réussi.',
							icon: 'success'
						}).then((result) => {
							window.top.location.reload();
						});
					}
				}
			})

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

		
		function fnDeleteConfirmation(nouvelleId) {
			Swal.fire({
				title: 'Confirmer la supression?',
        text: "Cette action est irréversible",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Supprimer'
			}).then((result) => {
				if (result.value) {
					fnDelete(nouvelleId);
				}
			})
		}

		function fnDelete(nouvelleId) {
			$.ajax({
				type: 'post',
				url: 'Nouvelles.php',
				data: ({
					action: "DeleteNouvelle",
					nouvelleId: nouvelleId
				}),
				success: function(data) {
					
					if (data.trim() == 'success') {
						Swal.fire({
							title: 'Supression effectué avec succès',
							icon: 'success'
						}).then((result) => {
							window.top.location.reload();
						});
					} else if (data.trim() == 'failDB') {
						Swal.fire("Une erreur c'est produite", 'Impossible de suprimmer le pdf de la base de donnée', 'warning');
					} else if (data.trim() == 'failFile') {
						Swal.fire("Une erreur c'est produite", 'Impossible de supprimer le fichier', 'warning');
					}
				}
			})
		}
	</script>

</head>

<body>
	<div class="content container">

		<?php

		if (validateAdminEditing()) {
			if ($_SESSION["nouvelleId"] == 0) {
				DisplayMessage();
				GetHTMLAllNouvellesEdit(NouvellesDAO::getAllNouvellesEdit());
				GetAddNouvelles();
			} else {
				GetHTMLNouvelleEdit(NouvellesDAO::getNouvelles($_SESSION["nouvelleId"]));
			}
		} else {
			if ($_SESSION["nouvelleId"] == 0) {
				GetHTMLAllnouvelles(NouvellesDAO::getAllNouvelles());
			} else {
				GetHTMLNouvelle(NouvellesDAO::getNouvelles($_SESSION["nouvelleId"]));
			}
		}

		?>
	</div>
	<?php require_once '../Footer.php'; ?>

</body>

</html>