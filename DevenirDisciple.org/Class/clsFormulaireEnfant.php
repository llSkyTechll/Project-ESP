<?php

require_once 'clsEncrypt.php';

class FormulaireEnfant{

  private $formulaireId;
  private $nom;
  private $adresse;
  private $codePostal;
  private $courriel;
  private $dateDeNaissance;
  private $nomPere;
  private $telPere;
  private $nomMere;
  private $telMere;
  private $bapteme;
  private $pardon;
  private $eucharistie;
  private $allergies;
  private $paroisseId;
  private $communityId;
  private $initiation;
  private $ptitePasto;
  private $agnelets;
  private $premierPardon;
  private $premiereCommunion;
  private $confirmation;
  private $brebis;
  private $key;
  private $iv;

  function __construct($formulaireId, $nom, $adresse, $codePostal, $courriel, $dateDeNaissance, $nomPere, $telPere, $nomMere, $telMere, $bapteme, $pardon, $eucharistie, $allergies,
                       $paroisseId, $communityId, $initiation, $ptitePasto, $agnelets, $premierPardon, $premiereCommunion, $confirmation, $brebis, $key, $iv){
    
    $this->formulaireId       = $formulaireId;
    $this->nom                = $nom;
    $this->adresse            = $adresse;
    $this->codePostal         = $codePostal;
    $this->courriel           = $courriel;
    $this->dateDeNaissance    = $dateDeNaissance;
    $this->nomPere            = $nomPere;
    $this->telPere            = $telPere;
    $this->nomMere            = $nomMere;
    $this->telMere            = $telMere;
    $this->bapteme            = $bapteme;
    $this->pardon             = $pardon;
    $this->eucharistie        = $eucharistie;
    $this->allergies          = $allergies;
    $this->paroisseId         = $paroisseId;
    $this->communityId        = $communityId;
    $this->initiation         = $initiation;
    $this->ptitePasto         = $ptitePasto;
    $this->agnelets           = $agnelets;
    $this->premierPardon      = $premierPardon;
    $this->premiereCommunion  = $premiereCommunion;
    $this->confirmation       = $confirmation;
    $this->brebis             = $brebis;
    $this->key                = $key;
    $this->iv                 = $iv;

  }

  function getFormListHTML(){
    $decrypt = new Encryption();
    $communityId = '';
    if ($this->communityId != null){
      $communityId = $this->communityId;
    }
    $html = '
               <div style="cursor:pointer" class="row col-md-12 backgroundHover" >
                 <div class="col-md-1" onclick="fnGetSpecificFormData('.$this->formulaireId.')"><p>'.$this->formulaireId.'</p></div>
                 <div class="col-md-5" onclick="fnGetSpecificFormData('.$this->formulaireId.')"><p>'.$decrypt->decryptData($this->courriel, $this->key, $this->iv).'</p></div>
                 <div class="col-md-5" onclick="fnGetSpecificFormData('.$this->formulaireId.')"><p>'.$communityId.'</p></div>
                 <div class="col-md-1"><input type="button" class="btn btn-primary" name="btnDelete" value="Supprimer" onclick="fnDeleteConfirmation('.$this->formulaireId.')"></div>
               </div>
             ';
    echo $html;
  }

  function getFormDataDetails(){
    $decrypt = new Encryption();

    $html = '<div class="container"><input class="btn btn-primary" type="button" value="Retour" onclick="parent.fnRedirection(\'Formulaire/FormulaireEnfant.php\', 0);"></div>';

    $html .= '<form class="container" name="formSubmit" id="formSubmit">
      <input type="hidden" name="action" id="action" value="submit">
      <div class="form-group row">
        <label for="fname" class="col-md-2 col-form-label">Nom:</label>
        <div class="col-md-10">
          <input type="text" class="form-control" id="fname" readonly name="fname" tabindex="10" placeholder="Nom" value="'.$decrypt->decryptData($this->nom, $this->key, $this->iv).'">
        </div>
      </div>
      <div class="form-group row">
        <label for="faddress" class="col-md-2 col-form-label">Adresse complète:</label>
        <div class="col-md-10">
          <input type="text" class="form-control" id="faddress" readonly name="faddress" tabindex="20" placeholder="Adresse" value="'.$decrypt->decryptData($this->adresse, $this->key, $this->iv).'">
        </div>
      </div>
      <div class="form-group row">
        <label for="fzipcode" class="col-md-2 col-form-label">Code postal:</label>
        <div class="col-md-10">
          <input type="text" class="form-control" id="fzipcode" readonly name="fzipcode" tabindex="30" placeholder="Code postal" value="'.$decrypt->decryptData($this->codePostal, $this->key, $this->iv).'">
        </div>
      </div>
      <div class="form-group row">
        <label for="femail" class="col-md-2 col-form-label">Adresse courriel:</label>
        <div class="col-md-10">
          <input type="text" class="form-control" id="femail" readonly name="femail" tabindex="40" placeholder="Courriel" value="'.$decrypt->decryptData($this->courriel, $this->key, $this->iv).'">
        </div>
      </div>
      <div class="form-group row">
        <label for="fdatenaissance" class="col-md-2 col-form-label">Date de naissance:</label>
        <div class="col-md-10">
          <input type="text" class="form-control" id="fdatenaissance" readonly name="fdatenaissance" tabindex="40" placeholder="Date de naissance" value="'.$decrypt->decryptData($this->dateDeNaissance, $this->key, $this->iv).'">
        </div>
      </div>
      <div class="form-group row">
        <label for="fnompere" class="col-md-3 col-form-label">Nom du père (ou tuteur):</label>
        <div class="col-md-6">
          <input type="text" class="form-control" id="fnompere" readonly name="fnompere" tabindex="40" placeholder="Nom du père (ou tuteur)" value="'.$decrypt->decryptData($this->nomPere, $this->key, $this->iv).'">
        </div>
        <label for="ftelpere" class="col-md-1 col-form-label">Tél:</label>
        <div class="col-md-2">
          <input type="tel" class="form-control" id="ftelpere" readonly name="ftelpere" tabindex="50" placeholder="Téléphone" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" value="'.$decrypt->decryptData($this->telPere, $this->key, $this->iv).'">
        </div>
      </div>
      <div class="form-group row">
        <label for="fnommere" class="col-md-3 col-form-label">Nom de la mère (ou tutrice):</label>
        <div class="col-md-6">
          <input type="text" class="form-control" id="fnommere" readonly name="fnommere" tabindex="40" placeholder="Nom de la mère (ou tutrice)" value="'.$decrypt->decryptData($this->nomMere, $this->key, $this->iv).'">
        </div>
        <label for="ftelmere" class="col-md-1 col-form-label">Tél:</label>
        <div class="col-md-2">
          <input type="tel" class="form-control" id="ftelmere" readonly name="ftelmere" tabindex="50" placeholder="Téléphone" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" value="'.$decrypt->decryptData($this->telMere, $this->key, $this->iv).'">
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
            <input class="form-control" type="text" readonly tabindex="70" name="fbapteme" id="fbapteme" style="width:100%" length="500" value="'.$this->bapteme.'">
          </td>
        </tr>
        <tr>
          <td style="width:10%">
            <label for="fpardon">Pardon:</label>
          </td>
          <td style="width:90%">
            <input class="form-control" type="text" readonly tabindex="80" name="fpardon" id="fpardon" style="width:100%" length="500" value="'.$this->pardon.'">
          </td>    
        </tr>
        <tr>
          <td style="width:10%">
            <label for="feucharistie">Eucharistie:</label>
          </td>
          <td style="width:90%">
            <input class="form-control" type="text" readonly tabindex="90" name="feucharistie" id="feucharistie" style="width:100%" length="500" value="'.$this->eucharistie.'">         
          </td>
        </tr>
        <tr>
          <td style="width:10%">
            <label for="fallergies"><i>Allergies:</i></label>
          </td>
          <td>
            <input class="form-control" type="text" readonly tabindex="100" name="fallergies" id="fallergies" style="width:100%" length="500" value="'.$this->allergies.'">
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
            <select class="form-control" tabindex="110" name="fparoisseid" id="fparoisseid" disabled style="width:50%" onchange="fnCommunityList()">
              <option value="0"></option>';
                    
                $paroissecommunaute = new ParoisseCommunaute();
                
                $Result = $paroissecommunaute->getAllParoisse();
                
                if ($Result->num_rows > 0){
                  while ($Row = $Result->fetch_assoc()){
                    $html .= '<option ';
                    if($this->paroisseId == $Row['paroisseid']){
                      $html .= 'selected';
                     }
                    $html .= ' value="'.$Row['paroisseid'].'">'.$Row['nom'].'</option>';
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
                    $html .= '<select class="form-control" tabindex="120" disabled name="fcommunityid'.$paroisseid.'" id="fcommunityid'.$paroisseid.'" style="width:50%;">';
                    $html .= '<option value="0"></option>';
                    $html .= '<option';
                    if ($this->communityId == $Row['communauteid']){
                      $html .= ' selected';
                    }
                    $html .= ' value="'.$Row['communauteid'].'">'.$Row['nom'].'</option>';
                  }else{
                    $html .= '<option';
                    if ($this->communityId == $Row['communauteid']){
                      $html .= ' selected';
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
        <table class="Bold TableBorder" align="center">
        <tr>
          <td class="Center" style="width:16%"><label>Initiation:</label></td>
          <td class="Center" style="width:16%"><input class="big-checkbox" disabled type="checkbox" name="finitiation" id="finitiation" value="1" '.FNCheckbox($this->initiation).'></td>
          <td class="Center" style="width:16%"><label>P\'tite Pasto:</label></td>
          <td class="Center" style="width:16%"><input class="big-checkbox" disabled type="checkbox" name="fptitepasto" id="fptitepasto" value="1" '.FNCheckbox($this->ptitePasto).'></td>
          <td class="Center" style="width:16%"><label>Agnelets:</label></td>
          <td class="Center" style="width:16%"><input class="big-checkbox" disabled type="checkbox" name="fagnelets" id="fagnelets" value="1" '.FNCheckbox($this->agnelets).'></td>
        </tr>
        <tr>
          <td class="Center" style="width:16%"><label>Premier pardon:</label></td>
          <td class="Center" style="width:16%"><input class="big-checkbox" disabled type="checkbox" name="fpremierpardon" id="fpremierpardon" value="1" '.FNCheckbox($this->premierPardon).'></td>
          <td class="Center" style="width:16%"><label>Première communion:</label></td>
          <td class="Center" style="width:16%"><input class="big-checkbox" disabled type="checkbox" name="fpremierecommunion" id="fpremierecommunion" value="1" '.FNCheckbox($this->premiereCommunion).'></td>
          <td class="Center" style="width:16%"><label>Confirmation:</label></td>
          <td class="Center" style="width:16%"><input class="big-checkbox" disabled type="checkbox" name="fconfirmation" id="fconfirmation" value="1" '.FNCheckbox($this->confirmation).'></td>
        </tr>
        <tr>
          <td class="Center" style="width:16%"><label>Les Brebis de Jésus:</label></td>
          <td class="Center" style="width:16%"><input class="big-checkbox" disabled type="checkbox" name="fbrebis" id="fbrebis" value="1" '.FNCheckbox($this->brebis).'></td>
        </tr>
      </table>
      
      <br>

    </form>';

    echo $html;
  }
}

?>