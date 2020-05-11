<?php

require_once 'clsEncrypt.php';

require_once 'clsFormulaireEnfant.php';

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
      $telmere       = $encrypt->encryptData(FNSQL($formdata['ftelmere']), $key, $iv);

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
    if(trim($formdata['fname']) == '' || trim($formdata['femail']) == '' || trim($formdata['fdatenaissance']) == '' || ((trim($formdata['fnompere']) == '' || trim($formdata['ftelpere']) == '') && (trim($formdata['fnommere']) == '' || trim($formdata['ftelmere'] == '')))){
        return 'emptyFields';
    }    
    return 'success';
  }

  public static function getFormList(){
    $conn = OpenCon();

    $SQL  = 'CALL GetAllFormEnfant();';

    $RSSQL = $conn->query($SQL);

    CloseCon($conn);

    $formlist = array();

    if ($RSSQL->num_rows > 0){
      while ($row = $RSSQL->fetch_assoc()){
        array_push($formlist, new FormulaireEnfant($row['formulaireid'], $row['nom'], $row['adresse'], $row['codepostal'], $row['courriel'], $row['datenaissance'], $row['nompere'], $row['telpere'],
                   $row['nommere'], $row['telmere'], $row['bapteme'], $row['pardon'], $row['eucharistie'], $row['allergies'], $row['paroisseid'], $row['communauteid'], $row['initiation'], $row['ptitepasto'], $row['agnelets'],
                   $row['premierpardon'], $row['premierecommunion'], $row['confirmation'], $row['brebis'], $row['key'], $row['iv']));
      }
      return $formlist;
    }
  }

  public static function getFormHTML(){
    $html = '<form class="container" name="formSubmit" id="formSubmit">
      <input type="hidden" name="action" id="action" value="submit">
      <div class="form-group row">
        <label for="fname" class="col-md-2 col-form-label">Nom:</label>
        <div class="col-md-10">
          <input type="text" class="form-control" id="fname" name="fname" tabindex="10" placeholder="Nom">
        </div>
      </div>
      <div class="form-group row">
        <label for="faddress" class="col-md-2 col-form-label">Adresse complète:</label>
        <div class="col-md-10">
          <input type="text" class="form-control" id="faddress" name="faddress" tabindex="20" placeholder="Adresse">
        </div>
      </div>
      <div class="form-group row">
        <label for="fzipcode" class="col-md-2 col-form-label">Code postal:</label>
        <div class="col-md-10">
          <input type="text" class="form-control" id="fzipcode" name="fzipcode" tabindex="30" placeholder="Code postal">
        </div>
      </div>
      <div class="form-group row">
        <label for="femail" class="col-md-2 col-form-label">Adresse courriel:</label>
        <div class="col-md-10">
          <input type="text" class="form-control" id="femail" name="femail" tabindex="40" placeholder="Courriel" >
        </div>
      </div>
      <div class="form-group row">
        <label for="fdatenaissance" class="col-md-2 col-form-label">Date de naissance:</label>
        <div class="col-md-10">
          <input type="text" class="form-control" id="fdatenaissance" name="fdatenaissance" tabindex="40" placeholder="Date de naissance" >
        </div>
      </div>
      <div class="form-group row">
        <label for="fnompere" class="col-md-3 col-form-label">Nom du père (ou tuteur):</label>
        <div class="col-md-6">
          <input type="text" class="form-control" id="fnompere" name="fnompere" tabindex="40" placeholder="Nom du père (ou tuteur)" >
        </div>
        <label for="ftelpere" class="col-md-1 col-form-label">Tél:</label>
        <div class="col-md-2">
          <input type="tel" class="form-control" id="ftelpere" name="ftelpere" tabindex="50" placeholder="Téléphone" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}">
        </div>
      </div>
      <div class="form-group row">
        <label for="fnommere" class="col-md-3 col-form-label">Nom de la mère (ou tutrice):</label>
        <div class="col-md-6">
          <input type="text" class="form-control" id="fnommere" name="fnommere" tabindex="40" placeholder="Nom de la mère (ou tutrice)" >
        </div>
        <label for="ftelmere" class="col-md-1 col-form-label">Tél:</label>
        <div class="col-md-2">
          <input type="tel" class="form-control" id="ftelmere" name="ftelmere" tabindex="50" placeholder="Téléphone" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}">
        </div>
      </div>
      <div class="form-group row">
        <label style="text-align:center" class="col-md-12 col-form-label">Sacrements célébrés ( église et date )</label>      
      </div>

      <table style="width:100%;height:100%;margin-left:auto;margin-right:auto;border-collapse: collapse;">
        <tr>
          <td style="width:10%">
            <label for="fbapteme">Baptême:</label>
          </td>
          <td style="width:90%">
            <input class="form-control" type="text" tabindex="70" name="fbapteme" id="fbapteme" style="width:100%" length="500" value="">
          </td>
        </tr>
        <tr>
          <td style="width:10%">
            <label for="fpardon">Pardon:</label>
          </td>
          <td style="width:90%">
            <input class="form-control" type="text" tabindex="80" name="fpardon" id="fpardon" style="width:100%" length="500" value="">
          </td>    
        </tr>
        <tr>
          <td style="width:10%">
            <label for="feucharistie">Eucharistie:</label>
          </td>
          <td style="width:90%">
            <input class="form-control" type="text" tabindex="90" name="feucharistie" id="feucharistie" style="width:100%" length="500" value="">         
          </td>
        </tr>
        <tr>
          <td style="width:10%">
            <label for="fallergies"><i>Allergies:</i></label>
          </td>
          <td>
            <input class="form-control" type="text" tabindex="100" name="fallergies" id="fallergies" style="width:100%" length="500" value="">
          </td>
        </tr>

        <tr>
          <td colspan="4">
            <br>
            <p>Paroisse</p>
          </td>
        </tr>
        <tr>
          <td colspan="4">
            <select class="form-control" tabindex="110" name="fparoisseid" id="fparoisseid" style="width:50%" onchange="fnCommunityList()">
              <option value="0"></option>';
                    
                $paroissecommunaute = new ParoisseCommunaute();
                
                $Result = $paroissecommunaute->getAllParoisse();
                
                if ($Result->num_rows > 0){
                  while ($Row = $Result->fetch_assoc()){
                    $html .= '<option value="'.$Row['paroisseid'].'">'.$Row['nom'].'</option>';
                  }
                }  

            $html.= '</select>
        </tr>

        <tr>
          <td colspan="4">';
              $Result = $paroissecommunaute->getAllCommunauteOrderParoisse();

              if ($Result->num_rows > 0){
                $paroisseid = 0;
                while ($Row = $Result->fetch_assoc()){
                  if ($paroisseid != $Row['paroisseid']){
                    if ($paroisseid <> 0){
                      $html.= '</select>' ;
                    }
                    $paroisseid = $Row['paroisseid'];
                    $html .= '<select class="form-control" tabindex="120" name="fcommunityid'.$paroisseid.'" id="fcommunityid'.$paroisseid.'" style="width:50%;display:none">';
                    $html .= '<option value="0"></option>';
                    $html .= '<option value="'.$Row['communauteid'].'">'.$Row['nom'].'</option>';
                  }else{
                    $html .= '<option value="'.$Row['communauteid'].'">'.$Row['nom'].'</option>';
                  }
                }
                $html .= '</select>';
              }  
        $html .= '</td>
        </tr>
        </table>
        <br>
        <table class="Bold TableBorder" align="center">
        <tr>
          <td class="Center" style="width:16%"><label>Initiation:</label></td>
          <td class="Center" style="width:16%"><input class="big-checkbox" type="checkbox" name="finitiation" id="finitiation" value="1"></td>
          <td class="Center" style="width:16%"><label>P\'tite Pasto:</label></td>
          <td class="Center" style="width:16%"><input class="big-checkbox" type="checkbox" name="fptitepasto" id="fptitepasto" value="1"></td>
          <td class="Center" style="width:16%"><label>Agnelets:</label></td>
          <td class="Center" style="width:16%"><input class="big-checkbox" type="checkbox" name="fagnelets" id="fagnelets" value="1"></td>
        </tr>
        <tr>
          <td class="Center" style="width:16%"><label>Premier pardon:</label></td>
          <td class="Center" style="width:16%"><input class="big-checkbox" type="checkbox" name="fpremierpardon" id="fpremierpardon" value="1"></td>
          <td class="Center" style="width:16%"><label>Première communion:</label></td>
          <td class="Center" style="width:16%"><input class="big-checkbox" type="checkbox" name="fpremierecommunion" id="fpremierecommunion" value="1"></td>
          <td class="Center" style="width:16%"><label>Confirmation:</label></td>
          <td class="Center" style="width:16%"><input class="big-checkbox" type="checkbox" name="fconfirmation" id="fconfirmation" value="1"></td>
        </tr>
        <tr>
          <td class="Center" style="width:16%"><label>Les Brebis de Jésus:</label></td>
          <td class="Center" style="width:16%"><input class="big-checkbox" type="checkbox" name="fbrebis" id="fbrebis" value="1"></td>
        </tr>
      </table>
      
      <br>
      <div class="Center">
        <input class="btn btn-primary" type="button" tabindex="340" name="btnSubmitForm" value="Envoyer" onclick="fnSubmit();">
      </div>

    </form>';

    echo $html;
  }

  public static function getFormSpecData($formid){
    $conn = OpenCon();

    $SQL  = "CALL GetFormEnfant('".$formid."');";

    $RSSQL = $conn->query($SQL);

    CloseCon($conn);

    if ($RSSQL->num_rows > 0){
      $row = $RSSQL->fetch_assoc();
      $formdata = new FormulaireEnfant($row['formulaireid'], $row['nom'], $row['adresse'], $row['codepostal'], $row['courriel'], $row['datenaissance'], $row['nompere'], $row['telpere'],
                 $row['nommere'], $row['telmere'], $row['bapteme'], $row['pardon'], $row['eucharistie'], $row['allergies'], $row['paroisseid'], $row['communauteid'], $row['initiation'], $row['ptitepasto'], $row['agnelets'],
                 $row['premierpardon'], $row['premierecommunion'], $row['confirmation'], $row['brebis'], $row['key'], $row['iv']);
      $formdata->getFormDataDetails();
    }

    
  }

}

?>