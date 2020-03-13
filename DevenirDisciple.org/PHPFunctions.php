<?php

session_start();

header('Content-Type: text/html; charset=UTF-8');

if( !isset( $_SESSION['gmenuId'] ) ) {
  $_SESSION['gmenuId'] = 0;
}

if( !isset( $_SESSION['gadminId'] ) ) {
  $_SESSION['gadminId'] = 0;
}

if( !isset( $_SESSION['glangId'] ) ) {
  $_SESSION['glangId'] = 1;
}

function GetLabel($labelname, $langid){
  $conn = OpenCon();
  $SQL   = "SELECT IFNULL((SELECT labels.description FROM labels WHERE labels.labelname = '".$labelname."' AND labels.langid = ".$langid."), '".$labelname."') AS description;";
  $RSSQL = $conn->query($SQL);
  while($Result = $RSSQL -> fetch_assoc()){
    echo $Result["description"];
  }
  CloseCon($conn);
}

?>