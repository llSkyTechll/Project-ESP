<?php

require_once 'clsNouvelles.php';

class NouvellesDAO{
  
  public static function getAllNouvelles(){
    $conn = OpenCon();
    $SQL = "CALL GetAllNouvelles();";
    $RSSQL = $conn->query($SQL);

    if ($RSSQL->num_rows > 0) {
      $nouvelles = array();
      while($row = $RSSQL->fetch_assoc()) {
        array_push($nouvelles, new Nouvelles($row['nouvellesId'], $row['title'], $row['descrSomm'], $row['descrTot'], $row['dateDebut'],$row['dateFin'], $row['actif'], $row['imagePath']));
      }
      return $nouvelles;
    }
    CLoseCon($conn);
  }
	
	 public static function getNouvellesBandeau(){
    $conn = OpenCon();
    $SQL = "CALL GetNouvellesBandeau();";
    $RSSQL = $conn->query($SQL);

    if ($RSSQL->num_rows > 0) {
      $nouvelles = array();
      while($row = $RSSQL->fetch_assoc()) {
        array_push($nouvelles, new Nouvelles($row['nouvellesId'], $row['title'], $row['descrSomm'], $row['descrTot'], $row['dateDebut'],$row['dateFin'], $row['actif'], $row['imagePath']));
      }
      return $nouvelles;
    }
    CLoseCon($conn);
  }
	
	
  
  public static function saveNewNouvelles($title, $descrSomm, $descrTot ,$dateStart, $dateEnd, $actif){
    
    $conn = OpenCon();
    
    $SQL = "CALL AddNouvelles('".$conn->real_escape_string($title)."','". $conn->real_escape_string($descrSomm)."','". $conn->real_escape_string($descrTot)."','". $conn->real_escape_string($dateStart)."','". $conn->real_escape_string($dateEnd)."','".$conn->real_escape_string($actif)."');";
		
    $RSSQL = $conn->query($SQL);    
    
    CloseCon($conn);
    
    return('success');
  }  
	public static function updateNouvelles($nouvelleId, $title, $descrSomm, $descrTot ,$dateStart, $dateEnd, $actif){   
    
    $conn = OpenCon();
    
    $SQL = "CALL UpdateNouvelles('".$nouvelleId."','".$conn->real_escape_string($title)."','". $conn->real_escape_string($descrSomm)."','". $conn->real_escape_string($descrTot)."','".$conn->real_escape_string($dateStart)."','". $conn->real_escape_string($dateEnd)."','".$conn->real_escape_string($actif)."');";
		
     if (!$conn->query($SQL)){			 
      return('fail');
    } 
    CloseCon($conn);
    
    return('success');
  }
	public static function UpdateImageNouvelle($nouvelleId,$imagePath){
		
		$conn = OpenCon();
    
    $SQL = "CALL UpdateImageNouvelle('".$nouvelleId."','".$imagePath."');";

    $RSSQL = $conn->query($SQL);    
    
    CloseCon($conn);
    
    return('success');
	}
	
	
	
	 public static function getNouvelles($nouvelleId){
    $conn = OpenCon();
    $SQL = 'CALL GetNouvelle('.$nouvelleId.');';
    $RSSQL = $conn->query($SQL);
		
		 
    if (!is_null($RSSQL)) {
			$row = $RSSQL->fetch_assoc();			
      $nouvelles = new Nouvelles($row['nouvellesId'], $row['title'], $row['descrSomm'], $row['descrTot'], $row['dateDebut'],$row['dateFin'], $row['actif'], $row['imagePath']);
			
      return $nouvelles;
    }
		 
    CLoseCon($conn);
  }
  
}

?>