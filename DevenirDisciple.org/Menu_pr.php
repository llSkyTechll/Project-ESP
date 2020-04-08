<?php

require_once 'Class/clsAdmin.php';

if (isset($_POST['action'])){
  $action = $_POST['action'];
  
  switch($action){
    case 'redirect':
      FNRedirect();
      break;
    case 'deconnexion':
      FNDeconnexion();
      break;
  }
}

function FNRedirect(){
  $menuId = $_POST["menuId"];
  $_SESSION["gmenuId"] = $menuId;
  //echo $_SESSION["gmenuId"];
}

function FNDeconnexion(){
  $admin = new Admin();
  $admin->deconnexion();
  exit('success');
}

?>