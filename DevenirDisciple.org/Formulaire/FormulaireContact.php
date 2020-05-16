<?php

require_once '../ConnexionDB.php';

require_once 'FormulaireContact_pr.php';

$conn = OpenCon();

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

	<style>

    .backgroundHover:hover {
      background-color: #ccc;
    }

  </style>

	<script>

		function fnSubmit() {

			document.getElementById('ffirstname').style.borderColor = "";
			document.getElementById('flastname').style.borderColor = "";
			document.getElementById('fcourriel').style.borderColor = "";
			document.getElementById('ftelephone').style.borderColor = "";
			document.getElementById('fmessage').style.borderColor = "";

      if (fnValidateEmptyFields() == false){
        Swal.fire("Formulaire invalide", 'Veuillez remplir les champs obligatoires', 'warning');
        return;
      }
      
			$.ajax({
				type: 'post',
				url: 'FormulaireContact.php',
				data: ({
					action: 'submit',
					prenom: document.getElementById('ffirstname').value.trim(),
					nom: document.getElementById('flastname').value.trim(),
					courriel: document.getElementById('fcourriel').value.trim(),
					telephone: document.getElementById('ftelephone').value.trim(),
					message: document.getElementById('fmessage').value.trim(),
				}),
				success: function(data) {
					if (data.trim() == 'emptyFields') {
						if (fnValidateEmptyFields() == false){
							Swal.fire("Formulaire invalide", 'Veuillez remplir les champs obligatoires', 'warning');
						}
					} else if (data.trim() == 'success') {
						Swal.fire({
							title: 'Envoie effectué avec succès',
							icon: 'success'
						}).then((result) => {
							window.top.location.reload();
						});
					} else if (data.trim() == "fail") {
						Swal.fire("Erreur lors de l'envoie", "Impossible d'envoyer le formulaire", 'error');
					}
				}
			})
      
    }

		function fnValidateEmptyFields(){
			var validation = true;
			if (document.getElementById('ffirstname').value.trim() == ''){
				validation = false;
				document.getElementById('ffirstname').style.borderColor = "red";
			}
			if (document.getElementById('flastname').value.trim() == ''){
				validation = false;
				document.getElementById('flastname').style.borderColor = "red";
			}
			if (document.getElementById('fcourriel').value.trim() == ''){
				validation = false;
				document.getElementById('fcourriel').style.borderColor = "red";
			}
			if (document.getElementById('ftelephone').value.trim() == ''){
				validation = false;
				document.getElementById('ftelephone').style.borderColor = "red";
			}
			if (document.getElementById('fmessage').value.trim() == ''){
				validation = false;
				document.getElementById('fmessage').style.borderColor = "red";
			}
			return validation;
		}		

		function fnGetSpecificFormData(formid){
      $.ajax({
          type: 'post',
          url: 'FormulaireContact.php',
          data: ({
            action: "loadFormData",
            formid: formid
          }),
          success: function(data) {
            if (data.trim() == 'success') {
              window.top.location.reload();
            }
          }            
      })
    }

    function fnDeleteConfirmation(formid){
      Swal.fire({
        title: 'Confirmer la supression?',
        text: "Cette action est irréversible",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Supprimer'
      }).then((result) => {
        if (result.value) {
          fnDelete(formid);
        }
      })
    }

    function fnDelete(formid){
      $.ajax({
          type: 'post',
          url: 'FormulaireContact.php',
          data: ({
            action: "deleteForm",
            formid: formid
          }),
          success: function(data) {
            if (data.trim() == 'success') {
              Swal.fire({
                title: 'Supression effectué avec succès',
                icon: 'success'
              }).then((result) => {
                window.top.location.reload();
              });
            }else if(data.trim() == 'fail'){
              Swal.fire(
                'Erreur',
                'Une erreur est survenue.',
                'warning'
              )
            }
          }            
      })
    }

	</script>

</head>

<body>

  <div class="content container">
	
    <?php
      LoadHTML();
    ?>
    
  </div>

	<?php require_once '../Footer.php';?>

</body>

</html>
