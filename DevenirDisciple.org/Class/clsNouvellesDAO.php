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
	
	
  
  public static function saveNewNouvelles($title, $descrSomm, $descrTot ,$dateStart, $dateEnd, $actif, $imagePath){
    
    if ($_SESSION['gcommunityid'] == 0){
      exit('fail');
    }
    
    $conn = OpenCon();
    
    $SQL = "CALL AddNouvelles('".$name."','". $date."','". $descr."','". $color."','". $icon."','".$_SESSION['gcommunityid']."');";

    $RSSQL = $conn->query($SQL);    
    
    CloseCon($conn);
    
    exit('success');
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