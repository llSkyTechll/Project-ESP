<?php

require_once 'clsEncrypt.php';

class FormulaireEnfantDAO{

  public static function saveFormulaire($formdata){
  
    $result = FormulaireEnfantDAO::validationEmpty($formdata);
    if ($result == 'success'){
      $conn = OpenCon();
    
      $encrypt      = new Encryption();
      $key          = $encrypt->generateKey();
      $iv           = $encrypt->generateIV();
      
      $name          = $encrypt->encryptData(FNSQL($formdata['fname']), $key, $iv); 
      $adresse       = $encrypt->encryptData(FNSQL($formdata['faddress']), $key, $iv);
      $codepostal    = $encrypt->encryptData(FNSQL($formdata['fzipcode']), $key, $iv);
      $courriel      = $encrypt->encryptData(FNSQL($formdata['femail']), $key, $iv);
      $datenaissance = $encrypt->encryptData(FNSQL($formdata['fdatenaissance']), $key, $iv);
      $nompere       = $encrypt->encryptData(FNSQL($formdata['fnompere']), $key, $iv);
      $telpere       = $encrypt->encryptData(FNSQL($formdata['ftelpere']), $key, $iv);
      $nommere       = $encrypt->encryptData(FNSQL($formdata['fnommere']), $key, $iv);
      $telmere       = $encrypt->encryptData(FNSQL($formdata['fnommere']), $key, $iv);

      $initiation        = isset($formdata['finitiation'])        ? 1 : 0;
      $ptitepasto        = isset($formdata['fptitepasto'])        ? 1 : 0;
      $agnelets          = isset($formdata['fagnelets'])          ? 1 : 0;
      $premierpardon     = isset($formdata['fpremierpardon'])     ? 1 : 0;
      $premierecommunion = isset($formdata['fpremierecommunion']) ? 1 : 0;
      $confirmation      = isset($formdata['fconfirmation'])      ? 1 : 0;
      $brebis            = isset($formdata['fbrebis'])            ? 1 : 0;
      
      $paroisseid   = $formdata['fparoisseid'];
      $communityid  = 0;
      if ($paroisseid <> 0){
        $communityid  = $formdata['fcommunityid'.$paroisseid.'']; 
      }
      
      $param = "'".$name."', '".$adresse."', '".$codepostal."','".$courriel."','".$datenaissance."','".$nompere."','".$telpere."','".$nommere."','".$telmere.
      "','".FNSQL($formdata['fbapteme'])."','".FNSQL($formdata['fpardon'])."','".FNSQL($formdata['feucharistie'])."','".FNSQL($formdata['fallergies'])."','".$paroisseid."','".$communityid."','".$initiation.
      "','".$ptitepasto."','".$agnelets."','".$premierpardon."','".$premierecommunion."','".$confirmation."','".$brebis.
      "','".$key."','".$iv."'";

      $SQL = "CALL FormulaireEnfantSave(".$param.");";
      
      $conn->query($SQL);

      CloseCon($conn);

      return 'success';
    }else{
      return $result;
    }
  }
    
  public static function validationEmpty($formdata){
    if(trim($formdata['fname']) == '' || trim($formdata['femail']) == '' || trim($formdata['fdatenaissance']) == '' || ((trim($formdata['fnompere']) == '' && trim($formdata['ftelpere']) == '') || (trim($formdata['ftelmere']) == '' && trim($formdata['ftelmere'])))){
        return 'emptyFields';
    }    
    return 'success';
  }
}

?>