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

function validateAdminEditing(){
  if (Admin::isConnected()) {
    return true;
  }
  return false;
}

if (!isset($_SESSION['gformenfantid'])){
  $_SESSION['gformenfantid'] = 0;
}

if (!isset($_SESSION['gformbenevolatid'])){
  $_SESSION['gformbenevolatid'] = 0;
}

if (!isset($_SESSION['gformcontactid'])){
  $_SESSION['gformcontactid'] = 0;
}

function FNCheckbox($value){
  if ($value == 1){
    return 'checked';
  }
  return '';
}

?>
