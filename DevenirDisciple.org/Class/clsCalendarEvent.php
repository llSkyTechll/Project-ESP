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
    $this->name        = $name;
    $this->date        = $date;
    $this->descr       = $descr;
    $this->color       = $color;
    $this->icon        = $icon;
    $this->eventid     = $eventid;
    $this->communityid = $communityid;
  }  
  
  public function getCalendarEventFormat(){
    $date  = explode("-", $this->date);
    $start = $date[0];
    $end   = '';
    if (isset($date[1])){
      $end   = $date[1];
    }
    
    echo "{ eventid: '".$this->eventid."', title: '".str_replace('\'','\\\'',$this->name)."', description: '".str_replace('\'','\\\'',$this->descr)."', start: '".str_replace('\'','\\\'',$start)."', end: '".str_replace('\'','\\\'',$end)."', className: '".str_replace('\'','\\\'',$this->color)."', icon:'".str_replace('\'','\\\'',$this->icon)."'},";
  }
  
}

?>