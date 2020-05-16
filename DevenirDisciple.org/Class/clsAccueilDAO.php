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
  
  public static function UpdateImageHomelie($imageHomeliePath){
    $SQL = "CALL UpdateImageHomelie('".$imageHomeliePath."');";
    $conn = OpenCon();
    $conn->query($SQL);
    CloseCon($conn);
    return('success');
  }
  public static function UpdateImageTemoignage($imageTemoignagePath){
    $SQL = "CALL UpdateImageTemoignage('".$imageTemoignagePath."');";
    $conn = OpenCon();
    $conn->query($SQL);
    CloseCon($conn);
    return('success');
  }
  public static function UpdateVideoBienvenue($videoBienvenuePath){
    $SQL = "CALL UpdateVideoBienvenue('".$videoBienvenuePath."');";
    $conn = OpenCon();
    $conn->query($SQL);
    CloseCon($conn);
    return('success');
  }
  public static function UpdateImageFormulaire($imageFormulairePath){
    $SQL = "CALL UpdateImageFormulaire('".$imageFormulairePath."');";
    $conn = OpenCon();
    $conn->query($SQL);
    CloseCon($conn);
    return('success');
  }
 
}

?>