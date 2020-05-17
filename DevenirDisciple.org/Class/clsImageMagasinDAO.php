<?php 


require_once 'clsImageMagasin.php';


class ImageMagasinDAO{
  
  public static function getAllImageMagasin(){
    $SQL = 'CALL GetAllImageMagasin();';
    
    $conn = OpenCon();
    
    $RSSQL = $conn->query($SQL);
    
    if ($RSSQL->num_rows > 0) {
      $ImageMagasins = array();
			while($row = $RSSQL->fetch_assoc()) {        
        
        array_push($ImageMagasins, new ImageMagasin($row['imageMagasinId'], $row['menuId'], $row['imagePath'],$row['imageName'], $row['actif'], $row['orderDisplay']));
      }      
    }		
		else{
			$ImageMagasins = new ImageMagasin(0,0,'','',0,0,'0');
		}
    CLoseCon($conn);
		return $ImageMagasins;
    
  }
	public static function getAllImageMagasinEdit(){
    $SQL = 'CALL GetAllImageMagasinEdit();';
    
    $conn = OpenCon();
    
    $RSSQL = $conn->query($SQL);
    

    if ($RSSQL->num_rows > 0) {
      $ImageMagasins = array();
			while($row = $RSSQL->fetch_assoc()) {
        array_push($ImageMagasins, new ImageMagasin($row['imageMagasinId'], $row['menuId'] , $row['imagePath'],$row['imageName'], $row['actif'], $row['orderDisplay']));
      }      
    }
		else{
			$ImageMagasins = new ImageMagasin(0,0,'','',0,0,'0');
		}
    CLoseCon($conn);
		return $ImageMagasins;
    
  }
	public static function getImageMagasin($inImageMagasinId){
    $SQL = 'CALL GetImageMagasin('.$inImageMagasinId.')';
    $conn = OpenCon();
    $RSSQL = $conn->query($SQL);
		
    if ($RSSQL->num_rows > 0) {
			$row = $RSSQL->fetch_assoc();
      $ImageMagasin = new ImageMagasin($row['imageMagasinId'], $row['menuId'], $row['imagePath'], $row['imageName'], $row['actif'], $row['orderDisplay']);			
      }      
    
    CLoseCon($conn);
		return $ImageMagasin;
    
  }
  
  public static function AddImageMagasin($menuId, $imagePath, $imageName, $actif, $orderDisplay){
    $SQL = "CALL AddImageMagasin('".$menuId."','".$imagePath."','".$imageName."','".$actif."','".$orderDisplay."');";
    
    $conn = OpenCon();
    
    $conn->query($SQL);
    
    CloseCon($conn);
    
    return('success');
  }
 
	 public static function UpdateImageMagasin($ImageMagasinId,$actif, $orderDisplay){
    $SQL = "CALL UpdateImageMagasin('".$ImageMagasinId."','".$actif."','".$orderDisplay."');";
    $conn = OpenCon();
		 if (!$conn->query($SQL)){			 
      return('fail');
    } 
    CloseCon($conn);
    
    return('success');
  }
 
	public static function DeleteImageMagasin($inImageMagasinId){
			$SQL = 'CALL DeleteImageMagasin('.$inImageMagasinId.')';

			$conn = OpenCon();
			 if (!$conn->query($SQL)){			 
      return('fail');
    } 
    CloseCon($conn);
    
    return('success');

		}
}

?>