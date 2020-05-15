<?php 
require_once '../PHPFunctions.php';

require_once '../Class/clsNouvellesDAO.php';

require_once '../Class/clsNouvelles.php';

require_once '../Uploads/UploadImage.php';
if (isset($_POST['action'])){
  $action = $_POST['action'];
  
  switch($action){
	case 'UpdateNouvelle':
    fnUpdateNouvelle();
	case 'saveNouvelles':
		fnSaveNouvelle();
  }
}
	if(isset($_FILES['fileToUpload'])){
		UpdateImageNouvelle(UploadImage($_FILES['fileToUpload']));
	}

function GetHTMLAllnouvelles($arrayNouvelles){
	
	$html = '';
	
	for($x = 0; $x <count($arrayNouvelles);$x++){
		
		$html .= GetHTMLNouvelle($arrayNouvelles[$x]);
	}	
	
	echo $html;

}
function GetHTMLNouvelle($Nouvelles){
	
	$html = '';
	$html .= '<div class=" justify-content-center"><header>
					<div> 
						<img id="image" src="'.$Nouvelles->getImagePath().'" alt="Image de '.$Nouvelles->getTitle().'" height="200" width="200">
					</div>	

						<h1 id="title"> 
							'.$Nouvelles->getTitle().'
						</h1>
					</header>						

					<div id="content"> 
						'.$Nouvelles->getDescrTot().'
					</div>
					</div>
					<hr>';

	echo $html;

}

function GetHTMLAllNouvellesEdit($arrayNouvelles){
	
	$html = '';
	$html = '
		<table class="table table-striped" id="NouvelleEdit">
		<thead>
			<tr>
				<th scope="col">Titre</th>
				<th scope="col">Date de début</th>
				<th scope="col">Date de fin</th>
				<th scope="col">Actif</th>
			</tr>
		</thead>
		<tbody>';
			
			
			for($x = 0; $x <count($arrayNouvelles);$x++){
				$epochDebut = $arrayNouvelles[$x]->getDateDebut();
				$epochFin = $arrayNouvelles[$x]->getDateFin();
				$dateDebut = new DateTime("@$epochDebut");  
				$dateFin = new DateTime("@$epochFin");  
				
					$html .= 
				'<tr>
					<th scope="row">
						<a href onclick="parent.fnRedirectionNouvelle(\'Nouvelles/Nouvelles.php\',0,'.$arrayNouvelles[$x]->getNouvellesId().')">'.$arrayNouvelles[$x]->getTitle().'</a></th>
					<td>'.$dateDebut->format('m/d/Y').'</td>
					<td>'.$dateFin->format('m/d/Y').'</td>
					<td><input type="checkbox" id="checkbox'.$arrayNouvelles[$x]->getNouvellesId().'" name="checkbox'.$arrayNouvelles[$x]->getTitle().'" value="'.$arrayNouvelles[$x]->getActif().'" ';
					
				if($arrayNouvelles[$x]->getActif() == 1)
				{
					$html.= "checked";
				}
				
				$html .='>
					</td>
				</tr>';
				}
	
	$html .='</tbody>
	</table>';
	
	$html .='<button type="button" id ="btnAddNouvelle" class="btn btn-primary" onclick="fnAddNouvelle();">Ajouter</button>';
	
	echo $html;
}
function GetAddNouvelles(){
	$html = '';
	$html .='	
			<div id="addNouvelles" class="d-none">
				<div>
					<img id="imageSommaire" src="" alt="Image" height="42" width="42" />
					<form action="../Uploads/UploadImage.php" method="post" enctype="multipart/form-data">
							<label for="fileToUpload">Select image to upload:</label>
							<input type="file" name="fileToUpload[]" id="fileToUpload">
							<input type="submit" value="Upload Image" name="submit">
					</form>
				</div>
				<div>
				<label for="title">Titre</label>
					<p id="title" contentEditable></p>
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
					<div id="descriptionSommaire" contentEditable></div>
				</div>
				<div>
					<label for="descriptionTotal">Description Complète</label>
					<div id="descriptionTotal" contentEditable></div>
				</div>
				<div>
					
					<input type="checkbox" id="checkbox" name="checkboxtitraae" value="0" >
					<label for="checkbox">Actif</label>
				</div>
				<button type="button" class="btn btn-primary mt-3" onclick="fnSaveNouvelle();">Sauvegarder</button>
			</div>';
	echo $html;
}

function GetHTMLNouvelleEdit($Nouvelles){
	
	$epochDebut = $Nouvelles->getDateDebut();
	$epochFin = $Nouvelles->getDateFin();
	$dateDebut = new DateTime("@$epochDebut");  
	$dateFin = new DateTime("@$epochFin"); 
	$html = '';
	$html .='	
			<div id="addNouvelles" >
				<div>
					<img id="imageSommaire" src="'.$Nouvelles->getImagePath().'" alt="Image" height="42" width="42" />
					
					<form action="#" method="post" enctype="multipart/form-data" id="form" onsubmit="fnUpdateNouvelle()">
							<label for="fileToUpload">Select image to upload:</label>
							<input type="file" name="fileToUpload[]" id="fileToUpload">
							<input type="submit" value="Upload Image" name="submit">
					</form>
				</div>
				<div>
				<label for="title">Titre</label>
					<p id="title" contentEditable>'.$Nouvelles->getTitle().'</p>
				</div>
				<div class="row">
					<div class="col">
						<label for="dateDebut">date de début</label>
						<input type="text" class="datetimepicker form-control" readonly name="dateDebut" id="dateDebut" value="'.$dateDebut->format('m/d/Y').'">
					</div>
					<div class="col">
						<label for="dateFin">date de fin</label>
						<input type="text" class="datetimepicker form-control" readonly=name="dateFin" id="dateFin" value = "'.$dateFin->format('m/d/Y').'">
					</div>
				</div>
				<div>
					<label for="descriptionSommaire">Description Sommaire</label>
					<div id="descriptionSommaire" contentEditable>'.$Nouvelles->getDescrSomm().'</div>
				</div>
				<div>
					<label for="descriptionTotal">Description Complète</label>
					<div id="descriptionTotal" contentEditable>'.$Nouvelles->getDescrTot().'</div>
				</div>
				<div>
					
					<input type="checkbox" id="checkbox" name="checkboxtitraae" value="'.$Nouvelles->getActif().'"';
					if($Nouvelles->getActif() == 1)
						{
							$html.= "checked";
						}
			$html.='>
					<label for="checkbox">Actif</label>
				</div>
				<button type="button" class="btn btn-primary mt-3" onclick="fnUpdateNouvelle();">Sauvegarder</button>
			</div>';
	echo $html;
}
function fnSaveNouvelle(){
	 if ($_POST['dateDebut'] == '' || 
			 $_POST['dateFin'] == '' || 
			 $_POST['descriptionSommaire'] == '' || 
			 $_POST['descriptionTotal'] == ''||
			 $_POST['actif'] == ''||
			 $_POST['title'] == '') {
    exit('emptyFields');
  }
  
  if (NouvellesDAO::saveNewNouvelles(FNSQL($_POST['title']), FNSQL($_POST['descriptionSommaire']), FNSQL($_POST['descriptionTotal']), FNSQL($_POST['dateDebut']), FNSQL($_POST['dateFin']), FNSQL($_POST['actif'])) == 'success'){
    exit('success');
  }
  
  exit('fail');
}
function fnUpdateNouvelle(){
	  
  if (NouvellesDAO::updateNouvelles(FNSQL($_SESSION["nouvelleId"]),
																		FNSQL($_POST['title']),
																		FNSQL($_POST['descriptionSommaire']),
																		FNSQL($_POST['descriptionTotal']),
																		FNSQL($_POST['dateDebut']),
																		FNSQL($_POST['dateFin']), 
																		FNSQL($_POST['actif'])) == 'success')
	{
		
    exit('success');
  }
	if(isset($_POST)){
		
		$_SESSION["nouvelleId"] = 0;
	}
  
  exit('fail');
}
function UpdateImageNouvelle($file){
	
	if(NouvellesDAO::UpdateImageNouvelle($_SESSION["nouvelleId"],$file['images'][0]['imagePath']) == 'success'){
		
	}
		
}


?>
