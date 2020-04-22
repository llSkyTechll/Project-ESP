<?php 

require_once '../Class/clsCalendarEvent.php';

require_once '../Class/clsParoisseCommunaute.php';

if (isset($_SESSION['gmenuId'])){
  $community = new ParoisseCommunaute();
  $communityid = $community->getCommunityId();
  
  $_SESSION['gcommunityid'] = $communityid;
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
    exit('emptyFields');
  }
  
  $Event = new CalendarEvent();
  
  if ($Event->saveNewEvent(FNSQL($_POST['name']), FNSQL($_POST['date']), FNSQL($_POST['description']), FNSQL($_POST['color']), FNSQL($_POST['icon'])) == 'success'){
    exit('success');
  }
  
  exit('fail');
}

?>