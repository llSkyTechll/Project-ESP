<?php

require_once '../PHPFunctions.php';

require_once '../Class/clsFormulaireContactDAO.php';

if (isset($_POST['action'])){
  switch($_POST['action']){
    case 'loadFormData':
      FNLoadFormData();
    case 'deleteForm':
      FNDeleteForm();
    case 'submit':
      FNSubmit();
  }
}

function FNSubmit(){  
  exit(FormulaireContactDAO::saveFormulaire($_POST['prenom'], $_POST['nom'], $_POST['courriel'], $_POST['telephone'], $_POST['message']));
}

function LoadHTML(){
  if (!Admin::isConnected()){
    FormulaireContactDAO::getFormHTML();
  }else if($_SESSION['gformcontactid'] == 0){
    echo '<div><h1>Liste des formulaires de contact</h1></div>';
    $formArray = FormulaireContactDAO::getFormList();;
    if($formArray != null){
      for($x = 0; $x < count($formArray); $x++){
        $formArray[$x]->getFormListHTML();
      }
    }
  }else{
    FormulaireContactDAO::getFormSpecData($_SESSION['gformcontactid']);
  }
}

function FNLoadFormData(){
  if (isset($_POST['formid'])){
    $_SESSION['gformcontactid'] = $_POST['formid'];
    exit('success');
  }
}

function FNDeleteForm(){
  if (isset($_POST['formid'])){
    exit(FormulaireContactDAO::deleteForm($_POST['formid']));
  }
}

?>