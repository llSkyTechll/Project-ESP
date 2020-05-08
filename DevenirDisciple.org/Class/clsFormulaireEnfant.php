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
    $html = '<div class="row">
               <div class="col-md-9" onclick="fnGetSpecificFormData('.$this->formulaireId.')">
                 <div class="col-md-3">'.$this->formulaireId.'</div>
                 <div class="col-md-3">'.$decrypt->decryptData($this->courriel, $this->key, $this->iv).'</div>
                 <div class="col-md-3">'.$communityId.'</div>
               </div>
               <div class="col-md-3"><input type="button" name="btnDelete" value="Delete" onclick="fnDelete('.$this->formulaireId.')"></div>
             </div>';
    echo $html;
  }

}

?>