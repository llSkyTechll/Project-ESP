<?php

require_once '../Class/clsAdmin.php';

if (isset($_POST['action'])){
  $action = $_POST['action'];
  
  switch($action){
  case 'connexion':
      FNConnexion();
  }
}

function FNConnexion(){
  $admin = new Admin();
  if($admin->connexion($_POST['email'], $_POST['password'])){
    $_SESSION["gpath"]   = 'Accueil/Accueil.php';
    $_SESSION["gmenuid"] = 1;
    exit('success');
  }else{
    exit('fail');
  }
}

?>
