<?php

require_once '../PHPFunctions.php';

require_once '../Class/clsTemplateTextDAO.php';

require_once '../Uploads/UploadImage.php';

if (isset($_POST['action'])){
  switch($_POST['action']){
  case 'saveContent':
      FNSavePageContent();
  }
}

function FNSavePageContent(){  

  if (Admin::isConnected()){
    $title    = FNSQL($_POST['title']);
    $header   = FNSQL($_POST['header']);
    $subtitle = FNSQL($_POST['subtitle']);
    $content  = FNSQL($_POST['content']);
    
    TemplateTextDAO::savePageContent($_POST['contentId'], $_SESSION['gmenuId'], $title, $header, $subtitle, $content);  
    
    exit ('success');
  }
  exit ('admin');
  
}

?>
