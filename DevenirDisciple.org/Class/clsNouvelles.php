<?php

class Nouvelles{
  
	private $NouvellesId;
	private $title;
  private $descrSomm;
  private $descrTot;
  private $date;
  private $actif;
  private $imagePath;


	
	
  
  function __construct($NouvellesId, $title, $descrSomm, $descrTot , $date, $actif, $imagePath){
    $this->NouvellesId 	= $NouvellesId;
    $this->title 				= $title;
		$this->descrSomm  	= $descrSomm;
    $this->descrTot 		= $descrTot;
    $this->date         = $date;
    $this->actif      	= $actif;
    $this->imagePath   	= $imagePath;
  }
  
  

	public function getNouvellesId(){
		return $this->NouvellesId; 
	} 
	public function getTitle(){
		return $this->title;
	}
	public function getDescrSomm(){
		return $this->descrSomm;
	}
	public function getDescrTot(){
		return $this->descrTot;
	} 
	public function getDate(){
		return $this->date ;
	} 
	public function getActif(){
		return $this->actif;
	}
	public function getImagePath(){
		return $this->imagePath;
	}
	
	
	
	public function getNouvellesHTML(){
		$date  = explode("-", $this->date);
    $start = $date[0];
    $end   = '';
    if (isset($date[1])){
      $end   = $date[1];
    }
		
		
	}
  
}

?>
