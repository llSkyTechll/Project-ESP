<?php

require_once '../ConnexionDB.php';

require_once '../PHPFunctions.php';

require_once '../Class/clsTemplateTextDAO.php';

require_once '../InformationPages/TemplateText_pr.php';

require_once '../Uploads/UploadImage.php';

?>

<!doctype html>
<html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap4-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <script src="../JavaScript/JSFunction.js"></script>
    <script src="../JavaScript/JQuery1.9.1.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <link rel="stylesheet" href="../css/include.css">
    <title>Devenir Disciple</title>
    
    <script>
    
      function fnSavePageContent() {      
        $(function() {
          $.ajax({
            type: 'post',
            url: 'TemplateText.php',
            data: ({
              action:    'saveContent',
              contentId: document.getElementById('contentId').value,
              title:     document.getElementById('title').innerHTML,
              header:    document.getElementById('header').innerHTML,
              subtitle:  document.getElementById('subtitle').innerHTML,
              content:   document.getElementById('content').innerHTML
            }),
            success: function(data) {
              if (data.trim() == 'success') {
                Swal.fire({
                  title: 'Changement effectué avec succès',
                  icon: 'success'
                }).then((result) => {
                  window.top.location.reload();
                });
              } else if (data.trim() == "admin") {
                Swal.fire("Erreur", "Seul un administrateur du site peut effectuer des changements.", 'error');
              }
            }
          })
        })
      }
      
      <?php if(Admin::isConnected() == false) { ?>
        $(document).ready(function() {
          document.getElementById('title').innerHTML = document.getElementById('title').innerHTML.replace(/href/g, ' target="_blank" href');
          document.getElementById('subtitle').innerHTML = document.getElementById('subtitle').innerHTML.replace(/href/g, ' target="_blank" href');
          document.getElementById('header').innerHTML = document.getElementById('header').innerHTML.replace(/href/g, ' target="_blank" href');
          document.getElementById('content').innerHTML = document.getElementById('content').innerHTML.replace(/href/g, ' target="_blank" href');
        });
      <?php } ?>

    </script>
    
  </head>

  <body>
  
    <div class="container">
    
    <?php
			DisplayMessage();
      $pageContent = TemplateTextDAO::loadPageContent();  
      
      $pageContent->getHTMLPageContent();
     
    ?>

      <br>
      <div> 
        <input type="button" class="btn btn-primary" name="btnRedirectFormulaireEnfant" id="btnRedirectFormulaireEnfant" value="Inscription" onclick="parent.fnRedirection('Formulaire/FormulaireEnfant.php',0)">
      </div>
    
    </div>

  </body>
  <?php require_once '../Footer.php';?>
</html>
