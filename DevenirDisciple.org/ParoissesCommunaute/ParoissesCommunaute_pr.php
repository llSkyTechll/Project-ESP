<?php 

require_once '../Class/clsCalendarEvent.php';

if (isset($_SESSION['gmenuid'])){
  $SQL = 'CALL GetCommunityID('.$_SESSION['gmenuid'].');';
  $conn = OpenCon();
  $RSSQL = $conn->query($SQL);
  CloseCon($conn);
  
  $_SESSION['gcommunityid'] = $RSSQL['communityid'];
}

if (isset($_POST['action'])){
  $action = $_POST['action'];
  
  switch($action){
  case 'addEvent':
    FNAddEvent();
  }
}

function GetCommunityName(){
  echo $_SESSION['gcommunityid'];
}

function FNAddEvent(){
  if ($_POST['name'] == '' || $_POST['description'] == '' || $_POST['date'] == '' || $_POST['color'] == '' || $_POST['icon'] == ''){
    echo 'emptyFields';
  }
  $Event = new CalendarEvent();
  
  if ($Event->saveNewEvent($_POST['name'], $_POST['date'], $_POST['description'], $_POST['color'], $_POST['icon']) == 'success'){
    echo 'success';
  }
  
  echo 'fail';
}

?>