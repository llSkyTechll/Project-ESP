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
  
  public static function getCommunityId(){
    $SQL = 'CALL GetCommunityID('.$_SESSION['gmenuId'].');';
    
    $conn  = OpenCon();
    $RSSQL = $conn->query($SQL);

    CloseCon($conn);
    
    if ($RSSQL->num_rows > 0){
      $Result = $RSSQL->fetch_assoc();
      return $Result['communauteid'];
    }
    
    return 0;
  }
  
  public static function getCommunityName(){
    //À compléter
  }
  
}

?>