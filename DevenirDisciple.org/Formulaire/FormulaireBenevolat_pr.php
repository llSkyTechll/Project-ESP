<?php

if (isset($_POST['action'])){
  $action = $_POST['action'];

  switch($action){
  case 'submit':
      FNSubmit();
  }
}

function FNSubmit(){
  if($_POST['firstname'] <> 'TEST' && $_POST['email'] <> 'TEST'){
    exit('success');
  }else {
    exit('fail');
  }
}

?>
