<?php

class CalendarEvent{
  
  public function saveNewEvent($name, $date, $descr, $color, $icon){
    
    if (!isset($_SESSION['gcommunityid'])){
      echo 'fail';
    }
    $conn = OpenCon();
    
    $SQL = 'CALL AddEvent('.$name.','. $date.','. $descr.','. $color.','. $icon.','.$_SESSION['gcommunityid'].');';
    $RSSQL = $conn->query($SQL);    
    
    Close($conn);
    
    echo 'success';
  }
  
}

?>