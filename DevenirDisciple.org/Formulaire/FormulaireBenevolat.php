<?php

require_once '../ConnexionDB.php';

require_once 'FormulaireBenevolat_pr.php';

require_once '../Class/clsParoisseCommunaute.php';

require_once '../Class/clsEncrypt.php';

$conn = OpenCon();

?>

<!doctype html>
<html lang="en">

<head>
	<title>Devenir Disciple</title>

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

	<style>
		.backgroundHover:hover {
			background-color: #ccc;
		}
	</style>

	<script>
		function fnCommunityList() {
			if (document.getElementById("fparoisseid").value == 0) {
				document.getElementById("fcommunityid1").style.display = "none";
				document.getElementById("fcommunityid2").style.display = "none";
			} else if (document.getElementById("fparoisseid").value == 1) {
				document.getElementById("fcommunityid1").style.display = "";
				document.getElementById("fcommunityid2").style.display = "none";
			} else {
				document.getElementById("fcommunityid1").style.display = "none";
				document.getElementById("fcommunityid2").style.display = "";
			}
		}

		function fnSubmit() {
			document.getElementById("ffirstname").style.borderColor = "";
			document.getElementById("flastname").style.borderColor = "";
			document.getElementById("femail").style.borderColor = "";
			document.getElementById("fphone").style.borderColor = "";
			document.getElementById("fcellphone").style.borderColor = "";
      if (fnValidateEmptyFields() == false){
        Swal.fire("Formulaire invalide", 'Veuillez remplir les champs obligatoires', 'warning');
        return;
      }
      
			$(function() {
				$.ajax({
					type: 'post',
					url: 'FormulaireBenevolat.php',
					data: ({
						formdata: $("#formSubmit").serialize()
					}),
					success: function(data) {
						if (data.trim() == 'emptyFields') {
               if (fnValidateEmptyFields() == false){
                Swal.fire("Formulaire invalide", 'Veuillez remplir les champs obligatoires', 'warning');
              }
						} else if (data.trim() == 'Success') {
							Swal.fire({
								title: 'Envoie effectué avec succès',
								icon: 'success'
							}).then((result) => {
								window.top.location.reload();
							});
						} else if (data.trim() == "Fail") {
							Swal.fire("Erreur lors de l'envoie", "Impossible d'envoyer le formulaire", 'error');
						}
					}
				})
			})
		};
    
    function fnValidateEmptyFields(){
      var result = true;
      if (document.getElementById("ffirstname").value.trim() == ''){
        document.getElementById("ffirstname").style.borderColor = "red";
        result = false;
      }
      if (document.getElementById("flastname").value.trim() == ''){
        document.getElementById("flastname").style.borderColor = "red";
        result = false;
      }
      if (document.getElementById("femail").value.trim() == ''){
        document.getElementById("femail").style.borderColor = "red";
        result = false;
      }
      if (document.getElementById("fphone").value.trim() == '' && document.getElementById("fcellphone").value.trim() == ''){
        document.getElementById("fphone").style.borderColor = "red";
        document.getElementById("fcellphone").style.borderColor = "red";
        result = false;
      }
      return result;
    }

		function fnGetSpecificFormData(formid){
      $.ajax({
          type: 'post',
          url: 'FormulaireBenevolat.php',
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
          url: 'FormulaireBenevolat.php',
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
	<br>
    <div class="content container">
      <?php
      
      loadHTML();

      ?>
    </div>
    <br>

	<?php require_once '../Footer.php';?>

</body>

</html>

<?php
	CloseCon($conn);
?>
