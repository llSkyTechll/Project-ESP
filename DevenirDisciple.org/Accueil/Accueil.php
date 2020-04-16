<?php

require_once '../PHPFunctions.php';

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
</head>


<body>

	<div id="carouselExampleIndicators" class="carousel slide w-50 container" data-ride="carousel" data-interval="10000">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block img-fluid" style="widht: 1000px;height:400px" src="../Ressource/Image/jesus1.jpg" alt="Première Nouvelle" title="Première Nouvelle">
			</div>
			<div class="carousel-item">
				<img class="d-block img-fluid" style="widht: 1000px;height:400px" src="../Ressource/Image/jesus2.jpg" alt="Deuxième Nouvelle" title="Deuxième Nouvelle">
			</div>
			<div class="carousel-item">
				<img class="d-block img-fluid" style="widht: 1000px;height:400px" src="../Ressource/Image/jesus3.jpg" alt="Third Nouvelle" title="Third Nouvelle">
			</div>
			<div class="carousel-item">
				<img class="d-block img-fluid" style="widht: 1000px;height:400px" src="../Ressource/Image/jesus4.jpg" alt="Quatrième Nouvelle" title="Quatrième Nouvelle">
			</div>
			<div class="carousel-item">
				<img class="d-block img-fluid" style="widht: 1000px;height:400px" src="../Ressource/Image/jesus5.jpg" alt="Cinquième Nouvelle" title="Cinquième Nouvelle">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		</a>
		<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>

	<div class="container mt-5">
		<div class="row">
			<div class="col-md-3">
				<!--<p>oméli du curé</p>-->
				<a onclick="parent.fnRedirection('Formulaire/FormulaireBenevolat.php',0)">
					<img class="d-block img-fluid" style="widht: 150px;height:150px" src="../Ressource/Image/homelie.jpg" alt="Homéli du curé" title="Homéli du curé">
				</a>


			</div>
			<div class="col-md-3">
				<a onclick="parent.fnRedirection('Formulaire/FormulaireBenevolat.php',0)">
					<img class="d-block img-fluid" style="widht: 150px;height:150px" src="../Ressource/Image/temoignages.jpg" alt="Témoinage" title="Témoinage">
				</a>
				
			</div>
			<div class="col-md-3">
				<div class="embed-responsive embed-responsive-4by3">
					<video class="embed-responsive-item" controls="controls">
						<source src="../Ressource/Video/jesus-taime.mp4" type="video/mp4" />
						vidéo curé
					</video>
				</div>

			</div>
			<div class="col-md-3">
				<a onclick="parent.fnRedirection('Formulaire/FormulaireBenevolat.php',0)">
					<img class="d-block img-fluid" style="widht: 150px;height:150px" src="../Ressource/Image/formulaire.png" alt="Formulaire Bénévolat" title="Formulaire Bénévolat">
				</a>
				
			</div>
		</div>

	</div>

	<?php require_once '../Footer.php';?>
</body>


</html>
