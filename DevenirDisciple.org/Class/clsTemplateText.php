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
    echo '<div class="container">
						<input type="hidden" id="contentId" value="'.$this->pageContentTemplateTextId.'">
					
						<header>
						<div id="image"> 
							<img src="'.$this->image.'" alt="Image Titre" height="200" width="200">
						</div>	
						
							<h1 id="title" '.$contentEditable.'> 
								'.$this->title.'
							</h1>
							<div id="header" '.$contentEditable.'> 
							'.$this->header.'
							</div>
						</header>						
						<h2 id="subtitle" '.$contentEditable.'> 
							'.$this->subtitle.'
						</h2>
						<div id="content" '.$contentEditable.'> 
							'.$this->content.'
						</div>
					</div>';
					
  } 
  
}

?>
