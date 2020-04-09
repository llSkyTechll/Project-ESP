<?php 

if (isset($_SESSION['gmenuid'])){
  $SQL = 'CALL GetCommunityID('.$_SESSION['gmenuid'].');';
  $conn = OpenCon();
  $RSSQL = $conn->query($SQL);
  CloseCon($conn);
  
  $_SESSION['gcommunityid'] = $RSSQL['communityid'];
}

function GetCommunityName(){
  echo 'tesT';
}

?>