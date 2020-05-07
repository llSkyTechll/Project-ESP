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

  </script>
</head>

<body>
  <br>
  <form class="container" name="formSubmit" id="formSubmit">
    <input type="hidden" name="action" id="action" value="submit">
    <div class="form-group row">
      <label for="fname" class="col-md-2 col-form-label">Nom:</label>
      <div class="col-md-10">
        <input type="text" class="form-control" id="fname" name="fname" tabindex="10" placeholder="Nom">
      </div>
    </div>
    <div class="form-group row">
      <label for="faddress" class="col-md-2 col-form-label">Adresse complète:</label>
      <div class="col-md-10">
        <input type="text" class="form-control" id="faddress" name="faddress" tabindex="20" placeholder="Adresse">
      </div>
    </div>
    <div class="form-group row">
      <label for="fzipcode" class="col-md-2 col-form-label">Code postal:</label>
      <div class="col-md-10">
        <input type="text" class="form-control" id="fzipcode" name="fzipcode" tabindex="30" placeholder="Code postal">
      </div>
    </div>
    <div class="form-group row">
      <label for="femail" class="col-md-2 col-form-label">Adresse courriel:</label>
      <div class="col-md-10">
        <input type="text" class="form-control" id="femail" name="femail" tabindex="40" placeholder="Courriel" >
      </div>
    </div>
    <div class="form-group row">
      <label for="fdatenaissance" class="col-md-2 col-form-label">Date de naissance:</label>
      <div class="col-md-10">
        <input type="text" class="form-control" id="fdatenaissance" name="fdatenaissance" tabindex="40" placeholder="Date de naissance" >
      </div>
    </div>
    <div class="form-group row">
      <label for="fnompere" class="col-md-3 col-form-label">Nom du père (ou tuteur):</label>
      <div class="col-md-6">
        <input type="text" class="form-control" id="fnompere" name="fnompere" tabindex="40" placeholder="Nom du père (ou tuteur)" >
      </div>
      <label for="ftelpere" class="col-md-1 col-form-label">Tél:</label>
      <div class="col-md-2">
        <input type="tel" class="form-control" id="ftelpere" name="ftelpere" tabindex="50" placeholder="Téléphone" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}">
      </div>
    </div>
    <div class="form-group row">
      <label for="fnommere" class="col-md-3 col-form-label">Nom de la mère (ou tutrice):</label>
      <div class="col-md-6">
        <input type="text" class="form-control" id="fnommere" name="fnommere" tabindex="40" placeholder="Nom de la mère (ou tutrice)" >
      </div>
      <label for="ftelmere" class="col-md-1 col-form-label">Tél:</label>
      <div class="col-md-2">
        <input type="tel" class="form-control" id="ftelmere" name="ftelmere" tabindex="50" placeholder="Téléphone" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}">
      </div>
    </div>
    <div class="form-group row">
      <label style="text-align:center" class="col-md-12 col-form-label">Sacrements célébrés ( église et date )</label>      
    </div>

    <table style="width:100%;height:100%;margin-left:auto;margin-right:auto;border-collapse: collapse;">
      <tr>
        <td style="width:10%">
          <label for="fbapteme">Baptême:</label>
        </td>
        <td style="width:90%">
          <input class="form-control" type="text" tabindex="70" name="fbapteme" id="fbapteme" style="width:100%" length="500" value="">
        </td>
      </tr>
      <tr>
        <td style="width:10%">
          <label for="fpardon">Pardon:</label>
        </td>
        <td style="width:90%">
          <input class="form-control" type="text" tabindex="80" name="fpardon" id="fpardon" style="width:100%" length="500" value="">
        </td>    
      </tr>
      <tr>
        <td style="width:10%">
          <label for="feucharistie">Eucharistie:</label>
        </td>
        <td style="width:90%">
          <input class="form-control" type="text" tabindex="90" name="feucharistie" id="feucharistie" style="width:100%" length="500" value="">         
        </td>
      </tr>
      <tr>
        <td style="width:10%">
          <label for="fallergies"><i>Allergies:</i></label>
        </td>
        <td>
          <input class="form-control" type="text" tabindex="100" name="fallergies" id="fallergies" style="width:100%" length="500" value="">
        </td>
      </tr>

      <tr>
        <td colspan="4">
          <br>
          <p>Paroisse</p>
        </td>
      </tr>
      <tr>
        <td colspan="4">
          <select class="form-control" tabindex="110" name="fparoisseid" id="fparoisseid" style="width:50%" onchange="fnCommunityList()">
            <option value="0"></option>
            <?php           
              
              $paroissecommunaute = new ParoisseCommunaute();
              
              $Result = $paroissecommunaute->getAllParoisse();
              
              if ($Result->num_rows > 0){
                while ($Row = $Result->fetch_assoc()){
                  echo '<option value="'.$Row['paroisseid'].'">'.$Row['nom'].'</option>';
                }
              }  
              
            ?>

          </select>
        </td>
      </tr>

      <tr>
        <td colspan="4">

          <?php          

            $Result = $paroissecommunaute->getAllCommunauteOrderParoisse();

            if ($Result->num_rows > 0){
              $paroisseid = 0;
              while ($Row = $Result->fetch_assoc()){
                if ($paroisseid != $Row['paroisseid']){
                  if ($paroisseid <> 0){
                    echo '</select>' ;
                  }
                  $paroisseid = $Row['paroisseid'];
                  echo '<select class="form-control" tabindex="120" name="fcommunityid'.$paroisseid.'" id="fcommunityid'.$paroisseid.'" style="width:50%;display:none">';
                  echo '<option value="0"></option>';
                  echo '<option value="'.$Row['communauteid'].'">'.$Row['nom'].'</option>';
                }else{
                  echo '<option value="'.$Row['communauteid'].'">'.$Row['nom'].'</option>';
                }
              }
              echo '</select>';
            }  

          ?>
        </td>
      </tr>
      </table>
      <br>
      <table class="Bold TableBorder" align="center">
      <tr>
        <td class="Center" style="width:16%"><label>Initiation:</label></td>
        <td class="Center" style="width:16%"><input class="big-checkbox" type="checkbox" name="finitiation" id="finitiation" value="1"></td>
        <td class="Center" style="width:16%"><label>P'tite Pasto:</label></td>
        <td class="Center" style="width:16%"><input class="big-checkbox" type="checkbox" name="fptitepasto" id="fptitepasto" value="1"></td>
        <td class="Center" style="width:16%"><label>Agnelets:</label></td>
        <td class="Center" style="width:16%"><input class="big-checkbox" type="checkbox" name="fagnelets" id="fagnelets" value="1"></td>
      </tr>
      <tr>
        <td class="Center" style="width:16%"><label>Premier pardon:</label></td>
        <td class="Center" style="width:16%"><input class="big-checkbox" type="checkbox" name="fpremierpardon" id="fpremierpardon" value="1"></td>
        <td class="Center" style="width:16%"><label>Première communion:</label></td>
        <td class="Center" style="width:16%"><input class="big-checkbox" type="checkbox" name="fpremierecommunion" id="fpremierecommunion" value="1"></td>
        <td class="Center" style="width:16%"><label>Confirmation:</label></td>
        <td class="Center" style="width:16%"><input class="big-checkbox" type="checkbox" name="fconfirmation" id="fconfirmation" value="1"></td>
      </tr>
      <tr>
        <td class="Center" style="width:16%"><label>Les Brebis de Jésus:</label></td>
        <td class="Center" style="width:16%"><input class="big-checkbox" type="checkbox" name="fbrebis" id="fbrebis" value="1"></td>
      </tr>
    </table>
    
    <br>
    <div class="Center">
      <input class="btn btn-primary" type="button" tabindex="340" name="btnSubmitForm" value="Envoyer" onclick="fnSubmit();">
    </div>

  </form>

  <?php require_once '../Footer.php';?>

</body>

</html>