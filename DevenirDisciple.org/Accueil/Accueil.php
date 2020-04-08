<?php

include '../PHPFunctions.php';

?>
<!doctype html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!-- Bootstrap4-->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
  <script src="../JavaScript/JSFunction.js"></script>
  <link rel="stylesheet" href="../css/include.css">
  <title>Devenir Disciple</title>
</head>


<body>

  <p>Accueil</p>

    <div id="carouselExampleIndicators" class="carousel slide w-50 container" data-ride="carousel" data-interval="10000">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img class="d-block " style="widht: 1000px;height:400px" src="jesus1.jpg" alt="Première Nouvelle">
            </div>
            <div class="carousel-item">
                <img class="d-block "style="widht: 1000px;height:400px" src="jesus2.jpg" alt="Deuxième Nouvelle">
            </div>
            <div class="carousel-item">
                <img class="d-block " style="widht: 1000px;height:400px" src="jesus3.jpg" alt="Third Nouvelle">
            </div>
            <div class="carousel-item">
                <img class="d-block " style="widht: 1000px;height:400px" src="jesus4.jpg" alt="Quatrième Nouvelle">
            </div>
            <div class="carousel-item">
                <img class="d-block " style="widht: 1000px;height:400px" src="jesus5.jpg" alt="Cinquième Nouvelle">
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    
    <div class="container row">
        <div class="">
            <p>oméli du curé</p>
        </div>
        <div class="">
            <input class="btn btn-primary" type="button" nam+e="btnTemoignage" value="témoinage">
        </div>
        <div class="">
            <video width="400" height="222" controls="controls">
                <source src="jesus-taime.mp4" type="video/mp4" />
            vidéo curé
            </video>
        </div>
        <div class="">
            <input class="btn btn-primary" type="button" name="btnConnexion" onclick="parent.fnRedirection('Formulaire/FormulaireBenevolat.php',5)" value="FormulaireBenevolat">
        </div>
    </div>
</body>

<?php require('../Footer.php');?>

</html>
