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
    $SQL = "CALL SavePageContentTemplateText('".$contentId."','".$menuid."','".$title."','".$header."','".$subtitle."','".$content."');";

    $conn = OpenCon();
    
    $conn->query($SQL);
    
    CloseCon($conn);
    
    exit('success');
  }
  
}

?>