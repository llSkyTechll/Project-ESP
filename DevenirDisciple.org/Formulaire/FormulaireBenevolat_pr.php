<?php

include '../PHPFunctions.php';

if (isset($_POST['formdata'])){
  parse_str($_POST['formdata'], $formdata);
  $action = $formdata['action'];

  switch($action){
  case 'submit':
      FNSubmit($formdata);
  }
}

function FNSubmit($formdata){
  if($formdata['ffirstname'] <> ''){
    if ($formdata['flastname'] <> '') {
      if ($formdata['femail'] <> '') {
        if ($formdata['fphone'] <> '' || $formdata['fcellphone'] <> '') {
          try{
            $conn = OpenCon();

            $lundiam      = isset($formdata['flundiam'])      ? 1 : 0;
            $lundipm      = isset($formdata['flundipm'])      ? 1 : 0;
            $lundisoir    = isset($formdata['flundisoir'])    ? 1 : 0;
            $mardiam      = isset($formdata['fmardiam'])      ? 1 : 0;
            $mardipm      = isset($formdata['fmardipm'])      ? 1 : 0;
            $mardisoir    = isset($formdata['fmardisoir'])    ? 1 : 0;
            $mercrediam   = isset($formdata['fmercrediam'])   ? 1 : 0;
            $mercredipm   = isset($formdata['fmercredipm'])   ? 1 : 0;
            $mercredisoir = isset($formdata['fmercredisoir']) ? 1 : 0;
            $jeudiam      = isset($formdata['fjeudiam'])      ? 1 : 0;
            $jeudipm      = isset($formdata['fjeudipm'])      ? 1 : 0;
            $jeudisoir    = isset($formdata['fjeudisoir'])    ? 1 : 0;
            $vendrediam   = isset($formdata['fvendrediam'])   ? 1 : 0;
            $vendredipm   = isset($formdata['fvendredipm'])   ? 1 : 0;
            $vendredisoir = isset($formdata['fvendredisoir']) ? 1 : 0;
            $samediam     = isset($formdata['fsamediam'])     ? 1 : 0;
            $samedipm     = isset($formdata['fsamedipm'])     ? 1 : 0;
            $samedisoir   = isset($formdata['fsamedisoir'])   ? 1 : 0;
            $dimancheam   = isset($formdata['fdimancheam'])   ? 1 : 0;
            $dimanchepm   = isset($formdata['fdimanchepm'])   ? 1 : 0;
            $dimanchesoir = isset($formdata['fdimanchesoir']) ? 1 : 0;

            $param = "'".FNSQL($formdata['femail'])."', '".FNSQL($formdata['ffirstname'])."', '".FNSQL($formdata['flastname'])."','".FNSQL($formdata['faddress'])."','".FNSQL($formdata['fphone'])."','".FNSQL($formdata['fcellphone']).
            "','".FNSQL($formdata['fbenevolat1'])."','".FNSQL($formdata['fbenevolat2'])."','".FNSQL($formdata['fbenevolat3'])."','".FNSQL($formdata['fbenevolat4'])."','".$formdata['fparoisseid']."','".$lundiam.
            "','".$lundipm."','".$lundisoir."','".$mardiam."','".$mardipm."','".$mardisoir."','".$mercrediam.
            "','".$mercredipm."','".$mercredisoir."','".$jeudiam."','".$jeudipm."','".$jeudisoir."','".$vendrediam.
            "','".$vendredipm."','".$vendredisoir."','".$samediam."','".$samedipm."','".$samedisoir."','".$dimancheam.
            "','".$dimanchepm."','".$dimanchesoir."'";

            $SQL = "CALL FormulaireBenevolatSave(".$param.");";

            $conn->query($SQL);

            CloseCon($conn);

            exit('Success');
          }catch (exception $e){
            exit('Fail');
          }
        }else {
          exit('phone');
        }
      }else{
        exit('email');
      }
    }else{
      exit('lastname');
    }
  }else {
    exit('firstname');
  }
}

?>
