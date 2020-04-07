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
  <script src="../JavaScript/JQuery1.9.1.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
  <link rel="stylesheet" href="../css/include.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <script>
    function fnSubmit() {
      $(function() {
        $.ajax({
          type: 'post',
          url: 'FormulaireBenevolat_pr.php',
          data: ({action: 'submit', email: document.getElementById('femail').value , firstname: document.getElementById('ffirstname').value}),
          success: function(data){
            if (data == 'fail'){
              Swal.fire("Erreur lors de l'envoie du formulaire",'','error');
            }else if(data == 'success'){
              Swal.fire({
                title:'Envoie effectué avec succès',
                icon: 'success'
              }).then((result)=>{
                  Swal.fire('Test','','warning');
                  //window.top.location.reload();
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
    <br>
    <table style="width:75%;height:100%;margin-left:auto;margin-right:auto;border-collapse: collapse;">
      <tr>
        <td align="left" style="width:7%">
          Prénom :
        </td>
        <td>
          <input type="text" name="ffirstname" id="ffirstname" style="width:95%" value="">
        </td>
        <td style="align:left;width:7%">
          Nom :
        </td>
        <td>
          <input type="left" name="flastname" id="flastname" style="width:100%" value="">
        </td>
      </tr>

      <tr>
        <td align="left">
          Adresse :
        </td>
        <td colspan="3" align="left">
          <input type="text" name="faddress" id="faddress" style="width:100%" value="">
        </td>
      </tr>

      <tr>
        <td align="left">
          Tél. :
        </td>
        <td colspan="3" align="left">
          <input type="text" name="fphone" id="fphone" style="width:100%" value="">
        </td>
      </tr>

      <tr>
        <td align="left">
          Tél. cell:
        </td>
        <td colspan="3" align="left">
          <input type="text" name="fcellphone" id="fcellphone" style="width:100%" value="">
        </td>
      </tr>

      <tr>
        <td align="left">
          Courriel :
        </td>
        <td colspan="3" align="left">
          <input type="text" name="femail" id="femail" style="width:100%" value="">
        </td>
      </tr>

      <tr>
        <td colspan="4">
          <br>
          Plusieurs services ou compétences sont requis dans nos communautés. Il y a d’abord les services liés à
          la vie liturgique (lecteurs, servants de messe, membres des chorales, comités de liturgie, catéchètes,
          etc). Des bénévoles sont aussi requis pour divers services (aide à la correspondance, secrétariat,
          réception, menuiserie, construction, etc). D’autres compétences plus pointues sont recherchées dans
          certaines situations (en droit, en informatique, en gestion, en communication, en ingénierie, en marketing,
          en comptabilité et finance, etc).
        </td>
      </tr>

      <tr>
        <td colspan="4" style="width:75%">
          <br>
          Indiquez, le ou les bénévolats que vous seriez prêt à faire pour votre communauté ou l’une ou
          l’autre des paroisses.
        </td>
      </tr>
      <tr>
        <td colspan="2">
          <ul>
            <li>
                <input type="text" name="fbenevolat1" id="fbenevolat1" style="width:100%" length="500" value="">
            </li>
            <li>
                <input type="text" name="fbenevolat2" id="fbenevolat2" style="width:100%" length="500" value="">
            </li>
            <li>
                <input type="text" name="fbenevolat3" id="fbenevolat3" style="width:100%" length="500" value="">
            </li>
            <li>
                <input type="text" name="fbenevolat4" id="fbenevolat4" style="width:100%" length="500" value="">
            </li>
          </ul>
        </td>
      </tr>
      <tr>
        <td colspan="4">
          <br>
          Pour quelle communauté ou paroisse souhaitez-vous faire votre bénévolat? Vous pouvez
          sélectionner plus d’un choix.
        </td>
      </tr>
    </table>

    <br>
    <p class="Bold">
      DISPONIBILITÉ
    </p>
    <br>

    <table class="Bold TableBorder" align="center">
      <tr>
        <td style="width:25%"></td>
        <td class="Center" style="width:25%">AVANT-MIDI</td>
        <td class="Center" style="width:25%">APRÈS-MIDI</td>
        <td class="Center" style="width:25%">SOIR</td>
      </tr>
      <tr>
        <td>Lundi</td>
        <td class="Center"><input type="checkbox" value="1" name=""></td>
        <td class="Center"><input type="checkbox" value="1" name=""></td>
        <td class="Center"><input type="checkbox" value="1" name=""></td>
      </tr>
      <tr>
        <td>Mardi</td>
        <td class="Center"><input type="checkbox" value="1" name=""></td>
        <td class="Center"><input type="checkbox" value="1" name=""></td>
        <td class="Center"><input type="checkbox" value="1" name=""></td>
      </tr>
      <tr>
        <td>Mercredi</td>
        <td class="Center"><input type="checkbox" value="1" name=""></td>
        <td class="Center"><input type="checkbox" value="1" name=""></td>
        <td class="Center"><input type="checkbox" value="1" name=""></td>
      </tr>
      <tr>
        <td>Jeudi</td>
        <td class="Center"><input type="checkbox" value="1" name=""></td>
        <td class="Center"><input type="checkbox" value="1" name=""></td>
        <td class="Center"><input type="checkbox" value="1" name=""></td>
      </tr>
      <tr>
        <td>Vendredi</td>
        <td class="Center"><input type="checkbox" value="1" name=""></td>
        <td class="Center"><input type="checkbox" value="1" name=""></td>
        <td class="Center"><input type="checkbox" value="1" name=""></td>
      </tr>
      <tr>
        <td>Samedi</td>
        <td class="Center"><input type="checkbox" value="1" name=""></td>
        <td class="Center"><input type="checkbox" value="1" name=""></td>
        <td class="Center"><input type="checkbox" value="1" name=""></td>
      </tr>
      <tr>
        <td>Dimanche</td>
        <td class="Center"><input type="checkbox" value="1" name=""></td>
        <td class="Center"><input type="checkbox" value="1" name=""></td>
        <td class="Center"><input type="checkbox" value="1" name=""></td>
      </tr>
    </table>

    <br>
    <div class="Center">
      <input class="btn btn-primary" type="button" name="btnSubmitForm" value="Envoyer" onclick="fnSubmit();">
    </div>
  </form>
    
    
</body>

</html>
