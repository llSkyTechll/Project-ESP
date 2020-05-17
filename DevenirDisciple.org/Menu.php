<?php

require_once 'PHPFunctions.php';

require_once 'ConnexionDB.php';  //Garder les includes dans cet ordre

require_once 'Menu_pr.php';

require_once 'Class/clsMenu.php';

$conn = OpenCon();

?>

<!doctype html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Devenir Disciple</title>
  <!-- Bootstrap4-->
  <link rel="stylesheet" href="css/Bootstrap.css">
  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
    integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous">
  </script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
    integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
  </script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
    integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous">
  </script>
  <link rel="stylesheet" href="css/include.css">
  <link rel="shortcut icon" href="Ressource/Image/favicon.png" type="image/ico" />
  <script src="JavaScript/JQuery1.9.1.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
  <script>
  function fnRedirection(Path, menuId) {
    
    $(function() {
      $.ajax({
        type: 'post',
        url: 'Menu.php',
        data: ({
          action: 'redirect',
          menuId: menuId,
          path: Path
        })
      });
      document.getElementById('PageContent').src = Path;
    })
  }

  function fnRedirectionNouvelle(Path, menuId, nouvelleId) {

    $(function() {
      $.ajax({
        type: 'post',
        url: 'Menu.php',
        data: ({
          action: 'redirectNouvelle',
          menuId: menuId,
          nouvelleId: nouvelleId,
          path: Path
        })
      });
      document.getElementById('PageContent').src = Path;
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
          if (data.trim() == 'success') {
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

  /*$('iframe').load( function() {
			$('iframe').contents().find("head")
				.append($("<style type='text/css'>  body{background:none transparent !important;background-color:none  !important;}  </style>"));
	});*/

  /*$(document).ready(function() {	
			$('#PageContent').contents().find('body').css({
            background:'none transparent !important'
        });
			
		});*/
  </script>
</head>

<body style="	background-image: url('Ressource/Image/homme%20sac%20%C3%A0%20dos%203.jpeg');
	background-repeat: no-repeat;
  background-attachment: fixed;
background-size: cover;">

  <div class="menu container fixed-top">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav">

          <?php
							$menu   = new Menu();
							$result = $menu->getMenu();

							$resultlength = count($result);

							for($x = 0; $x < $resultlength; $x++) {
								$menurow = $result[$x];

								if($menurow->get_submenu() != null){
									echo('<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">'.$menurow->get_name().'</a><div class="dropdown-menu" aria-labelledby="navbarDropdown">');

									LoadSubMenu($menurow->get_submenu());
									echo('</div></li>');

								}else{
									echo('<li class="nav-item"><a  class="nav-link" onclick="fnRedirection(\''.$menurow->get_redirectionPath().'\','.$menurow->get_menuid().')">'.$menurow->get_name().'</a> </li>');
								}
								if($menurow->get_menuid() == $_SESSION['gmenuId']){
									$_SESSION['gpath'] = $menurow->get_redirectionPath();
								}
							}

						?>
          <li class="nav-item">
            <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
              <input name="cmd" type="hidden" value="_s-xclick">
              <input name="hosted_button_id" type="hidden" value="DMYLJ8APSPW2A"> <input alt="Faire un don avec PayPal button"
                border="0" name="submit" src="https://www.paypalobjects.com/fr_CA/i/btn/btn_donateCC_LG.gif"
                title="PayPal - The safer, easier way to pay online!" type="image">
              <img alt="" border="0" height="1" src="https://www.paypal.com/fr_CA/i/scr/pixel.gif" width="1"
                style="display: none !important;">
            </form>
          </li>
        </ul>
      </div>
    </nav>
  </div>
  <div class="iframe">
    <iframe id="PageContent"
      src="<?php if(isset($_SESSION['gpath'])){echo $_SESSION['gpath'];}else{echo 'Accueil/Accueil.php';}?>"
      frameborder="0" allowtransparency="true"></iframe>
  </div>
</body>

</html>

<?php
CloseCon($conn);
?>