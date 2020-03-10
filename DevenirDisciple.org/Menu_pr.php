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
  echo $_SESSION["gmenuId"];
}

?>