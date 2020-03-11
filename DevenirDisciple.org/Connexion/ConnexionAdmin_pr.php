<?php

if (isset($_POST['action'])){
  $action = $_POST['action'];
  
  switch($action){
  case 'connexion':
      FNValidation();
  }
}

function FNValidation(){
  $conn = OpenCon();
  
  $email = $_POST["email"];
  $password = $_POST["password"];
  
  $param = "'".$email."', '".$password."', @AdminId";  
  $SQL = "CALL ConnexionAdmin(".$param.");";
  $RSSQL = $conn->query($SQL);
  $Result = $RSSQL->fetch_assoc();

  if($Result["AdminId"] <> 0){
    FNConnexion($Result["AdminId"]);
  }else{
    exit('fail');
  }
  
  CloseCon($conn);
}

function FNConnexion($adminId){
  $_SESSION["gadminId"] = $adminId;
  $_SESSION["gmenuId"]  = 0;
  exit('success');
}

?>