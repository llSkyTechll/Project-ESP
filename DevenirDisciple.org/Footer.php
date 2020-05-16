<?php
  require_once 'Class/clsAdmin.php';
?>
<footer class="mt-3">
	<script>
		if (window.top === window.self) {
			window.top.location.replace('Menu.php');
		}

	</script>
	<div class="container pt-3 pb-3">
		<div class="row">
			<div class="col-md-4 col-sm-5 col-6">
				<div class="row text-center">
					<img class="d-block img-fluid" style="widht: 100px;height:100px" src="../Ressource/Image/Logo_St-Jean-Paul_II.jpg" alt="Logo St-Jean-Paul II" title="Logo St-Jean-Paul II">
					<img class="d-block img-fluid" style="widht: 100px;height:100px" src="../Ressource/Image/Logo_SGS.png" alt="Logo SGS" title="Logo SGS">
				</div>
			</div>

			<div class="row col-md-8 col-sm-7 col-6">
				<div class="col-md-4 col-sm-6 col-12 mb-1">
					<div class="text-center">
						<input class="btn btn-primary" type="button" name="btnLiensInteressants" value="Liens intéressants" onclick="parent.fnRedirection('InformationPages/TemplateText.php', 100);">
					</div>
				</div>
				<div class="col-md-4 col-sm-6 col-12 mb-1">
					<div class="text-center">
						<input class="btn btn-primary" type="button" name="btnContact" value="Contactez-nous" onclick="parent.fnRedirection('Formulaire/FormulaireContact.php', 0);">
					</div>
				</div>
				<div class="col-md-4 col-sm-6 col-12 ">
					<div class="text-center">
						<?php 
							if(Admin::isConnected()){
								echo '<input class="btn btn-primary" type="button" name="btnDeconnexion" onclick="parent.fnDeconnexion()" value="Déconnexion">';
							}else{
								echo '<input  class="btn btn-primary" type="button" name="btnConnexion" onclick="parent.fnRedirection(\'Connexion/ConnexionAdmin.php\',0)" value="Connexion">';
							}
						?>
					</div>
				</div>

			</div>
		</div>

	</div>

</footer>
