<?php

class ImageMagasin{
  
  private $imageMagasinId;
  private $menuId;
  private $imagePath;
  private $imageName;
  private $actif;
  private $orderDisplay;
  
  function __construct($imageMagasinId, $menuId, $imagePath,$imageName, $actif, $orderDisplay){
    $this->imageMagasinId 	= $imageMagasinId;
    $this->menuId 			= $menuId;
    $this->imagePath      	= $imagePath;
    $this->imageName      	= $imageName;
    $this->actif          	= $actif;
    $this->orderDisplay   	= $orderDisplay;
    
  }
  
  public function getimageMagasinId(){
		return $this->imageMagasinId; 
	} 
	public function getImagePath(){
		return $this->imagePath;
	}
	public function getImageName(){
		return $this->imageName;
	}
	public function getActif(){
		return $this->actif;
	}
	public function getOrderDisplay(){
		return $this->orderDisplay;
	}
	
  
}

?>
