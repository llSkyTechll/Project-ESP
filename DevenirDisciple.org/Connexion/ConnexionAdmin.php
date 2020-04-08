<?php

session_start();

require_once '../ConnexionDB.php';

require_once 'ConnexionAdmin_pr.php';

?>
<!doctype html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Devenir Disciple</title>
  <!-- Bootstrap4-->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

  <script src="../JavaScript/JSFunction.js"></script>
  <script src="../JavaScript/JQuery1.9.1.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
  <link rel="stylesheet" href="../css/include.css">


  <script>
    function fnConnexion() {
      $(function() {
        $.ajax({
          type: 'post',
          url: 'ConnexionAdmin.php',
          data: ({action: 'connexion', email: document.getElementById('femail').value , password: document.getElementById('fpassword').value}),
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
          <input class="btn btn-primary" type="button" name="btnConnect" value="Se connecter" onclick="fnConnexion();">
        </td>
      </tr>
    </table>
  </form>
</body>

<?php require_once '../Footer.php';?>

</html>
