<footer>

  <?php require('PHPFunctions.php'); ?>

  <div>
      <div>
          <a href="#">Logo 1</a>
          <a href="#">Logo 2</a>
      </div>

      <div>
          <p>lien intérésent</p>
      </div>
      <div>
          <p>contact</p>
      </div>
      <div>
          <input class="btn btn-primary" type="button" name="btnConnexion" onclick="fnRedirection('Formulaire/FormulaireBenevolat.php',5)" value="FormulaireBenevolat">
      </div>
      <div>
        <?php 
          if($_SESSION["gadminId"] <> 0){
            echo '<input class="btn btn-primary" type="button" name="btnDeconnexion" onclick="parent.fnDeconnexion()" value="Déconnexion">';
          }else{
            echo '<input  class="btn btn-primary" type="button" name="btnConnexion" onclick="parent.fnRedirection(\'Connexion/ConnexionAdmin.php\',5)" value="Connexion">';
          }
        ?>
      </div>
  </div>

</footer>