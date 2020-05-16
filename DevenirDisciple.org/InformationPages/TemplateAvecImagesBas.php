<?php

require_once '../ConnexionDB.php';

require_once '../PHPFunctions.php';

require_once '../Class/clsTemplateTextDAO.php';

require_once '../InformationPages/TemplateAvecImageBas_pr.php';

?>

<!doctype html>
<html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap4-->
    <link rel="stylesheet" href="../css/Bootstrap.css" >
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
              }else if (data.trim() == "fail") {
                Swal.fire("Erreur", "Une erreur c'est produite.", 'error');
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

		function fnSaveImagesMagasins() {

			var allArray = [];
			var allOrderDisplay = document.querySelectorAll("input[type = number]");
			var allVisible = document.querySelectorAll("input[type = checkbox]");
			for (var x = 0; x < allOrderDisplay.length; x++) {
				var OrderDispay = allOrderDisplay[x].id;
				var index = OrderDispay.indexOf("_");
				var id = OrderDispay.substring(index + 1, OrderDispay.lenght);
				var array = [id, allVisible[x].checked ? 1 : 0, allOrderDisplay[x].value];
				allArray.push(array);
			}

			$.ajax({
				type: 'post',
				url: 'TemplateAvecImagesBas.php',
				data: ({
					action: 'SaveImagesMagasins',
					arrayImageMagasin: JSON.stringify(allArray)
				}),
				success: function(data) {

					if (data.trim() == 'fail') {
						Swal.fire("Une erreur c'est produite", '', 'warning');
					} else if (data.trim() == 'success') {
						Swal.fire({
							title: 'Sauvegarde réussi.',
							icon: 'success'
						}).then((result) => {
							window.top.location.reload();
						});
					}
				}
			});

		}

		function fnDeleteConfirmation(ImageMagasinId) {
			Swal.fire({
				title: 'Are you sure?',
				text: "You won't be able to revert this!",
				icon: 'warning',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: 'Yes, delete it!'
			}).then((result) => {
				if (result.value) {
					fnDelete(ImageMagasinId);
				}
			})
		}

		function fnDelete(ImageMagasinId) {
			$.ajax({
				type: 'post',
				url: 'TemplateAvecImagesBas.php',
				data: ({
					action: "DeleteImageMagasin",
					ImageMagasinId: ImageMagasinId
				}),
				success: function(data) {
					
					if (data.trim() == 'success') {
						Swal.fire({
							title: 'Supression effectué avec succès',
							icon: 'success'
						}).then((result) => {
							window.top.location.reload();
						});
					} else if (data.trim() == 'failDB') {
						Swal.fire("Une erreur c'est produite", 'Impossible de suprimmer le pdf de la base de donnée', 'warning');
					} else if (data.trim() == 'failFile') {
						Swal.fire("Une erreur c'est produite", 'Impossible de supprimer le fichier', 'warning');
					}
				}
			})
		}

	</script>
    
  </head>

  <body>
  
    <div class="content container text-left">
    
    <?php
    //echo $_SESSION['gmenuId'];
    	DisplayMessage();
      
      $pageContent = TemplateTextDAO::loadPageContent();  
      
      $pageContent->getHTMLPageContent();

      loadPageContent();
     
    ?>
    
    <!--Images-->
    
    </div>

  </body>
  <?php require_once '../Footer.php';?>
</html>
