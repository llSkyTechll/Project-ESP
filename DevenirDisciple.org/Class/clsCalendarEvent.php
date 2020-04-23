<?php

class CalendarEvent{
  
  private $eventid;
  private $name;
  private $date;
  private $descr;
  private $color;
  private $icon;
  private $communityid;
  
  function __construct($eventid,$name, $date, $descr, $color, $icon, $communityid){
    $this->name = $name;
    $this->date = $date;
    $this->descr = $descr;
    $this->color = $color;
    $this->icon = $icon;
    $this->eventid = $eventid;
    $this->communityid = $communityid;
  }
  
  
  
  public function getCalendarEventFormat(){
    $date  = explode("-", $this->date);
    $start = $date[0];
    $end   = '';
    if (isset($date[1])){
      $end   = $date[1];
    }
    
    echo "{ title: '".$this->name."', description: '".$this->descr."', start: '".$start."', end: '".$end."', className: '".$this->color."', icon:'".$this->icon."'},";
  }
  
}

?>