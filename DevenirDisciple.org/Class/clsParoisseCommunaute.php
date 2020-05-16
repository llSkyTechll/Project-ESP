<?php

class ParoisseCommunaute{
  
  public function getAllParoisse(){
    $conn = OpenCon();
    
    $SQL = "CALL GetAllParoisse();";
    
    if (!$RSSQL = $conn->query($SQL)){
      echo 'Erreur lors de la requête à la base de données.';
    }
    
    CloseCon($conn);
    
    return $RSSQL;
  }
  
  public function getAllCommunauteOrderParoisse(){
    $conn = OpenCon();
    
    $SQL = 'CALL GetAllCommunauteOrderParoisse();';
    
    if (!$RSSQL = $conn->query($SQL)){
      echo 'Erreur lors de la requête à la base de données.';
    }

    CloseCon($conn);
    
    return $RSSQL;
  }
  
  public static function getCommunityId(){
    $SQL = 'CALL GetCommunityID('.$_SESSION['gmenuId'].');';
    
    $conn  = OpenCon();

    if (!$RSSQL = $conn->query($SQL)){
      echo 'Erreur lors de la requête à la base de données.';
    }

    CloseCon($conn);
    
    if ($RSSQL->num_rows > 0){
      $Result = $RSSQL->fetch_assoc();
      return $Result['communauteid'];
    }
    
    return 0;
  }
  
  public static function getCommunityName(){
    $conn = OpenCon();

    if (isset($_SESSION['gcommunityid'])){
      $SQL = "CALL GetCommunityName('".$_SESSION['gcommunityid']."');";

      if ($RSSQL = $conn->query($SQL)){
        $communityname = $RSSQL->fetch_assoc();
        echo $communityname['nom'];
      }
    }
  }
  
  public static function getScheduleHTML(){
    $conn = OpenCon();
    
    $SQL = "CALL GetCommunitySchedule('".$_SESSION['gcommunityid']."')";
    
    if (!$RSSQL = $conn->query($SQL)){
      echo 'Erreur lors de la requête à la base de données.';
    }
    
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

    if (!$conn->query($SQL)){
      exit('fail');
    }

    CloseCon($conn);

    exit('success');
  }
}

?>