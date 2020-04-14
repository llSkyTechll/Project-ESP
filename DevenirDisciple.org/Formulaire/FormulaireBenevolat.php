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
  <meta charset="UTF-8">
  <title>Devenir Disciple</title>
  <script src="../JavaScript/JSFunction.js"></script>
  <script src="../JavaScript/JQuery1.9.1.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
  <link rel="stylesheet" href="../css/include.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <script>
  
    function fnCommunityList(){
      if (document.getElementById("fparoisseid").value == 0){
        document.getElementById("fcommunityid1").style.display = "none";
        document.getElementById("fcommunityid2").style.display = "none";
      }else if (document.getElementById("fparoisseid").value == 1){
        document.getElementById("fcommunityid1").style.display = "";
        document.getElementById("fcommunityid2").style.display = "none";
      }else{
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
      $(function() {
        $.ajax({
          type: 'post',
          url: 'FormulaireBenevolat.php',
          data: ({formdata: $("#formSubmit").serialize()}),
          success: function(data){
            if (data == 'firstname'){
              document.getElementById("ffirstname").style.borderColor = "red";
              Swal.fire("Formulaire invalide",'Le champ Prénom ne peut pas être vide.','warning');
            }else if(data == "lastname"){
              document.getElementById("flastname").style.borderColor = "red";
              Swal.fire("Formulaire invalide",'Le champ Nom ne peut pas être vide.','warning');
            }else if(data == "email"){
              document.getElementById("femail").style.borderColor = "red";
              Swal.fire("Formulaire invalide",'Le champ Courriel ne peut pas être vide.','warning');
            }else if(data == "phone"){
              document.getElementById("fphone").style.borderColor = "red";
              document.getElementById("fcellphone").style.borderColor = "red";
              Swal.fire("Formulaire invalide","Il faut entrer au moins un téléphone.",'warning');
            }else if(data == 'Success'){
              Swal.fire({
                title:'Envoie effectué avec succès',
                icon: 'success'
              }).then((result)=>{
                  window.top.location.reload();
                }
              );
            }else if(data == "Fail"){
              Swal.fire("Erreur lors de l'envoie","Impossible d'envoyer le formulaire",'error');
            }
          }
        })
      })
    };

  </script>
</head>

<body>
  <form name="formSubmit" id="formSubmit">
    <input type="hidden" name="action" id="action" value="submit">
    <br>
    <table style="width:75%;height:100%;margin-left:auto;margin-right:auto;border-collapse: collapse;">
      <tr>
        <td align="left" style="width:7%">
          <input class="form-control-plaintext" type="text" readonly value="Prénom :">
        </td>
        <td>
          <input class="form-control" type="text" name="ffirstname" id="ffirstname" style="width:95%" length="50" value="">
        </td>
        <td style="align:left;width:5%">
          <input class="form-control-plaintext" type="text" readonly value="Nom :">
        </td>
        <td>
          <input class="form-control" type="text" name="flastname" id="flastname" style="width:100%" length="50" value="">
        </td>
      </tr>

      <tr>
        <td align="left">
          <input class="form-control-plaintext" type="text" readonly value="Adresse :">
        </td>
        <td colspan="3" align="left">
          <input class="form-control" type="text" name="faddress" id="faddress" style="width:100%" value="">
        </td>
      </tr>

      <tr>
        <td align="left">
          <input class="form-control-plaintext" type="text" readonly value="Tél. :">
        </td>
        <td colspan="3" align="left">
          <input class="form-control" type="text" name="fphone" id="fphone" style="width:100%" value="">
        </td>
      </tr>

      <tr>
        <td align="left">
          <input class="form-control-plaintext" type="text" readonly value="Tél. cell:">
        </td>
        <td colspan="3" align="left">
          <input class="form-control" type="text" name="fcellphone" id="fcellphone" style="width:100%" value="">
        </td>
      </tr>

      <tr>
        <td align="left">
          <input class="form-control-plaintext" type="text" readonly value="Courriel :">          
        </td>
        <td colspan="3" align="left">
          <input class="form-control" type="text" name="femail" id="femail" style="width:100%" length="100" value="">
        </td>
      </tr>

      <tr>
        <td colspan="4">
          <br>
          <p>Plusieurs services ou compétences sont requis dans nos communautés. Il y a d’abord les services liés à
          la vie liturgique (lecteurs, servants de messe, membres des chorales, comités de liturgie, catéchètes,
          etc). Des bénévoles sont aussi requis pour divers services (aide à la correspondance, secrétariat,
          réception, menuiserie, construction, etc). D’autres compétences plus pointues sont recherchées dans
          certaines situations (en droit, en informatique, en gestion, en communication, en ingénierie, en marketing,
          en comptabilité et finance, etc).</p>
        </td>
      </tr>

      <tr>
        <td colspan="4" style="width:75%">
          <br>
          <p>Indiquez, le ou les bénévolats que vous seriez prêt à faire pour votre communauté ou l’une ou
          l’autre des paroisses.</p>
        </td>
      </tr>
      <tr>
        <td colspan="2">
          <ul>
            <li>
                <input class="form-control" type="text" name="fbenevolat1" id="fbenevolat1" style="width:100%" length="500" value="">
            </li>
            <li>
                <input class="form-control" type="text" name="fbenevolat2" id="fbenevolat2" style="width:100%" length="500" value="">
            </li>
            <li>
                <input class="form-control" type="text" name="fbenevolat3" id="fbenevolat3" style="width:100%" length="500" value="">
            </li>
            <li>
                <input class="form-control" type="text" name="fbenevolat4" id="fbenevolat4" style="width:100%" length="500" value="">
            </li>
          </ul>
        </td>
      </tr>
      <tr>
        <td colspan="4">
          <br>
          <p>Pour quelle communauté ou paroisse souhaitez-vous faire votre bénévolat? Vous pouvez
          sélectionner plus d’un choix.</p>
        </td>
      </tr>
      <tr>
        <td colspan="2">
          <select class="form-control" name="fparoisseid" id="fparoisseid" style="width:50%" onchange="fnCommunityList()">
            <option value="0"></option>
            <?php           
              
              $paroissecommunaute = new ParoisseCommunaute();
              
              $Result = $paroissecommunaute->getAllParoisse();
              
              if ($Result->num_rows > 0){
                while ($Row = $Result->fetch_assoc()){
                  echo '<option value="'.$Row['paroisseid'].'">'.utf8_encode($Row['nom']).'</option>';
                }
              }  
              
            ?>
            
          </select>
        </td>
      </tr>
      
      <tr>
        <td colspan="2">
          
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
                    echo '<select class="form-control" name="fcommunityid'.$paroisseid.'" id="fcommunityid'.$paroisseid.'" style="width:50%;display:none">';
                    echo '<option value="0"></option>';
                    echo '<option value="'.$Row['communauteid'].'">'.utf8_encode($Row['nom']).'</option>';
                  }else{
                    echo '<option value="'.$Row['communauteid'].'">'.utf8_encode($Row['nom']).'</option>';
                  }
                }
                echo '</select>';
              }  
              
            ?>
            
         
        </td>
      </tr>
    </table>

    <br>
    <p class="Bold Center" style="text-decoration: underline;">
      DISPONIBILITÉ
    </p>
    <br>

    <table class="Bold TableBorder" align="center">
      <tr>
        <td style="width:25%"></td>
        <td class="Center" style="width:25%"><input class="form-control-plaintext" type="text" readonly value="AVANT-MIDI"></td>
        <td class="Center" style="width:25%"><input class="form-control-plaintext" type="text" readonly value="APRÈS-MIDI"></td>
        <td class="Center" style="width:25%"><input class="form-control-plaintext" type="text" readonly value="SOIR"></td>
      </tr>
      <tr>
        <td><input class="form-control-plaintext" type="text" readonly value="Lundi"></td>
        <td class="Center"><input class="form-check-input" type="checkbox" value="1" name="flundiam"></td>
        <td class="Center"><input class="form-check-input" type="checkbox" value="1" name="flundipm"></td>
        <td class="Center"><input class="form-check-input" type="checkbox" value="1" name="flundisoir"></td>
      </tr>
      <tr>
        <td><input class="form-control-plaintext" type="text" readonly value="Mardi"></td>
        <td class="Center"><input class="form-check-input" type="checkbox" value="1" name="fmardiam"></td>
        <td class="Center"><input class="form-check-input" type="checkbox" value="1" name="fmardipm"></td>
        <td class="Center"><input class="form-check-input" type="checkbox" value="1" name="fmardisoir"></td>
      </tr>
      <tr>
        <td><input class="form-control-plaintext" type="text" readonly value="Mercredi"></td>
        <td class="Center"><input class="form-check-input" type="checkbox" value="1" name="fmercrediam"></td>
        <td class="Center"><input class="form-check-input" type="checkbox" value="1" name="fmercredipm"></td>
        <td class="Center"><input class="form-check-input" type="checkbox" value="1" name="fmercredisoir"></td>
      </tr>
      <tr>
        <td><input class="form-control-plaintext" type="text" readonly value="Jeudi"></td>
        <td class="Center"><input class="form-check-input" type="checkbox" value="1" name="fjeudiam"></td>
        <td class="Center"><input class="form-check-input" type="checkbox" value="1" name="fjeudipm"></td>
        <td class="Center"><input class="form-check-input" type="checkbox" value="1" name="fjeudisoir"></td>
      </tr>
      <tr>
        <td><input class="form-control-plaintext" type="text" readonly value="Vendredi"></td>
        <td class="Center"><input class="form-check-input" type="checkbox" value="1" name="fvendrediam"></td>
        <td class="Center"><input class="form-check-input" type="checkbox" value="1" name="fvendredipm"></td>
        <td class="Center"><input class="form-check-input" type="checkbox" value="1" name="fvendredisoir"></td>
      </tr>
      <tr>
        <td><input class="form-control-plaintext" type="text" readonly value="Samedi"></td>
        <td class="Center"><input class="form-check-input" type="checkbox" value="1" name="fsamediam"></td>
        <td class="Center"><input class="form-check-input" type="checkbox" value="1" name="fsamedipm"></td>
        <td class="Center"><input class="form-check-input" type="checkbox" value="1" name="fsamedisoir"></td>
      </tr>
      <tr>
        <td><input class="form-control-plaintext" type="text" readonly value="Dimanche"></td>
        <td class="Center"><input class="form-check-input" type="checkbox" value="1" name="fdimancheam"></td>
        <td class="Center"><input class="form-check-input" type="checkbox" value="1" name="fdimanchepm"></td>
        <td class="Center"><input class="form-check-input" type="checkbox" value="1" name="fdimanchesoir"></td>
      </tr>
    </table>

    <br>
    <div class="Center">
      <input class="btn btn-primary" type="button" name="btnSubmitForm" value="Envoyer" onclick="fnSubmit();">
    </div>
  </form>
  
  <?php require_once '../Footer.php';?>

</body>

</html>

<?php
CloseCon($conn);
?>
