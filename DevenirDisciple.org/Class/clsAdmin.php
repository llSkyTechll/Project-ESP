<?php

class Admin{
  
  public static function connexion($email, $password){
    $conn = OpenCon();
    
    $param = "'".$email."', '".$password."', @AdminId";  
    $SQL = "CALL ConnexionAdmin(".$param.");";
    $RSSQL = $conn->query($SQL);
    $Result = $RSSQL->fetch_assoc();

    CloseCon($conn);

    if($Result["AdminId"] <> 0){
      $_SESSION["gadminId"] = $Result["AdminId"];
      $_SESSION["gmenuId"]  = 0;
      return true;
    }else{
      return false;
    }    
  }
  
  public static function deconnexion(){
    $_SESSION["gadminId"] = 0;
    $_SESSION["gmenuId"]  = 0;
  }
  
  public static function isConnected(){
    if (isset($_SESSION['gadminId'])){
      if ($_SESSION['gadminId'] <> 0){
        return true;
      }
    }
    
    return false;
  }
  
  public static function setDefaultSession(){
    $_SESSION['gadminId'] = 0; 
  }
  
}

?>
