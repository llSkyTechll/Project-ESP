<?php

session_start();

header('Content-Type: text/html; charset=UTF-8');

require_once 'Class/clsAdmin.php';

if(!isset($_SESSION['gmenuId'])) {
  $_SESSION['gmenuId'] = 0;
}

$admin = new Admin();
if($admin->isConnected() == false){
  $admin->setDefaultSession();
}

if (!isset($_SESSION['gcommunityid'])){
  $_SESSION['gcommunityid'] = 0;
}

function FNSQL($string){
  return str_replace("'", "''", $string);
}

?>
