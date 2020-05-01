<?php

class Nouvelles{
  
	private $NouvellesId;
	private $title;
  private $descrSomm;
  private $descrTot;
  private $dateDebut;
  private $dateFin;
  private $actif;
  private $imagePath;


	
	
  
  function __construct($NouvellesId, $title, $descrSomm, $descrTot , $dateDebut, $dateFin, $actif, $imagePath){
    $this->NouvellesId 	= $NouvellesId;
    $this->title 				= $title;
		$this->descrSomm  	= $descrSomm;
    $this->descrTot 		= $descrTot;
    $this->dateDebut    = $dateDebut;
    $this->dateFin      = $dateFin;
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
	public function getDateDebut(){
		return $this->dateDebut ;
	} 
	public function getDateFin(){
		return $this->dateFin ;
	} 
	public function getActif(){
		return $this->actif;
	}
	public function getImagePath(){
		return $this->imagePath;
	}
	
	

  
}

?>
