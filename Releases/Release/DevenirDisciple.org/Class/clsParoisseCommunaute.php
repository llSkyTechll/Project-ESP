<?php

class ParoisseCommunaute{
  
  public function getAllParoisse(){
    $conn = OpenCon();
    
    $SQL = "CALL GetAllParoisse();";
    $RSSQL = $conn->query($SQL);
    
    CloseCon($conn);
    
    return $RSSQL;
  }
  
  public function getAllCommunauteOrderParoisse(){
    $conn = OpenCon();
    
    $SQL = 'CALL GetAllCommunauteOrderParoisse();';
    $RSSQL = $conn->query($SQL);
    
    CloseCon($conn);
    
    return $RSSQL;
  }
  
}

?>