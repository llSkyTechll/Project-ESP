<?php

class CalendarEvent{
  
  public function saveNewEvent($name, $date, $descr, $color, $icon){
    
    if ($_SESSION['gcommunityid'] == 0){
      exit('fail');
    }
    $conn = OpenCon();
    
    $SQL = "CALL AddEvent('".$name."','". $date."','". $descr."','". $color."','". $icon."','".$_SESSION['gcommunityid']."');";

    $RSSQL = $conn->query($SQL);    
    
    CloseCon($conn);
    
    exit('success');
  }
  
}

?>