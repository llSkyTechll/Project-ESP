<?php
require_once '../PHPFunctions.php';

require_once '../Class/clsNouvellesDAO.php';

require_once '../Class/clsNouvelles.php';

require_once '../Uploads/UploadImage.php';
if (isset($_POST['action'])) {
  $action = $_POST['action'];

  switch ($action) {
    case 'UpdateNouvelle':
      fnUpdateNouvelle();
    case 'saveNouvelles':
      fnSaveNouvelle();
    case 'DeleteNouvelle':
      
      fnDeleteNouvelle();
  }
}
if (isset($_FILES['fileToUpload'])) {
  UpdateImageNouvelle(UploadImage($_FILES['fileToUpload']));
}

function GetHTMLAllnouvelles($arrayNouvelles)
{

  $html = '';

  if (isset($arrayNouvelles)) {
    for ($x = 0; $x < count($arrayNouvelles); $x++) {

      $html .= GetHTMLNouvelle($arrayNouvelles[$x]);
    }
  }

  echo $html;
}
function GetHTMLNouvelle($Nouvelles)
{

  if ($_SESSION["nouvelleId"] != 0) {
    $descr = $Nouvelles->getDescrTot();
    $header = '  
    <header>
      <div> 
        <img id="image" src="' . $Nouvelles->getImagePath() . '" alt="Image de ' . $Nouvelles->getTitle() . '" class="imageNouvelle">
      </div>	
      <h1 id="title">' . $Nouvelles->getTitle() . '</h1>
    </header>	';
  } else {
    $descr = $Nouvelles->getDescrSomm();
    $header = '  
    <header>
      <div> 
        <img id="image" style="cursor:pointer" src="' . $Nouvelles->getImagePath() . '" alt="Image de ' . $Nouvelles->getTitle() . '" class="imageNouvelle" onclick="parent.fnRedirectionNouvelle(\'Nouvelles/Nouvelles.php\',0,\'' . $Nouvelles->getNouvellesId() . '\')">
      </div>	
      <h1 id="title" style="cursor:pointer" onclick="parent.fnRedirectionNouvelle(\'Nouvelles/Nouvelles.php\',0,\'' . $Nouvelles->getNouvellesId() . '\')">' . $Nouvelles->getTitle() . ' </h1>
    </header>	';
  }

  $html = '';
  $html .= '<div class=" justify-content-center">	
              ' . $header . '		

              <div id="content"> 
              ' . $descr . '
              </div>
            </div>
            <hr>';

  echo $html;
}

function GetHTMLAllNouvellesEdit($arrayNouvelles)
{

  $html = '';
  $html = '
		<table class="table table-striped" id="NouvelleEdit">
		<thead>
			<tr>
				<th scope="col">Titre</th>
				<th scope="col">Date de début</th>
				<th scope="col">Date de fin</th>
				<th scope="col">Actif</th>
				<th scope="col"></th>
			</tr>
		</thead>
		<tbody>';


  for ($x = 0; $x < count($arrayNouvelles); $x++) {
    $epochDebut = $arrayNouvelles[$x]->getDateDebut();
    $epochFin = $arrayNouvelles[$x]->getDateFin();
    $dateDebut = new DateTime("@$epochDebut");
    $dateFin = new DateTime("@$epochFin");

    $html .=
      '<tr>
					<th scope="row">
						<a href onclick="parent.fnRedirectionNouvelle(\'Nouvelles/Nouvelles.php\',59,' . $arrayNouvelles[$x]->getNouvellesId() . ')">' . $arrayNouvelles[$x]->getTitle() . '</a></th>
					<td>' . $dateDebut->format('m/d/Y') . '</td>
					<td>' . $dateFin->format('m/d/Y') . '</td>
					<td><input type="checkbox" id="checkbox' . $arrayNouvelles[$x]->getNouvellesId() . '" name="checkbox' . $arrayNouvelles[$x]->getTitle() . '" value="' . $arrayNouvelles[$x]->getActif() . '" ';

    if ($arrayNouvelles[$x]->getActif() == 1) {
      $html .= "checked";
    }

    $html .= '>
          </td>
          <td>
          <input type="button" class="btn btn-primary" name="btnDelete" value="Supprimer" onclick="fnDeleteConfirmation('.$arrayNouvelles[$x]->getNouvellesId().')"
          </td>
				</tr>';
  }

  $html .= '</tbody>
	</table>';

  $html .= '<button type="button" id ="btnAddNouvelle" class="btn btn-primary" onclick="fnAddNouvelle();">Ajouter</button>';

  echo $html;
}
function GetAddNouvelles()
{
  $html = '';
  $html .= '	
			<div id="addNouvelles" class="d-none">
				<div>
					<img id="imageSommaire" src="" alt="Image"  />
					<form action="#" method="post" enctype="multipart/form-data">
							<label for="fileToUpload">Sélectionner une image à télécharger:</label>
							<input type="file" name="fileToUpload[]" id="fileToUpload">
							<input type="submit" value="Télécharger l\'image" name="submit">
					</form>
				</div>
				<div>
				<label for="title">Titre</label>
					<p id="title" class="contentEditable" contentEditable></p>
				</div>
				<div class="row">
					<div class="col">
						<label for="dateDebut">date de début</label>
						<input type="text" class="datetimepicker form-control" readonly name="dateDebut" id="dateDebut">
					</div>
					<div class="col">
						<label for="dateFin">date de fin</label>
						<input type="text" class="datetimepicker form-control" readonly=name="dateFin" id="dateFin">
					</div>
				</div>
				<div>
					<label for="descriptionSommaire">Description Sommaire</label>
					<div id="descriptionSommaire" class="contentEditable" contentEditable></div>
				</div>
				<div>
					<label for="descriptionTotal">Description Complète</label>
					<div id="descriptionTotal" class="contentEditable" contentEditable></div>
				</div>
				<div>
					
					<input type="checkbox" id="checkbox" name="checkboxtitraae" value="0" >
					<label for="checkbox">Actif</label>
				</div>
				<button type="button" class="btn btn-primary mt-3" onclick="fnSaveNouvelle();">Sauvegarder</button>
			</div>';
  echo $html;
}

function GetHTMLNouvelleEdit($Nouvelles)
{

  $epochDebut = $Nouvelles->getDateDebut();
  $epochFin = $Nouvelles->getDateFin();
  $dateDebut = new DateTime("@$epochDebut");
  $dateFin = new DateTime("@$epochFin");
  $html = '';
  $html .= '	
			<div id="updateNouvelle" >
				<div class="m-auto">
					<img id="imageSommaire" src="' . $Nouvelles->getImagePath() . '" alt="Image" class="imageNouvelleEdit" />
					
					<form action="#" method="post" enctype="multipart/form-data" id="form" onsubmit="fnUpdateNouvelle()">
							<label for="fileToUpload">Sélectionner une image à télécharger:</label>
							<input type="file" name="fileToUpload[]" id="fileToUpload">
							<input type="submit" value="Télécharger l\'image" name="submit">
					</form>
				</div>
				<div>
				<label for="title">Titre</label>
					<p id="title" class="contentEditable" contentEditable>' . $Nouvelles->getTitle() . '</p>
				</div>
				<div class="row">
					<div class="col">
						<label for="dateDebut">date de début</label>
						<input type="text" class="datetimepicker form-control" readonly name="dateDebut" id="dateDebut" value="' . $dateDebut->format('m/d/Y') . '">
					</div>
					<div class="col">
						<label for="dateFin">date de fin</label>
						<input type="text" class="datetimepicker form-control" readonly=name="dateFin" id="dateFin" value = "' . $dateFin->format('m/d/Y') . '">
					</div>
				</div>
				<div>
					<label for="descriptionSommaire">Description Sommaire</label>
					<div id="descriptionSommaire" class="contentEditable" contentEditable>' . $Nouvelles->getDescrSomm() . '</div>
				</div>
				<div>
					<label for="descriptionTotal">Description Complète</label>
					<div id="descriptionTotal" class="contentEditable" contentEditable>' . $Nouvelles->getDescrTot() . '</div>
				</div>
				<div>
					
					<input type="checkbox" id="checkbox" name="checkboxtitraae" value="' . $Nouvelles->getActif() . '"';
  if ($Nouvelles->getActif() == 1) {
    $html .= "checked";
  }
  $html .= '>
					<label for="checkbox">Actif</label>
				</div>
				<button type="button" class="btn btn-primary mt-3" onclick="fnUpdateNouvelle();">Sauvegarder</button>
			</div>';
  echo $html;
}
function fnDeleteNouvelle(){
  if(isset($_POST['nouvelleId'])){
			if(NouvellesDAO::DeleteNouvelle($_POST['nouvelleId'])  == 'fail'){
				exit('failDB');
			}	
		exit('success');
	}
}
function fnSaveNouvelle()
{
  if (
    $_POST['dateDebut'] == '' ||
    $_POST['dateFin'] == '' ||
    $_POST['descriptionSommaire'] == '' ||
    $_POST['descriptionTotal'] == '' ||
    $_POST['actif'] == '' ||
    $_POST['title'] == ''
  ) {
    exit('emptyFields');
  }

  if (NouvellesDAO::saveNewNouvelles($_POST['title'], $_POST['descriptionSommaire'], $_POST['descriptionTotal'], $_POST['dateDebut'], $_POST['dateFin'], $_POST['actif']) == 'success'){
    exit('success');
  }

  exit('fail');
}
function fnUpdateNouvelle()
{

  if (NouvellesDAO::updateNouvelles(
    $_SESSION["nouvelleId"],
    $_POST['title'],
    $_POST['descriptionSommaire'],
    $_POST['descriptionTotal'],
    $_POST['dateDebut'],
    $_POST['dateFin'],
    $_POST['actif']
  ) == 'success') {
    $_SESSION["nouvelleId"] = 0;
    exit('success');
  }


  exit('fail');
}

function UpdateImageNouvelle($arrayFiles){

  $arrayMessages = array();
  $arrayUploadsDB = array();
  $arrayToReturn = array();

  for($x = 0; $x <count($arrayFiles['errors']);$x++){

      if($arrayFiles['errors'][$x][0] == 'success'){
          array_push($arrayUploadsDB,AddImageNouvelle($arrayFiles['images'][$x]));
      }
      else{
          array_push($arrayMessages,arrayMessageError($arrayFiles['errors'][$x]));
      }

  }

  $arrayToReturn = array(
      'MessageError'=>$arrayMessages,
      'UploadsDB'=>$arrayUploadsDB
  );
  $_SESSION['fileToUpload'] = $arrayToReturn;

}

function AddImageNouvelle($File){
  echo $_SESSION["nouvelleId"];
  if(NouvellesDAO::UpdateImageNouvelle($_SESSION["nouvelleId"], $File['imagePath']) == 'success'){
      $uploadToDb = array(
      'imageName' =>$File['imageName'],
      'succes' =>'succes'
      );
  }
  else{
      $uploadToDb = array(
      'imageName' =>$File['imageName'],
      'succes' =>'fail'
      );

  }
  return $uploadToDb;
}
function arrayMessageError($message){
  $arrayMessage = array();
  for($x = 0; $x <count($message);$x++){
      array_push($arrayMessage,$message[$x]);
  }
}
function DisplayMessage(){
	$Swal='<script>';
	
	if(isset($_SESSION['fileToUpload'])){
		
		if(empty($_SESSION['fileToUpload']['MessageError'])){
			$Swal.='Swal.fire({
							icon: "success",
							title: "Ajout avec success"  
							})';
		}
		else{		
			$Swal.='Swal.fire({
							icon: "error",
							title: "Une erreur est survenue"  
							})';
		}
	}
	$Swal.='</script>';
	echo $Swal;
	unset($_SESSION['fileToUpload']);
}