<?php

session_start();

header('Content-Type: text/html; charset=ISO-8859-1');

if( !isset( $_SESSION['gmenuId'] ) ) {
  $_SESSION['gmenuId'] = 0;
}

?>