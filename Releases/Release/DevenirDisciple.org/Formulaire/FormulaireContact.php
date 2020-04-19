<!--Template pour les pages dans le iframe de menu-->

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
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>


	<h1>Écrivez-nous</h1>
	<form class="container col-md-6" id="formConnexion">
		<div class="form-group row">
			<div class="col-md-6">
				<label for="ffirstname" class=" col-form-label">Votre prénom</label>

				<input type="text" class="form-control" id="ffirstname" name="ffirstname" tabindex="10" placeholder="Prénom">
			</div>
			<div class="col-md-6">
				<label for="flastname" class=" col-form-label">Votre nom</label>
				<input type="text" class="form-control" id="flastname" name="flastname" tabindex="20" placeholder="Nom">
			</div>
		</div>
		<div class="form-group row">
			<div class="col-md-6">
				<label for="fcourriel" class=" col-form-label">Votre adresse courriel</label>
				<input type="text" class="form-control" id="fcourriel" name="fcourriel" tabindex="30" placeholder="courriel">
			</div>
			<div class="col-md-6">
				<label for="ftelephone" class="col-form-label">Votre numéro de téléphone</label>
				<input type="text" class="form-control" id="ftelephone" name="ftelephone" tabindex="40" placeholder="numéro de téléphone">
			</div>
		</div>
		<div class="form-group row">
			<div class="col-md-12">
				<label for="fmessage" class="col-md-6 col-form-label">Votre message</label>
				<textarea class="form-control" id="fmessage" name="fmessage" placeholder="Votre message" tabindex="50"></textarea>
			</div>

		</div>

	</form>

</body>

</html>
