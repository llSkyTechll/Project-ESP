<?php
  require_once 'Class/clsAdmin.php';
?>
<footer class="mt-3">
	<script>
		if (window.top === window.self) {
			window.top.location.replace('Menu.php');
		}

	</script>
	<div class="container">
		<div class="row">
			<div class="col-md-2">
				<img class="d-block img-fluid" style="widht: 100px;height:100px" src="../Ressource/Image/Logo_St-Jean-Paul_II.jpg" alt="Logo St-Jean-Paul II" title="Logo St-Jean-Paul II">
				<img class="d-block img-fluid" style="widht: 100px;height:100px" src="../Ressource/Image/Logo_SGS.png" alt="Logo SGS" title="Logo SGS">
			</div>

			<div class="col-md-4">
				<input class="btn btn-primary" type="button" name="btnDeconnexion" value="lien intérésent">
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
    
    <div id="block-block-9" class="block block-block region-odd even region-count-1 count-2">
      <div class="block-inner">
        <h2 class="block-title">Don en ligne</h2>
        <div class="block-content">
          <div class="block-content-inner">
            <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
              <input name="cmd" type="hidden" value="_s-xclick"> 
              <input name="hosted_button_id" type="hidden" value="DMYLJ8APSPW2A"> <input alt="Donate with PayPal button" border="0" name="submit" src="https://www.paypalobjects.com/fr_CA/i/btn/btn_donateCC_LG.gif" title="PayPal - The safer, easier way to pay online!" type="image"> 
              <img alt="" border="0" height="1" src="https://www.paypal.com/fr_CA/i/scr/pixel.gif" width="1" style="display: none !important;">
            </form>
          </div>
        </div>
      </div>
    </div>

	</div>

</footer>
