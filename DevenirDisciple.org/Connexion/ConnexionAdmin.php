<?php

session_start();

include '/../ConnexionDB.php';

include 'ConnexionAdmin_pr.php';

?>
<!doctype html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <title>Devenir Disciple</title>
  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script>
    function fnConnexion() {
      $(function() {
        $.ajax({
          type: 'post',
          url: 'ConnexionAdmin.php',
          data: ({action: 'connexion', email: document.getElementById('femail').value , password: document.getElementById('fpassword').value}),
          success: function(data){
            if (data == 'fail'){
              alert('Email et/ou mot de passe incorrect.');
            }else if(data == 'success'){
              alert('Connexion réussi.');
              window.top.location.reload();
            }
          }
        });
      });
    }

  </script>
</head>

<body>
  <form>
    <table style="width:100%;height:100%">
      <tr>
        <td align="right" style="width:50%">
          Courriel:
        </td>
        <td>
          <input type="text" name="femail" id="femail" value="">
        </td>
      </tr>
      <tr>
        <td align="right">
          Mot de passe:
        </td>
        <td>
          <input type="password" name="fpassword" id="fpassword" value="">
        </td>
      </tr>
      <tr>
        <td colspan="2" align="center">
          <input type="button" name="btnConnect" value="Se connecter" onclick="fnConnexion();">
        </td>
      </tr>
    </table>
  </form>
</body>

</html>
