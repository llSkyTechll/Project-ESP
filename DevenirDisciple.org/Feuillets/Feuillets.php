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
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>


	<title>Devenir Disciple</title>


	<script>
		function fnSaveFeuillets() {

			var allArray = [];
			var allOrderDisplay = document.querySelectorAll("input[type = number]");
			var allVisible = document.querySelectorAll("input[type = checkbox]");
			for (var x = 0; x < allOrderDisplay.length; x++) {
				var OrderDispay = allOrderDisplay[x].id;
				var index = OrderDispay.indexOf("_");
				var id = OrderDispay.substring(index + 1, OrderDispay.lenght);
				var array = [id, allVisible[x].checked ? 1 : 0, allOrderDisplay[x].value];
				allArray.push(array);
			}

			$.ajax({
				type: 'post',
				url: 'Feuillets.php',
				data: ({
					action: 'SaveFeuillets',
					arrayFeuillet: JSON.stringify(allArray)
				}),
				success: function(data) {

					if (data == 'fail') {
						Swal.fire("Une erreur c'est produite", '', 'warning');
					} else if (data == 'success') {
						Swal.fire({
							title: 'Sauvegarde réussi.',
							icon: 'success'
						}).then((result) => {
							window.top.location.reload();
						});
					}
				}
			});

		}

		function fnDeleteConfirmation(FeuilletId) {
			Swal.fire({
				title: 'Are you sure?',
				text: "You won't be able to revert this!",
				icon: 'warning',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: 'Yes, delete it!'
			}).then((result) => {
				if (result.value) {
					fnDelete(FeuilletId);
				}
			})
		}

		function fnDelete(FeuilletId) {
			$.ajax({
				type: 'post',
				url: 'Feuillets.php',
				data: ({
					action: "DeleteFeuillets",
					FeuilletId: FeuilletId
				}),
				success: function(data) {
					
					if (data == 'success') {
						Swal.fire({
							title: 'Supression effectué avec succès',
							icon: 'success'
						}).then((result) => {
							window.top.location.reload();
						});
					} else if (data == 'failDB') {
						Swal.fire("Une erreur c'est produite", 'Impossible de suprimmer le pdf de la base de donnée', 'warning');
					} else if (data == 'failFile') {
						Swal.fire("Une erreur c'est produite", 'Impossible de supprimer le fichier', 'warning');
					}
				}
			})
		}

	</script>

</head>



<body>
	<div class="container">
		<?php		
			loadPageContent();	
	?>
	</div>
	<?php require_once '../Footer.php';?>

</body>


</html>
