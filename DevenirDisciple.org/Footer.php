<footer>
  <script>
    if (window.top === window.self){
      window.top.location.replace('Menu.php');
    }
  </script>
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