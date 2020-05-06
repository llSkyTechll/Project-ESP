<?php 


require_once '../Class/clsNouvellesDAO.php';

require_once '../Class/clsNouvelles.php';
class AccueilDAO{
  
  public static function getBasPage(){
    $SQL = 'CALL GetAccueil()';
    
    $conn = OpenCon();
    
    $RSSQL = $conn->query($SQL);
    
    CloseCon($conn);
    
    if ($RSSQL->num_rows > 0) {
      $row = $RSSQL->fetch_assoc();
      return $row;
    
    }
    
		return null;
		
    
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