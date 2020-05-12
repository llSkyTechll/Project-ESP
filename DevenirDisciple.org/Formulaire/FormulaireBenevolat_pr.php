<?php

require_once '../PHPFunctions.php';

require_once '../Class/clsFormulaireBenevolat.php';

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
  }
}

function FNSubmit($formdata){  
  $formulaireBenevolat =  new FormulaireBenevolat();
  
  exit($formulaireBenevolat->saveForm($formdata));
}

function loadHTML(){
  if (!Admin::isConnected()){
    FormulaireBenevolat::getFormHTML();
  }else if ($_SESSION['gformbenevolatid'] == 0){
    FormulaireBenevolat::getFormListHTML();
  }else{
    FormulaireBenevolat::getFormSpecData($_SESSION['gformbenevolatid']);
  } 
}

function FNLoadFormData(){
  If (isset($_POST['formid'])){
    $_SESSION['gformbenevolatid'] = $_POST['formid'];
    exit('success');
  }
}

?>
