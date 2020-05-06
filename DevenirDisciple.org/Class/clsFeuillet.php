<?php

class Feuillet{
  
  private $feuilletId;
  private $pdfPath;
  private $pdfName;
  private $actif;
  private $orderDisplay;
  private $size;
  
  function __construct($feuilletId, $pdfPath,$pdfName, $actif, $orderDisplay, $size){
    $this->feuilletId 		= $feuilletId;
    $this->pdfPath        = $pdfPath;
    $this->pdfName        = $pdfName;
    $this->actif          = $actif;
    $this->orderDisplay   = $orderDisplay;
    $this->size           = $size;
  }
  
  public function getFeuilletId(){
		return $this->feuilletId; 
	} 
	public function getPdfPath(){
		return $this->pdfPath;
	}
	public function getPdfName(){
		return $this->pdfName;
	}
	public function getActif(){
		return $this->actif;
	}
	public function getOrderDisplay(){
		return $this->orderDisplay;
	} 
	public function getSize(){
		return $this->size ;
	} 
	
  
}

?>
