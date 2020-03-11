<?php

if (isset($_POST['action'])){
  $action = $_POST['action'];
  
  switch($action){
  case 'redirect':
      FNRedirect();
  }
}

function FNRedirect(){
  $menuId = $_POST["menuId"];
  $_SESSION["gmenuId"] = $menuId;
  //echo $_SESSION["gmenuId"];
}

function FNDeconnexion(){
  $_SESSION["gadminId"] = 0;
  $_SESSION["gmenuId"]  = 0;
  exit('success');
}

?>