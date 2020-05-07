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

function FNSubmit($formdata){  
  exit(FormulaireEnfantDAO::saveFormulaire($formdata));
}

?>