<?php

require_once '../ConnexionDB.php';

require_once 'FormulaireEnfant_pr.php';

require_once '../Class/clsParoisseCommunaute.php';

require_once '../Class/clsFormulaireEnfantDAO.php';

$conn = OpenCon();

?>

<!doctype html>
<html lang="en">

<head>
  <title>Devenir Disciple</title>

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
      document.getElementById("fname").style.borderColor = "";
      document.getElementById("femail").style.borderColor = "";
      document.getElementById("fdatenaissance").style.borderColor = "";
      document.getElementById("fnompere").style.borderColor = "";
      document.getElementById("fnommere").style.borderColor = "";
      document.getElementById("ftelpere").style.borderColor = "";
      document.getElementById("ftelmere").style.borderColor = "";

      if (fnValidateEmptyFields() == false){
        Swal.fire("Formulaire invalide", 'Veuillez remplir les champs obligatoires', 'warning');
        return;
      }
      
      $(function() {
        $.ajax({
          type: 'post',
          url: 'FormulaireEnfant.php',
          data: ({
            formdata: $("#formSubmit").serialize()
          }),
          success: function(data) {
            if (data == 'emptyFields') {
               if (fnValidateEmptyFields() == false){
                Swal.fire("Formulaire invalide", 'Veuillez remplir les champs obligatoires', 'warning');
              }
            } else if (data == 'success') {
              Swal.fire({
                title: 'Envoie effectué avec succès',
                icon: 'success'
              }).then((result) => {
                window.top.location.reload();
              });
            } else if (data == "fail") {
              Swal.fire("Erreur lors de l'envoie", "Impossible d'envoyer le formulaire", 'error');
            }
          }
        })
      })
    };
    
    function fnValidateEmptyFields(){
      var result = true;
      if (document.getElementById("fname").value.trim() == ''){
        document.getElementById("fname").style.borderColor = "red";
        result = false;
      }
      if (document.getElementById("femail").value.trim() == ''){
        document.getElementById("femail").style.borderColor = "red";
        result = false;
      }
      if (document.getElementById("fdatenaissance").value.trim() == ''){
        document.getElementById("fdatenaissance").style.borderColor = "red";
        result = false;
      }
      if (document.getElementById("fnompere").value.trim() == '' && document.getElementById("fnommere").value.trim() == ''){
        document.getElementById("fnompere").style.borderColor = "red";
        document.getElementById("fnommere").style.borderColor = "red";
        if(document.getElementById("ftelpere").value.trim() == ''){
          document.getElementById("ftelpere").style.borderColor = "red";
        }
        if(document.getElementById("ftelmere").value.trim() == ''){
          document.getElementById("ftelmere").style.borderColor = "red";
        }
        result = false;
      }
      if (document.getElementById("fnompere").value.trim() != '' && document.getElementById("ftelpere").value.trim() == '' && document.getElementById("fnommere").value.trim() == ''){
        document.getElementById("ftelpere").style.borderColor = "red";
        result = false;
      }
      if (document.getElementById("fnommere").value.trim() != '' && document.getElementById("ftelmere").value.trim() == '' && document.getElementById("fnompere").value.trim() == ''){
        document.getElementById("ftelmere").style.borderColor = "red";
        result = false;
      }
      return result;
    }

    function fnGetSpecificFormData(formid){
      $.ajax({
          type: 'post',
          url: 'FormulaireEnfant.php',
          data: ({
            action: "loadFormData",
            formid: formid
          }),
          success: function(data) {
            if (data == 'success') {
              window.top.location.reload();
            }
          }            
      })
    }

    function fnDeleteConfirmation(formid){
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
          fnDelete(formid);
        }
      })
    }

    function fnDelete(formid){
      $.ajax({
          type: 'post',
          url: 'FormulaireEnfant.php',
          data: ({
            action: "deleteForm",
            formid: formid
          }),
          success: function(data) {
            if (data == 'success') {
              Swal.fire({
                title: 'Supression effectué avec succès',
                icon: 'success'
              }).then((result) => {
                window.top.location.reload();
              });
            }else if(data == 'fail'){
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
  
  <?php
  
    LoadHTML();

  ?>

  <?php require_once '../Footer.php';?>

</body>

</html>