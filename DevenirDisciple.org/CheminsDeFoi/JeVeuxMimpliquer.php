
<!doctype html>
<html lang="en">

<head>
  <title>Devenir Disciple</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Devenir Disciple</title>
  <!-- Bootstrap4-->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

  <link rel="stylesheet" href="../css/include.css">
  <script src="../JavaScript/JSFunction.js"></script>
  <script src="../JavaScript/JQuery1.9.1.js"></script>
  <script src="https://kit.fontawesome.com/30dce125f3.js" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

  <script>
    function fnRedirection(Path, menuId) {
      document.getElementById('PageContent').src = Path;
      $(function() {
        $.ajax({
          type: 'post',
          url: 'Menu.php',
          data: ({
            action: 'redirect',
            menuId: menuId
          })
        });
      })
    }

    function fnDeconnexion() {
      $(function() {
        $.ajax({
          type: 'post',
          url: 'Menu.php',
          data: ({
            action: 'deconnexion'
          }),
          success: function(data) {
            if (data == 'success') {
              Swal.fire({
                title: 'Déconnexion réussi.',
                icon: 'success'
              }).then((result) => {
                window.top.location.reload();
              });
            }
          }
        });
      });
    }
  </script>
</head>

<body >

  <p>À ton baptême, tu as reçu un appel du Christ à participer à sa mission. Si tu veux faire connaître et aimer le Père, t’engager au sein de ta communauté peut être un bon moyen pour participer à cette mission.</p>
  <p>Si ça te tente, nous t’invitons à compléter ce formulaire qui nous permettra de t’aider à t’engager dans le milieu qui t’intéresse pour la fonction qui te plaît selon tes disponibilités.</p>
  <button>Bouton formulaire bénévolat</button>

  <p>Tu peux aussi nous rejoindre pour en savoir plus.</p>
  <button>Bouton Contactez-nous</button>

</body>

<?php require('../Footer.php');?>

</html>
