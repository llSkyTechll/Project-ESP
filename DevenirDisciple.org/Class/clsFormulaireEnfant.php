<?php

class FormulaireEnfant{

  private $formulaireId;
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

  function __construct($formulaireId, $adresse, $codePostal, $courriel, $dateDeNaissance, $nomPere, $telPere, $nomMere, $telMere, $bapteme, $pardon, $eucharistie, $allergies,
                       $paroisseId, $communityId, $initiation, $ptitePasto, $agnelets, $premierPardon, $premiereCommunion, $confirmation, $brebis, $key, $iv){
    
    $this->formulaireId       = $formulaireId;
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

}

?>