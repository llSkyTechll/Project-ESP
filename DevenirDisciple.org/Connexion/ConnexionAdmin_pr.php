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
    exit('success');
  }else{
    exit('fail');
  }
}

?>