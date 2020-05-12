<?php

require_once '../PHPFunctions.php';

require_once '../Class/clsFormulaireEnfantDAO.php';

if (isset($_POST['formdata'])){
  parse_str($_POST['formdata'], $formdata);
  $action = $formdata['action'];

  switch($action){
  case 'submit':
      FNSubmit($formdata);
  }
}

if (isset($_POST['action'])){
  switch($_POST['action']){
    case 'loadFormData':
      FNLoadFormData();
    case 'deleteForm':
      FNDeleteForm();
  }
}

function FNSubmit($formdata){  
  exit(FormulaireEnfantDAO::saveFormulaire($formdata));
}

function LoadHTML(){
  if (!Admin::isConnected()){
    FormulaireEnfantDAO::getFormHTML();
  }else if($_SESSION['gformenfantid'] == 0){
    echo '<div><h1>Liste des formulaires pour enfants</h1></div>';
    $formArray = FormulaireEnfantDAO::getFormList();;
    if($formArray != null){
      for($x = 0; $x < count($formArray); $x++){
        $formArray[$x]->getFormListHTML();
      }
    }
  }else{
    FormulaireEnfantDAO::getFormSpecData($_SESSION['gformenfantid']);
  }
}

function FNLoadFormData(){
  if (isset($_POST['formid'])){
    $_SESSION['gformenfantid'] = $_POST['formid'];
    exit('success');
  }
}

function FNDeleteForm(){
  if (isset($_POST['formid'])){
    exit(FormulaireEnfantDAO::deleteForm($_POST['formid']));
  }
}

?>