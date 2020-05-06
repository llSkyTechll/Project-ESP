<?php
  require_once 'Class/clsAdmin.php';
?>
<footer class="mt-3">
	<script>
		if (window.top === window.self) {
			window.top.location.replace('Menu.php');
		}

	</script>
	<div class="container pt-3" >
		<div class="row">
			<div class="col-md-2">
				<img class="d-block img-fluid" style="widht: 100px;height:100px" src="../Ressource/Image/Logo_St-Jean-Paul_II.jpg" alt="Logo St-Jean-Paul II" title="Logo St-Jean-Paul II">
				<img class="d-block img-fluid" style="widht: 100px;height:100px" src="../Ressource/Image/Logo_SGS.png" alt="Logo SGS" title="Logo SGS">
			</div>

			<div class="col-md-4">
				<input class="btn btn-primary" type="button" name="btnDeconnexion" value="lien intéressant">
			</div>
			<div class="col-md-4">
				<input class="btn btn-primary" type="button" name="btnDeconnexion" value="contact">
			</div>
			<div class="col-md-2">
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

</footer>
