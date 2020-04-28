<?php

class TemplateText{
  
  private $pageContentTemplateTextId;
  private $menuid;
  private $image;
  private $title;
  private $header;
  private $subtitle;
  private $content;
  
  function __construct($pageContentTemplateTextId, $menuid, $image, $title, $header, $subtitle, $content){
    $this->pageContentTemplateTextId = $pageContentTemplateTextId;
    $this->menuid                    = $menuid;
    $this->image                     = $image;
    $this->title                     = $title;
    $this->header                    = $header;
    $this->subtitle                  = $subtitle;
    $this->content                   = $content;
  }
  
  public function getHTMLPageContent(){
    $contentEditable = '';
    if (validateAdminEditing()){
      $contentEditable = 'contentEditable';
    }
    echo '<input type="hidden" id="contentId" value="'.$this->pageContentTemplateTextId.'">
          <div id="image" '.$contentEditable.'> 
            '.$this->image.'
          </div>
          <div id="title" '.$contentEditable.'> 
            '.$this->title.'
          </div>
          <div id="header" '.$contentEditable.'> 
            '.$this->header.'
          </div>
          <div id="subtitle" '.$contentEditable.'> 
            '.$this->subtitle.'
          </div>
          <div id="content" '.$contentEditable.'> 
            '.$this->content.'
          </div>';
  } 
  
}

?>