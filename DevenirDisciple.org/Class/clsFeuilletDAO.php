<?php 


require_once 'clsFeuillet.php';


class FeuiletDAO{
  
  public static function getAllFeuillet(){
    $SQL = 'CALL GetAllFeuillet();';
    
    $conn = OpenCon();
    
    $RSSQL = $conn->query($SQL);
    

    if ($RSSQL->num_rows > 0) {
      $feuillets = array();
			while($row = $RSSQL->fetch_assoc()) {
        array_push($feuillets, new Feuillet($row['feuilletId'], $row['pdfPath'],$row['pdfName'], $row['Actif'], $row['orderDisplay'],$row['size']));
      }      
    }
    CLoseCon($conn);
		return $feuillets;
    
  }
	public static function getFeuillet($inFeuilletId){
    $SQL = 'CALL GetFeuillet('.$inFeuilletId.')';
    
    $conn = OpenCon();
    
    $RSSQL = $conn->query($SQL);
    
    CloseCon($conn);
    $RSSQL = $conn->query($SQL);
		$feuillet = new feuillet(0,'','',0,0);
    if ($RSSQL->num_rows > 0) {
      $feuillet = new Feuillet($row['feuilletId'], $row['pdfPath'], $row['pdfName'], $row['Actif'], $row['orderDisplay'],$row['size']);
			
      }      
    
    CLoseCon($conn);
		return $feuillet;
    
  }
  
  public static function AddFeuillet( $pdfPath, $pdfName, $actif, $orderDisplay, $size){
    $SQL = "CALL AddFeuillet('".$pdfPath."','".$pdfName."','".$actif."','".$orderDisplay."','".$size."');";

    $conn = OpenCon();
    
    $conn->query($SQL);
    
    CloseCon($conn);
    
    exit('success');
  }
  
}

?>