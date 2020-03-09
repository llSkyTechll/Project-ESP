<?php

include 'Connection.php';

$conn = OpenCon();

?>
<!doctype html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <title>Devenir Disciple</title>
  <script>
    function fnRedirection(Path) {
      document.getElementById('PageContent').src = Path;
    }

  </script>
</head>

<body>
    <ul>
      <?php
      $SQL = "SELECT name, redirectionPath FROM menu";
      $RSSQL = $conn->query($SQL);

      if ($RSSQL->num_rows > 0){
        while ($Row = $RSSQL->fetch_assoc()){
          echo '<li><a  onclick="fnRedirection(\''.$Row['redirectionPath'].'\')">'. $Row['name'].'</a></li>';
        }
      }
      ?>
    </ul>
  <iframe id="PageContent" src="Accueil/Accueil.php" frameborder="0" style="width:100%;height:100%"></iframe>

</body>

</html>
