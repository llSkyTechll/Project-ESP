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
						if (data == 'emptyFields') {
               if (fnValidateEmptyFields() == false){
                Swal.fire("Formulaire invalide", 'Veuillez remplir les champs obligatoires', 'warning');
              }
						} else if (data == 'Success') {
							Swal.fire({
								title: 'Envoie effectué avec succès',
								icon: 'success'
							}).then((result) => {
								window.top.location.reload();
							});
						} else if (data == "Fail") {
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
      if (document.getElementById("fphone").value.trim() == '' || document.getElementById("fcellphone").value.trim() == ''){
        document.getElementById("fphone").style.borderColor = "red";
        document.getElementById("fcellphone").style.borderColor = "red";
        result = false;
      }
      return result;
    }

	</script>
</head>

<body>
	<form class="container" name="formSubmit" id="formSubmit">
		<input type="hidden" name="action" id="action" value="submit">
		<div class="form-group row">
			<label for="ffirstname" class="col-md-1 col-form-label">Prénom:</label>
			<div class="col-md-5">
				<input type="text" class="form-control" id="ffirstname" name="ffirstname" tabindex="10" placeholder="Prénom">
			</div>
			<label for="flastname" class="col-md-1 col-form-label">Nom:</label>
			<div class="col-md-5">
				<input type="text" class="form-control" id="flastname" name="flastname" tabindex="20" placeholder="Nom">
			</div>
		</div>
		<div class="form-group row">
			<label for="faddress" class="col-md-1 col-form-label">Adresse</label>
			<div class="col-md-11">
				<input type="text" class="form-control" id="faddress" name="faddress" tabindex="30" placeholder="Adresse">
			</div>
		</div>
		<div class="form-group row">
			<label for="fphone" class="col-md-1 col-form-label">Tél. :</label>
			<div class="col-md-11">
				<input type="tel" class="form-control" id="fphone" name="fphone" tabindex="40" placeholder="Tél." pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}">
			</div>
		</div>
		<div class="form-group row">
			<label for="fcellphone" class="col-md-1 col-form-label">Tél. cell:</label>
			<div class="col-md-11">
				<input type="tel" class="form-control" id="fcellphone" name="fcellphone" tabindex="50" placeholder="Tél. cell" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}">
			</div>
		</div>
		<div class="form-group row">
			<label for="femail" class="col-md-1 col-form-label">Courriel</label>
			<div class="col-md-11">
				<input type="email" class="form-control" id="femail" name="femail" tabindex="60" placeholder="Courriel">
			</div>
		</div>

		<table style="width:100%;height:100%;margin-left:auto;margin-right:auto;border-collapse: collapse;">
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
							<input class="form-control" type="text" tabindex="70" name="fbenevolat1" id="fbenevolat1" style="width:100%" length="500" value="">
						</li>
						<li>
							<input class="form-control" type="text" tabindex="80" name="fbenevolat2" id="fbenevolat2" style="width:100%" length="500" value="">
						</li>
						<li>
							<input class="form-control" type="text" tabindex="90" name="fbenevolat3" id="fbenevolat3" style="width:100%" length="500" value="">
						</li>
						<li>
							<input class="form-control" type="text" tabindex="100" name="fbenevolat4" id="fbenevolat4" style="width:100%" length="500" value="">
						</li>
					</ul>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<br>
					<p>Pour quelle communauté ou paroisse souhaitez-vous faire votre bénévolat?</p>
				</td>
			</tr>
			<tr>
				<td colspan="2">
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
		<p class="Bold Center" style="text-decoration: underline;">
			DISPONIBILITÉ
		</p>
		<br>



		<table class="Bold TableBorder" align="center">
			<tr>
				<td style="width:25%"></td>
				<td class="Center" style="width:25%"><label>AVANT-MIDI</label></td>
				<td class="Center" style="width:25%"><label>APRÈS-MIDI</label></td>
				<td class="Center" style="width:25%"><label>SOIR</label></td>
			</tr>
			<tr>
				<td><label>Lundi</label></td>
				<td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="130" name="flundiam"></td>
				<td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="140" name="flundipm"></td>
				<td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="150" name="flundisoir"></td>
			</tr>
			<tr>
				<td><label>Mardi</label></td>
				<td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="160" name="fmardiam"></td>
				<td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="170" name="fmardipm"></td>
				<td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="180" name="fmardisoir"></td>
			</tr>
			<tr>
				<td><label>Mercredi</label></td>
				<td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="190" name="fmercrediam"></td>
				<td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="200" name="fmercredipm"></td>
				<td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="210" name="fmercredisoir"></td>
			</tr>
			<tr>
				<td><label>Jeudi</label></td>
				<td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="220" name="fjeudiam"></td>
				<td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="230" name="fjeudipm"></td>
				<td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="240" name="fjeudisoir"></td>
			</tr>
			<tr>
				<td><label>Vendredi</label></td>
				<td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="250" name="fvendrediam"></td>
				<td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="260" name="fvendredipm"></td>
				<td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="270" name="fvendredisoir"></td>
			</tr>
			<tr>
				<td><label>Samedi</label></td>
				<td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="280" name="fsamediam"></td>
				<td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="290" name="fsamedipm"></td>
				<td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="300" name="fsamedisoir"></td>
			</tr>
			<tr>
				<td><label>Dimanche</label></td>
				<td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="310" name="fdimancheam"></td>
				<td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="320" name="fdimanchepm"></td>
				<td class="Center"><input class="big-checkbox" type="checkbox" value="1" tabindex="330" name="fdimanchesoir"></td>
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

<?php
	CloseCon($conn);
?>
