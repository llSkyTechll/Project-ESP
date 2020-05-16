<?php 

require_once 'clsTemplateText.php';

class TemplateTextDAO{
  
  public static function loadPageContent(){
    $SQL = 'CALL GetPageContentTemplateText('.$_SESSION['gmenuId'].')';
    
    $conn = OpenCon();
    
    $RSSQL = $conn->query($SQL);
    
    CloseCon($conn);
    
    if ($RSSQL->num_rows > 0) {
      $row = $RSSQL->fetch_assoc();
      
      return $pageContent = new TemplateText($row['pagecontenttemplatetextid'], $row['menuid'], $row['image'], $row['title'], $row['header'], $row['subtitle'], $row['content']);
    }
    
    return $pageContent = new TemplateText('0','0','','','','','');
  }
  
  public static function savePageContent($contentId, $menuid, $title, $header, $subtitle, $content){
    $conn = OpenCon();

    $SQL = "CALL SavePageContentTemplateText('".$contentId."','".$menuid."','".($title)."','".$conn->real_escape_string($header)."','".$conn->real_escape_string($subtitle)."','".$conn->real_escape_string($content)."');";

    if (!$conn->query($SQL)){
      exit('fail');
    }
    
    CloseCon($conn);
    
    exit('success');
  }
	
	  public static function UpdateImageTemplateText($menuid, $imagePath){
    $SQL = "CALL UpdateImageTemplateText('".$menuid."','".$imagePath."');";
    $conn = OpenCon();    
    if (!$conn->query($SQL)){
      return('fail');
    }    
    CloseCon($conn);
    return('success');
  }
	
  
}

?>