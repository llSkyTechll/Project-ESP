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

function LoadSubMenu($submenuarray){
  $submenuarraylength = count($submenuarray);
  for($y = 0; $y < $submenuarraylength; $y++){
    $submenu = $submenuarray[$y];
    if($submenu->get_submenu() != null){
      echo('<ul class="p-0"><li class="nav-item dropright"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >'.utf8_encode($submenu->get_name()).'</a><div class="dropdown-menu" aria-labelledby="navbarDropdown">');
      
      LoadSubMenu($submenu->get_submenu());
      echo('</div></ul>');

    }else{
      echo ('<a class="dropdown-item" onclick="fnRedirection(\''.$submenu->get_redirectionPath().'\','.$submenu->get_menuid().')">'.utf8_encode($submenu->get_name()).'</a>');
    }
  }
}

?>