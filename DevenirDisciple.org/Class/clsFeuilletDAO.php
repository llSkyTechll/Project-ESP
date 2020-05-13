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
		else{
			$feuillets = new Feuillet(0,'','',0,0,'0');
		}
    CLoseCon($conn);
		return $feuillets;
    
  }
	public static function getAllFeuilletEdit(){
    $SQL = 'CALL GetAllFeuilletEdit();';
    
    $conn = OpenCon();
    
    $RSSQL = $conn->query($SQL);
    

    if ($RSSQL->num_rows > 0) {
      $feuillets = array();
			while($row = $RSSQL->fetch_assoc()) {
        array_push($feuillets, new Feuillet($row['feuilletId'], $row['pdfPath'],$row['pdfName'], $row['Actif'], $row['orderDisplay'],$row['size']));
      }      
    }
		else{
			$feuillets = new Feuillet(0,'','',0,0,'0');
		}
    CLoseCon($conn);
		return $feuillets;
    
  }
	public static function getFeuillet($inFeuilletId){
    $SQL = 'CALL GetFeuillet('.$inFeuilletId.')';
    $conn = OpenCon();
    $RSSQL = $conn->query($SQL);
		
    if ($RSSQL->num_rows > 0) {
			$row = $RSSQL->fetch_assoc();
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
    
    return('success');
  }
 
	 public static function UpdateFeuillet( $feuilletId,$actif, $orderDisplay){
    $SQL = "CALL UpdateFeuillet('".$feuilletId."','".$actif."','".$orderDisplay."');";
    $conn = OpenCon();
		 if (!$conn->query($SQL)){			 
      return('fail');
    } 
    CloseCon($conn);
    
    return('success');
  }
 
	public static function DeleteFeuillet($inFeuilletId){
			$SQL = 'CALL DeleteFeuillet('.$inFeuilletId.')';

			$conn = OpenCon();
			 if (!$conn->query($SQL)){			 
      return('fail');
    } 
    CloseCon($conn);
    
    return('success');

		}
}

?>