<?php

require_once 'clsEncrypt.php';

require_once 'clsFormulaireContact.php';

class FormulaireContactDAO{
  
  public static function getFormHTML(){
    $html = '';
    $html .= '<h1>Écrivez-nous</h1>
    <form class="container col-md-6" id="formConnexion">
      <div class="form-group row">
        <div class="col-md-6">
          <label for="ffirstname" class=" col-form-label">Votre prénom</label>
  
          <input type="text" class="form-control" id="ffirstname" name="ffirstname" maxlength="100" tabindex="10" placeholder="Prénom">
        </div>
        <div class="col-md-6">
          <label for="flastname" class=" col-form-label">Votre nom</label>
          <input type="text" class="form-control" id="flastname" name="flastname" maxlength="100" tabindex="20" placeholder="Nom">
        </div>
      </div>
      <div class="form-group row">
        <div class="col-md-6">
          <label for="fcourriel" class=" col-form-label">Votre adresse courriel</label>
          <input type="text" class="form-control" id="fcourriel" name="fcourriel" maxlength="100" tabindex="30" placeholder="courriel">
        </div>
        <div class="col-md-6">
          <label for="ftelephone" class="col-form-label">Votre numéro de téléphone</label>
          <input type="text" class="form-control" id="ftelephone" name="ftelephone" maxlength="100" tabindex="40" placeholder="numéro de téléphone">
        </div>
      </div>
      <div class="form-group row">
        <div class="col-md-12">
          <label for="fmessage" class="col-md-6 col-form-label">Votre message</label>
          <textarea class="form-control" id="fmessage" tabindex="50" name="fmessage" maxlength="8000" placeholder="Votre message" tabindex="50"></textarea>
        </div>
      </div>
    </form>
    <br>
    <div class="Center">
      <input class="btn btn-primary" type="button" tabindex="60" name="btnSubmitForm" value="Envoyer" onclick="fnSubmit();">
    </div>';

    echo $html;
  }

  public static function saveFormulaire($prenom, $nom, $courriel, $telephone, $message){
    
    if (FormulaireContactDAO::validateFormulaire($prenom, $nom, $courriel, $telephone, $message)){
      $encrypt = new Encryption();

      $key = $encrypt->generateKey();
      $iv  = $encrypt->generateIV();

      $prenom = $encrypt->encryptData(FNSQL($prenom), $key, $iv);
      $nom    = $encrypt->encryptData(FNSQL($nom), $key, $iv);
      $courriel = $encrypt->encryptData(FNSQL($courriel), $key, $iv);
      $telephone = $encrypt->encryptData(FNSQL($telephone),$key, $iv);

      $conn = OpenCon();

      $param = "'".$prenom."','".$nom."','".$courriel."','".$telephone."','".$message."','".$conn->real_escape_string($key)."','".$conn->real_escape_string($iv)."'";

      $SQL = 'CALL FormulaireContactSave('.$param.');';
      
      if (!$conn->query($SQL)){
        exit('fail');
      }

      CloseCon($conn);

      exit('success');
    }else {
      exit('emptyFields');
    }
  }

  public static function validateFormulaire($prenom, $nom, $courriel, $telephone, $message){
    if (TRIM($prenom) == '' OR TRIM($nom) == '' OR TRIM($courriel) == '' OR TRIM($telephone) == '' OR TRIM($message) == ''){
      return false;
    }
    return true;
  }

  public static function getFormList(){
    $conn = OpenCon();

    $SQL  = 'CALL GetAllFormContact();';

    if (!$RSSQL = $conn->query($SQL)){
      exit('Une erreur est survenu dans la requête à la base de données.');
    }

    CloseCon($conn);

    $formlist = array();

    if ($RSSQL->num_rows > 0){
      while ($row = $RSSQL->fetch_assoc()){
        array_push($formlist, new FormulaireContact($row['formulaireid'], $row['prenom'], $row['nom'], $row['courriel'], $row['telephone'],
                   $row['message'], $row['key'], $row['iv']));
      }
      return $formlist;
    }
  }

  public static function getFormSpecData($formid){
    $conn = OpenCon();

    $SQL  = "CALL GetFormContact('".$formid."');";

    if (!$RSSQL = $conn->query($SQL)){
      exit('Une erreur est survenu dans la requête à la base de données.');
    }

    CloseCon($conn);

    if ($RSSQL->num_rows > 0){
      $row = $RSSQL->fetch_assoc();
      $formdata = new FormulaireContact($row['formulaireid'], $row['prenom'], $row['nom'], $row['courriel'], $row['telephone'],
                                        $row['message'], $row['key'], $row['iv']);
      $formdata->getFormDataDetails();
    }
  }

  public static function deleteForm($formid){
    $SQL = "CALL DeleteFormContact('".$formid."')";

    $conn = OpenCon();

    if (!$conn->query($SQL)){
      return 'fail';
    }

    CloseCon($conn);

    return 'success';
  }

}


?>