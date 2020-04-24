<?php 

require_once '../Class/clsCalendarEventDAO.php';

require_once '../Class/clsParoisseCommunaute.php';

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
  
  if (CalendarEventDAO::saveNewEvent($_POST['name'], $_POST['date'], $_POST['description'], $_POST['color'], $_POST['icon']) == 'success'){
    exit('success');
  }
  
  exit('fail');
}

?>