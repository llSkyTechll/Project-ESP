<?php

include 'PHPFunctions.php';

include 'ConnectionDB.php';  //Garder les includes dans cet ordre

include 'Menu_pr.php';

?>
  <!doctype html>
  <html lang="en">

  <head>
    <meta charset="UTF-8">
    <title>Devenir Disciple</title>
    <!--<link rel="stylesheet" type="text/css" href="myStyle.css" />-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="css/include.css">
    
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script>
      function fnRedirection(Path, menuId) {
        document.getElementById('PageContent').src = Path;
        $(function() {
          $.ajax({
            type: 'post',
            url: 'Menu.php',
            data: ({
              action: 'redirect',
              menuId: menuId
            })
          });
        });
      }

    </script>
  </head>

  <body>
    <ul>
      <?php

        $SQL = "SELECT menu.menuId, menu.name, menu.redirectionPath FROM menu where parentId = 0";
        $RSSQL2 = $conn->query($SQL);

        if ($RSSQL2->num_rows > 0){
          while ($Row = $RSSQL2->fetch_assoc()){
            $width = 100/($RSSQL2->num_rows + 1); 
            echo ('<li class="dropdown" style=width:'.$width.'%;> <a  onclick="fnRedirection(\''.$Row['redirectionPath'].'\','.$Row['menuId'].')">'. $Row['name'].'</a>');
            echo('<ul class="dropdown-content">');
            $SQL = "SELECT * from menu where parentId = ".$Row["menuId"]." order by sequence,name ";
            $RSSQL = $conn->query($SQL);

            while ($Row = $RSSQL->fetch_assoc()){
              echo ('<li><a  onclick="fnRedirection(\''.$Row['redirectionPath'].'\','.$Row['menuId'].')">'. $Row['name'].'</a></li>');
              if ($Row['menuId'] == $_SESSION["gmenuId"]){
              $path = $Row['redirectionPath'];
              }
            }
            echo('</ul>');          
            echo('</li>');
            if ($Row['menuId'] == $_SESSION["gmenuId"]){
            $path = $Row['redirectionPath'];
            }
          }
        }
        
        if($_SESSION["gadminId"] <> 0){
          echo '<li class="dropdown" ><input type="button" name="btnDeconnexion" onclick="fnDeconnexion()" value="Déconnexion"></li>';
        }else{
          echo '<li class="dropdown"><input type="button" name="btnConnexion" onclick="fnRedirection(\'ConnexionAdmin.php\',5)" value="Connexion"></li>';
        }
      ?> 
    </ul>
    <iframe id="PageContent" src="<?php if(isset($path)){echo $path;}else{echo 'Accueil/Accueil.php';}?>" frameborder="0" style="width:100%;height:100%"></iframe>
  </body>

  </html>
