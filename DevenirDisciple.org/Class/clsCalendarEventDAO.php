<?php

require_once 'clsCalendarEvent.php';

class CalendarEventDAO{
  
  public static function getAllCalendarEvents(){
    $conn = OpenCon();
    $SQL = "CALL GetAllEvents('".$_SESSION['gcommunityid']."');";
    $RSSQL = $conn->query($SQL);

    if ($RSSQL->num_rows > 0) {
      $events = array();
      while($row = $RSSQL->fetch_assoc()) {
        array_push($events, new CalendarEvent($row['eventId'], $row['name'], $row['date'], $row['descr'], $row['color'], $row['icon'], $row['communityId']));
      }
      return $events;
    }
    CLoseCon($conn);
  }
  
  public static function saveNewEvent($name, $date, $descr, $color, $icon){
    
    if ($_SESSION['gcommunityid'] == 0){
      exit('fail');
    }
    
    $conn = OpenCon();
    
    $SQL = "CALL AddEvent('".$name."','". $date."','". $descr."','". $color."','". $icon."','".$_SESSION['gcommunityid']."');";

    if (!$RSSQL = $conn->query($SQL)){
      exit('fail');
    }    
    
    CloseCon($conn);
    
    exit('success');
  }
  
  public static function deleteEvent($inEventID){
    $conn = OpenCon();
    
    $SQL = "CALL DeleteEvent('".$inEventID."');";

    if (!$RSSQL = $conn->query($SQL)){
      exit('fail');
    }
    
    CloseCon($conn);
    
    exit('success');
  }
  
  public static function updateEvent($inEventID, $name, $date, $descr, $color, $icon){
    $conn = OpenCon();
    
    $SQL = "CALL UpdateEvent('".$inEventID."','".$name."','". $date."','". $descr."','". $color."','". $icon."');";

    if (!$RSSQL = $conn->query($SQL)){
      exit('fail');
    }
    
    CloseCon($conn);
    
    exit('success');
  }
  
}

?>