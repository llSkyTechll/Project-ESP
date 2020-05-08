<?php

session_start();

header('Content-Type: text/html; charset=UTF-8');

require_once 'Class/clsAdmin.php';

if(!isset($_SESSION['gmenuId'])) {
  $_SESSION['gmenuId'] = 0;
}

if(Admin::isConnected() == false){
  Admin::setDefaultSession();
}

if (!isset($_SESSION['gcommunityid'])){
  $_SESSION['gcommunityid'] = 0;
}

function FNSQL($string){
  return str_replace("'", "''", $string);
}

function validateAdminEditing(){
  if (Admin::isConnected()) {
    return true;
  }
  return false;
}

if (!isset($_SESSION['gformid'])){
  $_SESSION['gformid'] = 0;
}

?>
