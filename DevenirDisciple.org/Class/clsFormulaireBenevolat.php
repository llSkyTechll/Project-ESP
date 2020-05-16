<?php

require_once 'clsEncrypt.php';

class FormulaireBenevolat{
  
  public function saveForm($formdata){
    
    $result = $this->validationEmpty($formdata);
      
    if ($result == 'success'){
      $conn = OpenCon();
    
      $encrypt      = new Encryption();
      $key          = $encrypt->generateKey();
      $iv           = $encrypt->generateIV();
      
      $email        = $encrypt->encryptData($conn->real_escape_string($formdata['femail']), $key, $iv);
      $firstname    = $encrypt->encryptData($conn->real_escape_string($formdata['ffirstname']), $key, $iv);
      $lastname     = $encrypt->encryptData($conn->real_escape_string($formdata['flastname']), $key, $iv);
      $address      = $encrypt->encryptData($conn->real_escape_string($formdata['faddress']), $key, $iv);
      $phone        = $encrypt->encryptData($conn->real_escape_string($formdata['fphone']), $key, $iv);
      $cellphone    = $encrypt->encryptData($conn->real_escape_string($formdata['fcellphone']), $key, $iv);

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
      
      $paroisseid   = $formdata['fparoisseid'];
      $communityid  = 0;
      if ($paroisseid <> 0){
        $communityid  = $formdata['fcommunityid'.$paroisseid.'']; 
      }
      
      $param = "'".$email."', '".$firstname."', '".$lastname."','".$address."','".$phone."','".$cellphone.
      "','".$conn->real_escape_string($formdata['fbenevolat1'])."','".$conn->real_escape_string($formdata['fbenevolat2'])."','".$conn->real_escape_string($formdata['fbenevolat3'])."','".$conn->real_escape_string($formdata['fbenevolat4'])."','".$paroisseid."','".$communityid."','".$lundiam.
      "','".$lundipm."','".$lundisoir."','".$mardiam."','".$mardipm."','".$mardisoir."','".$mercrediam.
      "','".$mercredipm."','".$mercredisoir."','".$jeudiam."','".$jeudipm."','".$jeudisoir."','".$vendrediam.
      "','".$vendredipm."','".$vendredisoir."','".$samediam."','".$samedipm."','".$samedisoir."','".$dimancheam.
      "','".$dimanchepm."','".$dimanchesoir."','".$conn->real_escape_string($key)."','".$conn->real_escape_string($iv)."'";

      $SQL = "CALL FormulaireBenevolatSave(".$param.");";

      if (!$conn->query($SQL)){
        return 'Fail';
      }

      CloseCon($conn);

      return 'Success';
    }else{
      return $result;
    }
    
  }
  
  public function validationEmpty($formdata){
    
    if(trim($formdata['ffirstname']) == '' || trim($formdata['flastname']) == '' || trim($formdata['femail']) == '' || (trim($formdata['fphone']) == '' && trim($formdata['fcellphone']) == '')){
      return 'emptyFields';
    }    
    return 'success';
  }

  public static function getFormHTML(){
    $html = '<form class="container" name="formSubmit" id="formSubmit">
            <input type="hidden" name="action" id="action" value="submit">
            <div class="form-group row">
              <label for="ffirstname" class="col-md-1 col-form-label">Prénom:</label>
              <div class="col-md-5">
                <input type="text" class="form-control" id="ffirstname" name="ffirstname" tabindex="10" placeholder="Prénom">
              </div>
              <label for="flastname" class="col-md-1 col-form-label">Nom:</label>
              <div class="col-md-5">
                <input type="text" class="form-control" id="flastname" name="flastname" tabindex="20" placeholder="Nom">
              </div>
            </div>
            <div class="form-group row">
              <label for="faddress" class="col-md-1 col-form-label">Adresse</label>
              <div class="col-md-11">
                <input type="text" class="form-control" id="faddress" name="faddress" tabindex="30" placeholder="Adresse">
              </div>
            </div>
            <div class="form-group row">
              <label for="fphone" class="col-md-1 col-form-label">Tél. :</label>
              <div class="col-md-11">
                <input type="tel" class="form-control" id="fphone" name="fphone" tabindex="40" placeholder="Tél." pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}">
              </div>
            </div>
            <div class="form-group row">
              <label for="fcellphone" class="col-md-1 col-form-label">Tél. cell:</label>
              <div class="col-md-11">
                <input type="tel" class="form-control" id="fcellphone" name="fcellphone" tabindex="50" placeholder="Tél. cell" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}">
              </div>
            </div>
            <div class="form-group row">
              <label for="femail" class="col-md-1 col-form-label">Courriel</label>
              <div class="col-md-11">
                <input type="email" class="form-control" id="femail" name="femail" tabindex="60" placeholder="Courriel">
              </div>
            </div>

            <table style="width:100%;height:100%;margin-left:auto;margin-right:auto;border-collapse: collapse;">
              <tr>
                <td colspan="4">
                  <br>
                  <p>Plusieurs services ou compétences sont requis dans nos communautés. Il y a d’abord les services liés à
                    la vie liturgique (lecteurs, servants de messe, membres des chorales, comités de liturgie, catéchètes,
                    etc). Des bénévoles sont aussi requis pour divers services (aide à la correspondance, secrétariat,
                    réception, menuiserie, construction, etc). D’autres compétences plus pointues sont recherchées dans
                    certaines situations (en droit, en informatique, en gestion, en communication, en ingénierie, en marketing,
                    en comptabilité et finance, etc).</p>
                </td>
              </tr>

              <tr>
                <td colspan="4" style="width:75%">
                  <br>
                  <p>Indiquez, le ou les bénévolats que vous seriez prêt à faire pour votre communauté ou l’une ou
                    l’autre des paroisses.</p>
                </td>
              </tr>
              <tr>
                <td colspan="2">
                  <ul>
                    <li>
                      <input class="form-control" type="text" tabindex="70" name="fbenevolat1" id="fbenevolat1" style="width:100%" length="500" value="">
                    </li>
                    <li>
                      <input class="form-control" type="text" tabindex="80" name="fbenevolat2" id="fbenevolat2" style="width:100%" length="500" value="">
                    </li>
                    <li>
                      <input class="form-control" type="text" tabindex="90" name="fbenevolat3" id="fbenevolat3" style="width:100%" length="500" value="">
                    </li>
                    <li>
                      <input class="form-control" type="text" tabindex="100" name="fbenevolat4" id="fbenevolat4" style="width:100%" length="500" value="">
                    </li>
                  </ul>
                </td>
              </tr>
              <tr>
                <td colspan="4">
                  <br>
                  <p>Pour quelle communauté ou paroisse souhaitez-vous faire votre bénévolat?</p>
                </td>
              </tr>
              <tr>
                <td colspan="2">
                  <select class="form-control" tabindex="110" name="fparoisseid" id="fparoisseid" style="width:50%" onchange="fnCommunityList()">
                    <option value="0"></option>';
                              
                      
                      $paroissecommunaute = new ParoisseCommunaute();
                      
                      $Result = $paroissecommunaute->getAllParoisse();
                      
                      if ($Result->num_rows > 0){
                        while ($Row = $Result->fetch_assoc()){
                          $html .= '<option value="'.$Row['paroisseid'].'">'.$Row['nom'].'</option>';
                        }
                      }  
                      

            $html .= '</select>
                </td>
              </tr>

              <tr>
                <td colspan="2">';
     
                    $Result = $paroissecommunaute->getAllCommunauteOrderParoisse();

                    if ($Result->num_rows > 0){
                      $paroisseid = 0;
                      while ($Row = $Result->fetch_assoc()){
                        if ($paroisseid != $Row['paroisseid']){
                          if ($paroisseid <> 0){
                            $html .= '</select>';
                          }
                          $paroisseid = $Row['paroisseid'];
                          $html .= '<select class="form-control" tabindex="120" name="fcommunityid'.$paroisseid.'" id="fcommunityid'.$paroisseid.'" style="width:50%;display:none">
                          <option value="0"></option>
                          <option value="'.$Row['communauteid'].'">'.$Row['nom'].'</option>';
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
            <p class="Bold Center" style="text-decoration: underline;">
              DISPONIBILITÉ
            </p>
            <br>



            <table class="m-auto Bold TableBorder">
              <tr>
                <td style="width:25%"></td>
                <td class="Center" style="width:25%"><label>AVANT-MIDI</label></td>
                <td class="Center" style="width:25%"><label>APRÈS-MIDI</label></td>
                <td class="Center" style="width:25%"><label>SOIR</label></td>
              </tr>
              <tr>
                <td><label>Lundi</label></td>
                <td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="130" name="flundiam"></td>
                <td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="140" name="flundipm"></td>
                <td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="150" name="flundisoir"></td>
              </tr>
              <tr>
                <td><label>Mardi</label></td>
                <td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="160" name="fmardiam"></td>
                <td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="170" name="fmardipm"></td>
                <td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="180" name="fmardisoir"></td>
              </tr>
              <tr>
                <td><label>Mercredi</label></td>
                <td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="190" name="fmercrediam"></td>
                <td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="200" name="fmercredipm"></td>
                <td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="210" name="fmercredisoir"></td>
              </tr>
              <tr>
                <td><label>Jeudi</label></td>
                <td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="220" name="fjeudiam"></td>
                <td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="230" name="fjeudipm"></td>
                <td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="240" name="fjeudisoir"></td>
              </tr>
              <tr>
                <td><label>Vendredi</label></td>
                <td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="250" name="fvendrediam"></td>
                <td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="260" name="fvendredipm"></td>
                <td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="270" name="fvendredisoir"></td>
              </tr>
              <tr>
                <td><label>Samedi</label></td>
                <td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="280" name="fsamediam"></td>
                <td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="290" name="fsamedipm"></td>
                <td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="300" name="fsamedisoir"></td>
              </tr>
              <tr>
                <td><label>Dimanche</label></td>
                <td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="310" name="fdimancheam"></td>
                <td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="320" name="fdimanchepm"></td>
                <td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="330" name="fdimanchesoir"></td>
              </tr>
            </table>

            <br>
            <div class="Center">
              <input class="btn btn-primary" type="button" tabindex="340" name="btnSubmitForm" value="Envoyer" onclick="fnSubmit();">
            </div>


          </form>';

    echo $html;
  }

  public static function getFormListHTML(){
    $conn = OpenCon();

    $SQL = 'CALL GetAllFormBenevolat();';

    if (!$RSSQL = $conn->query($SQL)){
      echo 'Erreur lors de la requête à la base de données.';
    }

    CloseCon($conn);

    $html = '';

    if ($RSSQL->num_rows > 0){
      $decrypt = new Encryption();
      $html .= '<div><h1>Liste des formulaires de bénévolat</h1></div>';
      while ($row = $RSSQL->fetch_assoc()){
        $html .= '<div cursor="pointer" class="row col-md-12 backgroundHover" >
                    <div class="col-md-1" onclick="fnGetSpecificFormData('.$row['formulaireid'].')"><p>'.$row['formulaireid'].'</p></div>
                    <div class="col-md-5" onclick="fnGetSpecificFormData('.$row['formulaireid'].')"><p>'.$decrypt->decryptData($row['courriel'], $row['key'], $row['iv']).'</p></div>
                    <div class="col-md-5" onclick="fnGetSpecificFormData('.$row['formulaireid'].')"><p>'.$row['nomparoisse'].'</p></div>
                    <div class="col-md-1"><input type="button" class="btn btn-primary" name="btnDelete" value="Supprimer" onclick="fnDeleteConfirmation('.$row['formulaireid'].')"></div>
                  </div>';
      }
    }

    echo $html;
  }

  public static function getFormSpecData($formid){

    $conn = OpenCon();

    $SQL = "CALL GetFormBenevolat('".$formid."');";

    if (!$RSSQL = $conn->query($SQL)){
      echo 'Erreur lors de la requête à la base de données.';
    }

    CloseCon($conn);

    if ($RSSQL->num_rows > 0){
      $row = $RSSQL->fetch_assoc();

      $decrypt = new Encryption();

      $html = '<div class="container"><input class="btn btn-primary" type="button" value="Retour" onclick="parent.fnRedirection(\'Formulaire/FormulaireBenevolat.php\', 0);"></div>
            <form class="container" name="formSubmit" id="formSubmit">
            <input type="hidden" name="action" id="action" value="submit">
            <div class="form-group row">
              <label for="ffirstname" class="col-md-1 col-form-label">Prénom:</label>
              <div class="col-md-5">
                <input type="text" class="form-control" id="ffirstname" name="ffirstname" tabindex="10" readonly placeholder="Prénom" value="'.$decrypt->decryptdata($row['prenom'],$row['key'],$row['iv']).'">
              </div>
              <label for="flastname" class="col-md-1 col-form-label">Nom:</label>
              <div class="col-md-5">
                <input type="text" class="form-control" id="flastname" name="flastname" tabindex="20" readonly placeholder="Nom" value="'.$decrypt->decryptdata($row['nom'],$row['key'],$row['iv']).'">
              </div>
            </div>
            <div class="form-group row">
              <label for="faddress" class="col-md-1 col-form-label">Adresse</label>
              <div class="col-md-11">
                <input type="text" class="form-control" id="faddress" name="faddress" tabindex="30" readonly placeholder="Adresse" value="'.$decrypt->decryptdata($row['adresse'],$row['key'],$row['iv']).'">
              </div>
            </div>
            <div class="form-group row">
              <label for="fphone" class="col-md-1 col-form-label">Tél. :</label>
              <div class="col-md-11">
                <input type="tel" class="form-control" id="fphone" name="fphone" tabindex="40" readonly placeholder="Tél." pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" value="'.$decrypt->decryptdata($row['telephone'],$row['key'],$row['iv']).'">
              </div>
            </div>
            <div class="form-group row">
              <label for="fcellphone" class="col-md-1 col-form-label">Tél. cell:</label>
              <div class="col-md-11">
                <input type="tel" class="form-control" id="fcellphone" name="fcellphone" readonly tabindex="50" placeholder="Tél. cell" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" value="'.$decrypt->decryptdata($row['cellulaire'],$row['key'],$row['iv']).'">
              </div>
            </div>
            <div class="form-group row">
              <label for="femail" class="col-md-1 col-form-label">Courriel</label>
              <div class="col-md-11">
                <input type="email" class="form-control" id="femail" name="femail" readonly  tabindex="60" placeholder="Courriel" value="'.$decrypt->decryptdata($row['courriel'],$row['key'],$row['iv']).'">
              </div>
            </div>

            <table style="width:100%;height:100%;margin-left:auto;margin-right:auto;border-collapse: collapse;">
              <tr>
                <td colspan="4">
                  <br>
                  <p>Plusieurs services ou compétences sont requis dans nos communautés. Il y a d’abord les services liés à
                    la vie liturgique (lecteurs, servants de messe, membres des chorales, comités de liturgie, catéchètes,
                    etc). Des bénévoles sont aussi requis pour divers services (aide à la correspondance, secrétariat,
                    réception, menuiserie, construction, etc). D’autres compétences plus pointues sont recherchées dans
                    certaines situations (en droit, en informatique, en gestion, en communication, en ingénierie, en marketing,
                    en comptabilité et finance, etc).</p>
                </td>
              </tr>

              <tr>
                <td colspan="4" style="width:75%">
                  <br>
                  <p>Indiquez, le ou les bénévolats que vous seriez prêt à faire pour votre communauté ou l’une ou
                    l’autre des paroisses.</p>
                </td>
              </tr>
              <tr>
                <td colspan="2">
                  <ul>
                    <li>
                      <input class="form-control" type="text" tabindex="70" name="fbenevolat1" readonly id="fbenevolat1" style="width:100%" length="500" value="'.$row['benevolat1'].'">
                    </li>
                    <li>
                      <input class="form-control" type="text" tabindex="80" name="fbenevolat2" readonly id="fbenevolat2" style="width:100%" length="500" value="'.$row['benevolat2'].'">
                    </li>
                    <li>
                      <input class="form-control" type="text" tabindex="90" name="fbenevolat3" readonly id="fbenevolat3" style="width:100%" length="500" value="'.$row['benevolat3'].'">
                    </li>
                    <li>
                      <input class="form-control" type="text" tabindex="100" name="fbenevolat4" readonly id="fbenevolat4" style="width:100%" length="500" value="'.$row['benevolat4'].'">
                    </li>
                  </ul>
                </td>
              </tr>
              <tr>
                <td colspan="4">
                  <br>
                  <p>Pour quelle communauté ou paroisse souhaitez-vous faire votre bénévolat?</p>
                </td>
              </tr>
              <tr>
                <td colspan="2">
                  <select class="form-control" disabled tabindex="110" name="fparoisseid" id="fparoisseid" style="width:50%" onchange="fnCommunityList()">
                    <option value="0"></option>';
                              
                      
                      $paroissecommunaute = new ParoisseCommunaute();
                      
                      $Result = $paroissecommunaute->getAllParoisse();
                      
                      if ($Result->num_rows > 0){
                        while ($Row = $Result->fetch_assoc()){
                          $html .= '<option ';
                          if ($row['paroisseid'] == $Row['paroisseid']){
                            $html .= 'selected';
                          }
                          $html .= ' value="'.$Row['paroisseid'].'">'.$Row['nom'].'</option>';
                        }
                      }  
                      

            $html .= '</select>
                </td>
              </tr>

              <tr>
                <td colspan="2">';
     
                    $Result = $paroissecommunaute->getAllCommunauteOrderParoisse();

                    if ($Result->num_rows > 0){
                      $paroisseid = 0;
                      while ($Row = $Result->fetch_assoc()){
                        if ($paroisseid != $Row['paroisseid']){
                          if ($paroisseid <> 0){
                            $html .= '</select>';
                          }
                          $paroisseid = $Row['paroisseid'];
                          $html .= '<select class="form-control" disabled tabindex="120" name="fcommunityid'.$paroisseid.'" id="fcommunityid'.$paroisseid.'" style="width:50%;">
                          <option value="0"></option>
                          <option ';
                          if ($row['communauteid'] == $Row['communauteid']){
                            $html .= ' selected ';
                          }
                          $html .= ' value="'.$Row['communauteid'].'">'.$Row['nom'].'</option>';
                        }else{
                          $html .= '<option ';
                          if ($row['communauteid'] == $Row['communauteid']){
                            $html .= ' selected ';
                          }
                          $html .= ' value="'.$Row['communauteid'].'">'.$Row['nom'].'</option>';
                        }
                      }
                      $html .= '</select>';
                    }  



                $html .= '</td>
              </tr>
            </table>

            <br>
            <p class="Bold Center" style="text-decoration: underline;">
              DISPONIBILITÉ
            </p>
            <br>



            <table class="Bold TableBorder" align="center">
              <tr>
                <td style="width:25%"></td>
                <td class="Center" style="width:25%"><label>AVANT-MIDI</label></td>
                <td class="Center" style="width:25%"><label>APRÈS-MIDI</label></td>
                <td class="Center" style="width:25%"><label>SOIR</label></td>
              </tr>
              <tr>
                <td><label>Lundi</label></td>
                <td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="130" disabled name="flundiam" '.FNCheckbox($row['lundiam']).'></td>
                <td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="140" disabled name="flundipm" '.FNCheckbox($row['lundipm']).'></td>
                <td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="150" disabled name="flundisoir" '.FNCheckbox($row['lundisoiree']).'></td>
              </tr>
              <tr>
                <td><label>Mardi</label></td>
                <td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="160" disabled name="fmardiam" '.FNCheckbox($row['mardiam']).'></td>
                <td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="170" disabled name="fmardipm" '.FNCheckbox($row['mardipm']).'></td>
                <td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="180" disabled name="fmardisoir" '.FNCheckbox($row['mardisoiree']).'></td>
              </tr>
              <tr>
                <td><label>Mercredi</label></td>
                <td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="190" disabled name="fmercrediam" '.FNCheckbox($row['mercrediam']).'></td>
                <td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="200" disabled name="fmercredipm" '.FNCheckbox($row['mercredipm']).'></td>
                <td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="210" disabled name="fmercredisoir" '.FNCheckbox($row['mercredisoiree']).'></td>
              </tr>
              <tr>
                <td><label>Jeudi</label></td>
                <td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="220" disabled name="fjeudiam" '.FNCheckbox($row['jeudiam']).'></td>
                <td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="230" disabled name="fjeudipm" '.FNCheckbox($row['jeudipm']).'></td>
                <td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="240" disabled name="fjeudisoir" '.FNCheckbox($row['jeudisoiree']).'></td>
              </tr>
              <tr>
                <td><label>Vendredi</label></td>
                <td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="250" disabled name="fvendrediam" '.FNCheckbox($row['vendrediam']).'></td>
                <td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="260" disabled name="fvendredipm" '.FNCheckbox($row['vendredipm']).'></td>
                <td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="270" disabled name="fvendredisoir" '.FNCheckbox($row['vendredisoiree']).'></td>
              </tr>
              <tr>
                <td><label>Samedi</label></td>
                <td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="280" disabled name="fsamediam" '.FNCheckbox($row['samediam']).'></td>
                <td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="290" disabled name="fsamedipm" '.FNCheckbox($row['samedipm']).'></td>
                <td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="300" disabled name="fsamedisoir" '.FNCheckbox($row['samedisoiree']).'></td>
              </tr>
              <tr>
                <td><label>Dimanche</label></td>
                <td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="310" disabled name="fdimancheam" '.FNCheckbox($row['dimancheam']).'></td>
                <td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="320" disabled name="fdimanchepm" '.FNCheckbox($row['dimanchepm']).'></td>
                <td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="330" disabled name="fdimanchesoir" '.FNCheckbox($row['dimanchesoiree']).'></td>
              </tr>
            </table>
      
          </form>';

    echo $html;
    }
  }

  public static function deleteForm($formid){
    $SQL = "CALL DeleteFormBenevolat('".$formid."')";

    $conn = OpenCon();

    if (!$conn->query($SQL)){
      return 'fail';
    }

    CloseCon($conn);

    return 'success';
  }
  
}

?>