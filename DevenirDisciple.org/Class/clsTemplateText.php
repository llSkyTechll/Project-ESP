<?php

class TemplateText{
  
  private $image;
  private $title;
  private $header;
  private $subtitle;
  private $content;
  
  function __construct($image, $title, $header, $subtitle, $content){
    $this->image    = $image;
    $this->title    = $title;
    $this->header   = $header;
    $this->subtitle = $subtitle;
    $this->content  = $content;
  }
  
  public function getHTMLPageContent(){
    echo '<div>'.$this->image.'</div><div>'.$this->title.'</div><div>'.$this->header.'</div><div>'.$this->subtitle.'</div><div>'.$this->content.'</div>';
  } 
  
}

?>