<?php

include '../PHPFunctions.php';

include '../ConnexionDB.php';

include 'FormulaireBenevolat_pr.php';

?>
<!doctype html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <title>Devenir Disciple</title>
  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
  <link rel="stylesheet" href="../css/include.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  
  <style>
    td, th {
      border: 1px solid #dddddd;
      text-align: left;
      padding: 8px;
    }
  </style>
  
  <script>
    function fnConnexion() {
      $(function() {
        $.ajax({
          type: 'post',
          url: 'FormulaireBenevolat.php',
          data: ({action: 'envoie', email: document.getElementById('femail').value , password: document.getElementById('fpassword').value}),
          success: function(data){
            if (data == 'fail'){
              Swal.fire('Email et/ou mot de passe incorrect.','','warning');
            }else if(data == 'success'){
              Swal.fire({
                title:'Connexion réussi.',
                icon: 'success'
              }).then((result)=>{
                  window.top.location.reload();
                }
              );
            }
          }
        })
      })
    };

  </script>
</head>

<body>
  <form>
    <table style="width:75%;height:100%;align:center">
      <tr colspan="4">
        <td align="right" style="width:50%">
          <?=GetLabel("firstname", $_SESSION["glangId"])?>
        </td>
        <td>
          <input type="text" name="ffirstname" id="ffirstname" value="">
        </td>
        <td align="right">
          <?=GetLabel("lastname", $_SESSION["glangId"])?>
        </td>
        <td>
          <input type="text" name="flastname" id="flastname" value="">
        </td>
      </tr>
      
      <tr>
        <td align="right">
          <?=GetLabel("address", $_SESSION["glangId"])?>
        </td>
        <td colspan="3" align="left">
          <input type="text" name="faddress" id="faddress" style="width:100%" value="">
        </td>
      </tr>
      
      <tr>
        <td align="right">
          <?=GetLabel("phone", $_SESSION["glangId"])?>
        </td>
        <td colspan="3" align="left">
          <input type="text" name="fphone" id="fphone" style="width:100%" value="">
        </td>
      </tr>
      
      <tr>
        <td align="right">
          <?=GetLabel("cellphone", $_SESSION["glangId"])?>
        </td>
        <td colspan="3" align="left">
          <input type="text" name="fcellphone" id="fcellphone" style="width:100%" value="">
        </td>
      </tr>
      
      <tr>
        <td align="right">
          <?=GetLabel("email", $_SESSION["glangId"])?>
        </td>
        <td colspan="3" align="left">
          <input type="text" name="femail" id="femail" style="width:100%" value="">
        </td>
      </tr>
      
      <tr></tr>
      
      <table align="center">
        <tr>
          <td style="width:25%"></td>
          <td style="width:25%">avant-midi</td>
          <td style="width:25%"><?=GetLabel("afternoon", $_SESSION["glangId"])?></td>
          <td style="width:25%">soir</td>
        </tr>
        <tr>
          <td><?=GetLabel("monday", $_SESSION["glangId"])?></td>
          <td><input type="checkbox" name=""></td>
          <td><input type="checkbox" name=""></td>
          <td><input type="checkbox" name=""></td>
        </tr>
        <tr>
          <td><?=GetLabel("tuesday", $_SESSION["glangId"])?></td>
          <td><input type="checkbox" name=""></td>
          <td><input type="checkbox" name=""></td>
          <td><input type="checkbox" name=""></td>
        </tr>
        <tr>
          <td><?=GetLabel("wednesday", $_SESSION["glangId"])?></td>
          <td><input type="checkbox" name=""></td>
          <td><input type="checkbox" name=""></td>
          <td><input type="checkbox" name=""></td>
        </tr>
        <tr>
          <td><?=GetLabel("thursday", $_SESSION["glangId"])?></td>
          <td><input type="checkbox" name=""></td>
          <td><input type="checkbox" name=""></td>
          <td><input type="checkbox" name=""></td>
        </tr>
        <tr>
          <td><?=GetLabel("friday", $_SESSION["glangId"])?></td>
          <td><input type="checkbox" name=""></td>
          <td><input type="checkbox" name=""></td>
          <td><input type="checkbox" name=""></td>
        </tr>
        <tr>
          <td><?=GetLabel("saturday", $_SESSION["glangId"])?></td>
          <td><input type="checkbox" name=""></td>
          <td><input type="checkbox" name=""></td>
          <td><input type="checkbox" name=""></td>
        </tr>
        <tr>
          <td><?=GetLabel("sunday", $_SESSION["glangId"])?></td>
          <td><input type="checkbox" name=""></td>
          <td><input type="checkbox" name=""></td>
          <td><input type="checkbox" name=""></td>
        </tr>
      </table>
    </table>
  </form>
</body>

</html>
