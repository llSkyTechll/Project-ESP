<?php

class FormulaireContact{

  private $formulaireId;
  private $prenom;
  private $nom;
  private $courriel;
  private $telephone;
  private $message;
  private $key;
  private $iv;

  function __construct($formulaireid, $prenom, $nom, $courriel, $telephone, $message, $key, $iv){
    $this->formulaireId = $formulaireid;
    $this->prenom = $prenom;
    $this->nom = $nom;
    $this->courriel = $courriel;
    $this->telephone = $telephone;
    $this->message = $message;
    $this->key = $key;
    $this->iv = $iv;
  }

  function getFormListHTML(){
    $decrypt = new Encryption();
    $html = '
               <div style="cursor:pointer" class="row col-md-12 backgroundHover" >
                 <div class="col-md-1" onclick="fnGetSpecificFormData('.$this->formulaireId.')"><p>'.$this->formulaireId.'</p></div>
                 <div class="col-md-5" onclick="fnGetSpecificFormData('.$this->formulaireId.')"><p>'.$decrypt->decryptData($this->courriel, $this->key, $this->iv).'</p></div>
                 <div class="col-md-5" onclick="fnGetSpecificFormData('.$this->formulaireId.')"><p>'.$decrypt->decryptData($this->prenom, $this->key, $this->iv).'</p></div>
                 <div class="col-md-1"><input type="button" class="btn btn-primary" name="btnDelete" value="Supprimer" onclick="fnDeleteConfirmation('.$this->formulaireId.')"></div>
               </div>
             ';
    echo $html;
  }

  function getFormDataDetails(){
    $decrypt = new Encryption();
    $html = '';
    $html = '<div class="container"><input class="btn btn-primary" type="button" value="Retour" onclick="parent.fnRedirection(\'Formulaire/FormulaireContact.php\', 0);"></div>';
    $html .= '
        <form class="container col-md-6" id="formConnexion">
          <div class="form-group row">
            <div class="col-md-6">
              <label for="ffirstname" class=" col-form-label">Votre prénom</label>
      
              <input type="text" class="form-control" id="ffirstname" readonly name="ffirstname" maxlength="100" tabindex="10" value="'.$decrypt->decryptData($this->prenom, $this->key, $this->iv).'" placeholder="Prénom">
            </div>
            <div class="col-md-6">
              <label for="flastname" class=" col-form-label">Votre nom</label>
              <input type="text" class="form-control" id="flastname" readonly name="flastname" maxlength="100" tabindex="20" value="'.$decrypt->decryptData($this->nom, $this->key, $this->iv).'" placeholder="Nom">
            </div>
          </div>
          <div class="form-group row">
            <div class="col-md-6">
              <label for="fcourriel" class=" col-form-label">Votre adresse courriel</label>
              <input type="text" class="form-control" id="fcourriel" readonly name="fcourriel" maxlength="100" tabindex="30" value="'.$decrypt->decryptData($this->courriel, $this->key, $this->iv).'" placeholder="courriel">
            </div>
            <div class="col-md-6">
              <label for="ftelephone" class="col-form-label">Votre numéro de téléphone</label>
              <input type="text" class="form-control" id="ftelephone" readonly name="ftelephone" maxlength="100" tabindex="40" value="'.$decrypt->decryptData($this->telephone, $this->key, $this->iv).'" placeholder="numéro de téléphone">
            </div>
          </div>
          <div class="form-group row">
            <div class="col-md-12">
              <label for="fmessage" class="col-md-6 col-form-label">Votre message</label>
              <textarea class="form-control" id="fmessage" tabindex="50" readonly name="fmessage" maxlength="8000" placeholder="Votre message" tabindex="50">'.$this->message.'</textarea>
            </div>
          </div>
        </form>
        <br>';

    echo $html;
  }

}

?>