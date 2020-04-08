<?php

include 'PHPFunctions.php';

include 'ConnexionDB.php';  //Garder les includes dans cet ordre

include 'Menu_pr.php';

$conn = OpenCon();

?>

  <!doctype html>
  <html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Devenir Disciple</title>
    <!-- Bootstrap4-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/include.css">
    <link rel="shortcut icon" href="faviconJesus.png" type="image/ico" />
    <script src="JavaScript/JQuery1.9.1.js"></script>
    <script src="https://kit.fontawesome.com/30dce125f3.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
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
        })
      }
 function fnRedirectionNouvelle(Path, menuId,nouvelleId) {
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
        })
      }
    function fnDeconnexion() {
      $(function() {
        $.ajax({
          type: 'post',
          url: 'Menu.php',
          data: ({
            action: 'deconnexion'
          }),
          success: function(data) {
            if (data == 'success') {
              Swal.fire({
                title: 'Déconnexion réussi.',
                icon: 'success'
              }).then((result) => {
                window.top.location.reload();
              });
            }
          }
        });
      });
    }

  </script>
</head>

<body>   
    
    <div class="container fixed-top">    
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
       <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>    
   
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ">

            <?php

            $SQL = "SELECT menu.menuId, menu.name, menu.redirectionPath FROM menu where parentId = 0";
            $RSSQL = $conn->query($SQL);

            $SQL = "SELECT DISTINCT menu.menuId AS parentMenu FROM menu INNER JOIN menu m2 ON m2.parentId = menu.menuId WHERE menu.menuId <> 0";
            $RSSQL2 = $conn->query($SQL);
            $menuArray = array();

            if ($RSSQL2->num_rows > 0){
              while($arrayRow = $RSSQL2->fetch_assoc()){
                $menuArray[] = $arrayRow["parentMenu"];

              }
            }

            if ($RSSQL->num_rows > 0){
              while ($Row = $RSSQL->fetch_assoc()){

                if(in_array($Row['menuId'], $menuArray)){
                    echo('<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">'.utf8_encode($Row['name']).'</a><div class="dropdown-menu" aria-labelledby="navbarDropdown">');


                  $SQL = "SELECT * FROM menu WHERE parentId = ".$Row["menuId"]." order by sequence,name ";
                  $RSSQL3 = $conn->query($SQL);

                  while ($Row = $RSSQL3->fetch_assoc()){
                    $SQL = "SELECT * FROM menu WHERE parentId = ".$Row["menuId"]." order by sequence,name ";
                    $RSSQL4 = $conn->query($SQL);
                      
                      if(in_array($Row['menuId'], $menuArray)){
                          
                        echo('<ul class="p-0"><li class="nav-item dropright"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >'.utf8_encode($Row['name']).'</a><div class="dropdown-menu" aria-labelledby="navbarDropdown">');
                      while ($Row = $RSSQL4->fetch_assoc()){
                          echo ('<a class="dropdown-item" onclick="fnRedirection(\''.$Row['redirectionPath'].'\','.$Row['menuId'].')">'.utf8_encode($Row['name']).'</a>');
                          if ($Row['menuId'] == $_SESSION["gmenuId"]){
                            $path = $Row['redirectionPath'];
                        }
                      }
                      
                        echo('</div></li></ul>');
                      }
                      else{
                        echo ('<a class="dropdown-item" onclick="fnRedirection(\''.$Row['redirectionPath'].'\','.$Row['menuId'].')">'.utf8_encode($Row['name']).'</a>');      
                      }
                      
                    if ($Row['menuId'] == $_SESSION["gmenuId"]){
                    $path = $Row['redirectionPath'];
                    }
                  }
                  echo('</div></li>'); 
                }
                  else{
                      echo('<li class="nav-item"><a  class="nav-link" onclick="fnRedirection(\''.$Row['redirectionPath'].'\','.$Row['menuId'].')">'.utf8_encode($Row['name']).'</a> </li>');
                  }

                echo('</li>');
                if ($Row['menuId'] == $_SESSION["gmenuId"]){
                $path = $Row['redirectionPath'];
                }
              }
            }       

            ?>
                <li>
                    <input class="btn btn-primary" type="button" name="btnDon" value="Don">
                </li>
            </ul>
        </div>
    </nav>
    </div>
    <iframe class="mt-5" id="PageContent" src="<?php if(isset($path)){echo $path;}else{echo 'Accueil/Accueil.php';}?>" frameborder="0" style="background-color: transparent;"></iframe>
            
    
  </body>

  </html>

<?php
CloseCon($conn);
?>
