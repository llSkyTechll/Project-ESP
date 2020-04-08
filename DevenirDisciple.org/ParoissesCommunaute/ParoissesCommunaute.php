<?php

include '../ConnexionDB.php';

include '../PHPFunctions.php';

$conn = OpenCon();

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
  <link rel="stylesheet" href="../css/include.css">
  <script src="../JavaScript/JSFunction.js"></script>
  <title>Devenir Disciple</title>
</head>

<body>
  <header>
      <h1>Paroisse-Communauté</h1>
  </header>

    <div>
        <h1>Heures de bureau</h1>
        <ul>
            <li><p>Lnndi de 9h à 12h30 et de 13h30 à 16h</p></li>
            <li><p>Mardi de 9h à 12h30 et de 13h30 à 16h</p></li>
            <li><p>Mercredi de 9h à 12h30 et de 13h30 à 16h</p></li>
            <li><p>Jeudi de 9h à 12h30 et de 13h30 à 16h</p></li>
            <li><p>Vendredi de 9h à 12h30 et de 13h30 à 16h</p></li>
            <li><p>Samedi de 9h à 12h30 et de 13h30 à 16h</p></li>
            <li><p>Dimanche de 9h à 12h30 et de 13h30 à 16h</p></li>
        </ul>
    </div>
    <div class="col-6">
  <header>
    <h4 class="display-4 mb-4 text-center">November 2017</h4>
    <div class="row d-none d-sm-flex p-1 bg-dark text-white">
      <h5 class="col-sm p-1 text-center">Sunday</h5>
      <h5 class="col-sm p-1 text-center">Monday</h5>
      <h5 class="col-sm p-1 text-center">Tuesday</h5>
      <h5 class="col-sm p-1 text-center">Wednesday</h5>
      <h5 class="col-sm p-1 text-center">Thursday</h5>
      <h5 class="col-sm p-1 text-center">Friday</h5>
      <h5 class="col-sm p-1 text-center">Saturday</h5>
    </div>
  </header>
  <div class="row border border-right-0 border-bottom-0">
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate d-none d-sm-inline-block bg-light text-muted">
      <h5 class="row align-items-center">
        <span class="date col-1">29</span>
        <small class="col d-sm-none text-center text-muted">Sunday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate d-none d-sm-inline-block bg-light text-muted">
      <h5 class="row align-items-center">
        <span class="date col-1">30</span>
        <small class="col d-sm-none text-center text-muted">Monday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate d-none d-sm-inline-block bg-light text-muted">
      <h5 class="row align-items-center">
        <span class="date col-1">31</span>
        <small class="col d-sm-none text-center text-muted">Tuesday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">1</span>
        <small class="col d-sm-none text-center text-muted">Wednesday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">2</span>
        <small class="col d-sm-none text-center text-muted">Thursday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">3</span>
        <small class="col d-sm-none text-center text-muted">Friday</small>
        <span class="col-1"></span>
      </h5>
      <a class="event d-block p-1 pl-2 pr-2 mb-1 rounded text-truncate small bg-info text-white" title="Test Event 1">Test Event 1</a>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">4</span>
        <small class="col d-sm-none text-center text-muted">Saturday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="w-100"></div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">5</span>
        <small class="col d-sm-none text-center text-muted">Sunday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">6</span>
        <small class="col d-sm-none text-center text-muted">Monday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">7</span>
        <small class="col d-sm-none text-center text-muted">Tuesday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">8</span>
        <small class="col d-sm-none text-center text-muted">Wednesday</small>
        <span class="col-1"></span>
      </h5>
      <a class="event d-block p-1 pl-2 pr-2 mb-1 rounded text-truncate small bg-success text-white" title="Test Event 2">Test Event 2</a>
      <a class="event d-block p-1 pl-2 pr-2 mb-1 rounded text-truncate small bg-danger text-white" title="Test Event 3">Test Event 3</a>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">9</span>
        <small class="col d-sm-none text-center text-muted">Thursday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">10</span>
        <small class="col d-sm-none text-center text-muted">Friday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">11</span>
        <small class="col d-sm-none text-center text-muted">Saturday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="w-100"></div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">12</span>
        <small class="col d-sm-none text-center text-muted">Sunday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">13</span>
        <small class="col d-sm-none text-center text-muted">Monday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">14</span>
        <small class="col d-sm-none text-center text-muted">Tuesday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">15</span>
        <small class="col d-sm-none text-center text-muted">Wednesday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">16</span>
        <small class="col d-sm-none text-center text-muted">Thursday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">17</span>
        <small class="col d-sm-none text-center text-muted">Friday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">18</span>
        <small class="col d-sm-none text-center text-muted">Saturday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="w-100"></div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">19</span>
        <small class="col d-sm-none text-center text-muted">Sunday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">20</span>
        <small class="col d-sm-none text-center text-muted">Monday</small>
        <span class="col-1"></span>
      </h5>
      <a class="event d-block p-1 pl-2 pr-2 mb-1 rounded text-truncate small bg-primary text-white" title="Test Event with Super Duper Really Long Title">Test Event with Super Duper Really Long Title</a>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">21</span>
        <small class="col d-sm-none text-center text-muted">Tuesday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">22</span>
        <small class="col d-sm-none text-center text-muted">Wednesday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">23</span>
        <small class="col d-sm-none text-center text-muted">Thursday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">24</span>
        <small class="col d-sm-none text-center text-muted">Friday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">25</span>
        <small class="col d-sm-none text-center text-muted">Saturday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="w-100"></div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">26</span>
        <small class="col d-sm-none text-center text-muted">Sunday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">27</span>
        <small class="col d-sm-none text-center text-muted">Monday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">28</span>
        <small class="col d-sm-none text-center text-muted">Tuesday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">29</span>
        <small class="col d-sm-none text-center text-muted">Wednesday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
      <h5 class="row align-items-center">
        <span class="date col-1">30</span>
        <small class="col d-sm-none text-center text-muted">Thursday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate d-none d-sm-inline-block bg-light text-muted">
      <h5 class="row align-items-center">
        <span class="date col-1">1</span>
        <small class="col d-sm-none text-center text-muted">Friday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate d-none d-sm-inline-block bg-light text-muted">
      <h5 class="row align-items-center">
        <span class="date col-1">2</span>
        <small class="col d-sm-none text-center text-muted">Saturday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="w-100"></div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate d-none d-sm-inline-block bg-light text-muted">
      <h5 class="row align-items-center">
        <span class="date col-1">3</span>
        <small class="col d-sm-none text-center text-muted">Sunday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate d-none d-sm-inline-block bg-light text-muted">
      <h5 class="row align-items-center">
        <span class="date col-1">4</span>
        <small class="col d-sm-none text-center text-muted">Monday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate d-none d-sm-inline-block bg-light text-muted">
      <h5 class="row align-items-center">
        <span class="date col-1">5</span>
        <small class="col d-sm-none text-center text-muted">Tuesday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate d-none d-sm-inline-block bg-light text-muted">
      <h5 class="row align-items-center">
        <span class="date col-1">6</span>
        <small class="col d-sm-none text-center text-muted">Wednesday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate d-none d-sm-inline-block bg-light text-muted">
      <h5 class="row align-items-center">
        <span class="date col-1">7</span>
        <small class="col d-sm-none text-center text-muted">Thursday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate d-none d-sm-inline-block bg-light text-muted">
      <h5 class="row align-items-center">
        <span class="date col-1">8</span>
        <small class="col d-sm-none text-center text-muted">Friday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
    <div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate d-none d-sm-inline-block bg-light text-muted">
      <h5 class="row align-items-center">
        <span class="date col-1">9</span>
        <small class="col d-sm-none text-center text-muted">Saturday</small>
        <span class="col-1"></span>
      </h5>
      <p class="d-sm-none">No events</p>
    </div>
  </div>
</div>

    <a>lien feuillet</a>
    <?php require_once '../Footer.php';?>
</body>



</html>
