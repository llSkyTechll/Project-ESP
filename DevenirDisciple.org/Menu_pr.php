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
		case 'redirectNouvelle':
      FNRedirectionNouvelle();
      break;
  }
}

function FNRedirect(){
  $menuId = $_POST["menuId"];
  $path   = $_POST["path"];
  $_SESSION["gmenuId"] = $menuId;
  $_SESSION["gpath"]   = $path;
  $_SESSION["nouvelleId"] = 0;
  $_SESSION["gformenfantid"] = 0;
  $_SESSION["gformbenevolatid"] = 0;
}
function FNRedirectionNouvelle(){
  
  $_SESSION["gmenuId"] 		= $_POST["menuId"];
  $_SESSION["gpath"]   		= $_POST["path"];;
	$_SESSION["nouvelleId"] = $_POST["nouvelleId"];;
}

function FNDeconnexion(){
  Admin::deconnexion();
  $_SESSION["gmenuId"] = 1;
  $_SESSION["gpath"]   = 'Accueil/Accueil.php';
  exit('success');
}

function LoadSubMenu($submenuarray){
  $submenuarraylength = count($submenuarray);
  for($y = 0; $y < $submenuarraylength; $y++){
    $submenu = $submenuarray[$y];
    if($submenu->get_submenu() != null){
      echo('<ul class="p-0"><li class="nav-item dropright"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >'.$submenu->get_name().'</a><div class="dropdown-menu" aria-labelledby="navbarDropdown">');
      
      LoadSubMenu($submenu->get_submenu());
      echo('</div></ul>');

    }else{
      echo ('<a class="nav-link" onclick="fnRedirection(\''.$submenu->get_redirectionPath().'\','.$submenu->get_menuid().')">'.$submenu->get_name().'</a>');
    }
    if($submenu->get_menuid() == $_SESSION['gmenuId']){
      $_SESSION['path'] = $submenu->get_redirectionPath();
    }
  }
}

?>
