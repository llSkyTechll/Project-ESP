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
					
						<header>';
					if($this->image !='' && validateAdminEditing() == false){
						echo '<div id="image"> 
							<img src="'.$this->image.'" alt="Image Titre" height="200" width="200">
						</div>';	
					}else if(validateAdminEditing()){
						echo '<div id="image"> 
							<img src="'.$this->image.'" alt="Image Titre" height="200" width="200">						
							<form  action="#" method="post" enctype="multipart/form-data" onsubmit="fnSavePageContent()">
								<label for="fileToUpload">Sélectionner une image à télécharger:</label>
								<input type="file" name="fileToUpload[]" id="fileToUpload">
								<input type="submit" value="Télécharger l\'image" name="submit">
							</form>
						</div>';
					}
						
					echo '<h1 id="title" class="'.$contentEditable.'" '.$contentEditable.'> 
								'.$this->title.'
							</h1>
							<div id="header" class="'.$contentEditable.'" '.$contentEditable.'> 
							'.$this->header.'
							</div>
						</header>						
						<h2 id="subtitle" class="'.$contentEditable.'" '.$contentEditable.'> 
							'.$this->subtitle.'
						</h2>
						<div id="content" class="'.$contentEditable.'" '.$contentEditable.'> 
							'.$this->content.'
						</div>';
          
    if (Admin::isConnected()){
      echo '<div>
              <input type="button" class="btn btn-primary" name="btnsave" value="Sauvegarder" onclick="fnSavePageContent()">
            </div>';
    }
  } 
  
}

?>
