<!--Template pour les pages dans le iframe de menu-->
<?php

require_once '../ConnexionDB.php';

require_once 'Nouvelles_pr.php';

function GetHmtlBandeau($arrayNouvelles){
	
	//print_r($arrayNouvelles[0]);
	$html = '';
	$html = '<div id="carouselExampleIndicators" class="carousel slide w-50 container" data-ride="carousel" data-interval="10000">
						<ol class="carousel-indicators">';

	for($x = 0; $x <count($arrayNouvelles);$x++){
		$html .= '<li data-target="#carouselExampleIndicators" data-slide-to="'.$x.'"';
		if($x==0){ $html .= 'class="active"'; }
		$html .= '></li>';				
	}
	$html .='</ol><div class="carousel-inner">';

	for($x = 0; $x <count($arrayNouvelles);$x++){

		$html .= '<div class="carousel-item';
		if($x==0){ $html.=' active';	}
		$html .= '">
						<img class="d-block img-fluid" style="widht: 1000px;height:400px" src="'.$arrayNouvelles[$x]->getImagePath().'" alt="'.$arrayNouvelles[$x]->getTitle().'" title="'.$arrayNouvelles[$x]->getTitle().'">
						</div>';
	}
	$html.='<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		</a>
		<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
		</div>
		</div>';
	
	echo $html;

}

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
	<link rel="stylesheet" href="../css/include.css">


	<title>Devenir Disciple</title>

	<script>
		function fnAddNouvelle() {
			$(function() {
				$.ajax({
					type: 'post',
					url: 'ParoissesCommunaute.php',
					data: ({
						action: 'addEvent',
						name: document.getElementById('ename').value,
						date: document.getElementById('edate').value,
						description: document.getElementById('edesc').value,
						color: document.getElementById('ecolor').value,
						icon: document.getElementById('eicon').value,
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

	</script>

</head>

<body>
	<?php
		GetHmtlBandeau(NouvellesDAO::getAllNouvelles());	
	?>


	
<div class="d-none">
	
	<div id="imageSommaire">
		<!-- faire le get pour l'image et la faire afficher-->
	</div>
	<div id="date">
		<!-- faire le get pour l'image et la faire afficher-->
	</div>
	<div>
		<label for="descriptionSommaire">Description Sommaire</label>
		<p id="descriptionSommaire" contentEditable></p>
	</div>
	<div>
		<label for="descriptionTotal">Description Complète</label>
		<p id="descriptionTotal" contentEditable></p>
	</div>

	<button type="button" class="btn btn-primary" onclick="fnAddNouvelle();">Enregistrer</button>
</div>

</body>

</html>
