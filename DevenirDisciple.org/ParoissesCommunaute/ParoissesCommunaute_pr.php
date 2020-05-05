<?php 

require_once '../Class/clsCalendarEventDAO.php';

require_once '../Class/clsParoisseCommunaute.php';

if (isset($_POST['action'])){
  $action = $_POST['action'];
  
  switch($action){
  case 'addEvent':
    FNAddEvent();
  case 'deleteEvent':
    FNDeleteEvent();
  case 'updateEvent':
    FNUpdateEvent();
  case 'saveSchedule':
    FNSaveSchedule();
  }
}

function GetCommunityName(){
  ParoisseCommunaute::getCommunityName();
}

function FNAddEvent(){
  if ($_POST['name'] == '' || $_POST['description'] == '' || $_POST['date'] == '' || $_POST['color'] == '' || $_POST['icon'] == ''){
    exit('emptyFields');
  }
  
  if (CalendarEventDAO::saveNewEvent(FNSQL($_POST['name']), FNSQL($_POST['date']), FNSQL($_POST['description']), FNSQL($_POST['color']), FNSQL($_POST['icon'])) == 'success'){
    exit('success');
  }
  
  exit('fail');
}

function FNDeleteEvent(){
  if(isset($_POST['eventid'])){
    if (CalendarEventDAO::deleteEvent($_POST['eventid']) == 'success'){
      exit('success');
    }
  }
  exit( 'fail');
}

function FNUpdateEvent(){
  if (FNValidateEmptyFields() != 'emptyFields'){
    if (CalendarEventDAO::updateEvent($_POST['eventid'], FNSQL($_POST['name']), FNSQL($_POST['date']), FNSQL($_POST['description']), FNSQL($_POST['color']), FNSQL($_POST['icon'])) == 'success'){
      exit('success');
    }
    exit('fail');
  }
  exit('emptyFields');
}

function FNValidateEmptyFields(){
  if ($_POST['name'] == '' || $_POST['description'] == '' || $_POST['date'] == '' || $_POST['color'] == '' || $_POST['icon'] == ''){
    exit('emptyFields');
  }
}

function FNSaveSchedule(){
  $schedule    = FNSQL($_POST['schedule']);
  $scheduleid  = $_POST['scheduleid'];
  $communityid = $_SESSION['gcommunityid'];
  if (ParoisseCommunaute::saveSchedule($scheduleid, $schedule, $communityid) == 'success'){
    exit('success');
  }
  exit('fail');
}

?>