<?php

class Admin{
  
  public function connexion($email, $password){
    $conn = OpenCon();
    
    $param = "'".$email."', '".utf8_encode($password)."', @AdminId";  
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
  
  public function deconnexion(){
    $_SESSION["gadminId"] = 0;
    $_SESSION["gmenuId"]  = 0;
  }
  
}

?>