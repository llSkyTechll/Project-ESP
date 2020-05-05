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
  
  public static function getScheduleHTML(){
    $conn = OpenCon();
    
    $SQL = "CALL GetCommunitySchedule('".$_SESSION['gcommunityid']."')";
    
    $RSSQL = $conn->query($SQL);
    
    $Row = $RSSQL->fetch_assoc();

    $contentEditable = '';
    if (Admin::isConnected()){
      $contentEditable = 'contentEditable';
    }
    $scheduleid = 0;
    if ($Row['scheduleid'] != null){
      $scheduleid = $Row['scheduleid'];
    }
    echo '<input type="hidden" name="scheduleid" id="scheduleid" value="'.$scheduleid.'">';
    echo '<div id="schedule" name="schedule" '.$contentEditable.'>'.
          $Row['schedule']
          .'</div>';    

    CloseCon($conn);
  }

  public static function saveSchedule($scheduleid, $schedule, $communityid){
    $conn = OpenCon();
    
    $SQL = "CALL SaveCommunitySchedule('".$scheduleid."','".$schedule."','".$communityid."');";
    
    $RSSQL = $conn->query($SQL);

    CloseCon($conn);

    exit('success');
  }
}

?>