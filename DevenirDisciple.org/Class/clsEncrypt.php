<?php

class Feuillet{
  
  private $feuilletid;
  private $pdfPath ;
  private $actif;
  private $orderDisplay;
  
  function __construct($feuilletid,$pdfPath, $actif, $orderDisplay){
    $this->feuilletid  	= $feuilletid;
    $this->pdfPath     	= $pdfPath;
    $this->actif       	= $actif;
    $this->orderDisplay	= $orderDisplay;
  }  
  

  
}

?>