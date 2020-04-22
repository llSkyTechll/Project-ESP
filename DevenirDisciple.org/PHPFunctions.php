<?php

session_start();

header('Content-Type: text/html; charset=UTF-8');

if(!isset($_SESSION['gmenuId'])) {
  $_SESSION['gmenuId'] = 0;
}

if(!isset($_SESSION['gadminId'])) {
  $_SESSION['gadminId'] = 0;
}

if (!isset($_SESSION['gcommunityid'])){
  $_SESSION['gcommunityid'] = 0;
}

function FNSQL($string){
  return str_replace("'", "''", $string);
}

?>
