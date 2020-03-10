<?php

include 'PHPFunctions.php';

include 'Connection.php';  //Garder les includes dans cet ordre

include 'Menu_pr.php';

?>
<!doctype html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <title>Devenir Disciple</title>
  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script>
    function fnRedirection(Path, menuId) {
      document.getElementById('PageContent').src = Path;
      $(function() {
        $.ajax({
          type: 'post',
          url: 'Menu.php',
          data: ({action: 'redirect',menuId: menuId })
        });
      });
    }

  </script>
</head>

<body>
    <ul>
      <?php

      $SQL = "SELECT menu.menuId FROM menu INNER JOIN menu m2 ON m2.parentId = menu.menuid WHERE menu.parentId <> 0";
      $RSSQL = $conn->query($SQL);

      $SQL = "SELECT menu.menuId, menu.name, menu.redirectionPath FROM menu";
      $RSSQL2 = $conn->query($SQL);

      if ($RSSQL2->num_rows > 0){
        while ($Row = $RSSQL2->fetch_assoc()){
          echo ('<li><a  onclick="fnRedirection(\''.$Row['redirectionPath'].'\','.$Row['menuId'].')">'. $Row['name'].'</a></li>');
          if ($Row['menuId'] == $_SESSION["gmenuId"]){
            $path = $Row['redirectionPath'];
          }
        }
      }
    
      ?>
    </ul>
  <iframe id="PageContent" src="<?php if(isset($path)){echo $path;}else{echo 'Accueil/Accueil.php';}?>" frameborder="0" style="width:100%;height:100%"></iframe>
</body>

</html>
