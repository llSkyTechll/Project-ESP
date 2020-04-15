<footer class="mt-3">
  <script>
    if (window.top === window.self){
      window.top.location.replace('Menu.php');
    }
  </script>
  <div class="container">
      <div class="row">
        <div class="col-md-2">
            <a href="#">Logo 1</a>
            <a href="#">Logo 2</a>
        </div>

        <div class="col-md-4">
            <input class="btn btn-primary" type="button" name="btnDeconnexion" value="lien intérésent">
        </div>
        <div class="col-md-4">
            <input class="btn btn-primary" type="button" name="btnDeconnexion" value="contact">
        </div>
        <div class="col-md-2">
            <?php 
                if($_SESSION["gadminId"] <> 0){
                    echo '<input class="btn btn-primary" type="button" name="btnDeconnexion" onclick="parent.fnDeconnexion()" value="Déconnexion">';
                }else{
                    echo '<input  class="btn btn-primary" type="button" name="btnConnexion" onclick="parent.fnRedirection(\'Connexion/ConnexionAdmin.php\',0)" value="Connexion">';
                }
            ?>
        </div>
      
      </div>
      
  </div>

</footer>