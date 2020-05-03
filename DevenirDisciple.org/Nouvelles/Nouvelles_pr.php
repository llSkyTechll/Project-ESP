<?php 
require_once '../PHPFunctions.php';

require_once '../Class/clsNouvellesDAO.php';

require_once '../Class/clsNouvelles.php';
if (isset($_POST['action'])){
  $action = $_POST['action'];
  
  switch($action){
  /*case 'updateNouvellesAll':
    FNUpdateEvent();
	case 'updateNouvelles':
    FNUpdateEvent();*/
	case 'saveNouvelles':
		fnSaveNouvelle();
  }
}

function GetHTMLBandeau($arrayNouvelles){
	
	//print_r($arrayNouvelles[0]);
	$html = '';
	$html = '<div id="carouselExampleIndicators" class="carousel slide w-50 container" data-ride="carousel" data-interval="10000">
						<ol class="carousel-indicators">';

	for($x = 0; $x <count($arrayNouvelles);$x++){
		$html .= '<li data-target="#carouselExampleIndicators" data-slide-to="'.$x.'"';
		if($x==0){ $html .= 'class="active"'; }
		$html .= '></li>';				
	}
	$html .='</ol><div class="carousel-inner">';

	for($x = 0; $x <count($arrayNouvelles);$x++){

		$html .= '<div class="carousel-item';
		if($x==0){ $html.=' active';	}
		$html .= '">
						<img class="d-block img-fluid" style="widht: 1000px;height:400px" src="'.$arrayNouvelles[$x]->getImagePath().'" alt="'.$arrayNouvelles[$x]->getTitle().'" title="'.$arrayNouvelles[$x]->getTitle().'">
						</div>';
	}
	$html.='<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		</a>
		<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
		</div>
		</div>';
	
	echo $html;

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
function GetHTMLNouvelleEdit($Nouvelles){
	
	$html = '';
	$html .= '<div class=" justify-content-center" ><header>
					<div > 
						<img id ="image"src="'.$Nouvelles->getImagePath().'" alt="Image de '.$Nouvelles->getTitle().'" height="200" width="200">
						<form action="../Uploads/UploadImage.php" method="post" enctype="multipart/form-data">
							<label for="fileToUpload">Select image to upload:</label>
							<input type="file" name="fileToUpload[]" id="fileToUpload" multiple>
							<input type="submit" value="Upload Image" name="submit">
						</form>
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
					<td>'.$dateDebut->format('Y-m-d').'</td>
					<td>'.$dateFin->format('Y-m-d').'</td>
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
function fnSaveNouvelle(){
	 if ($_POST['dateDebut'] == '' || 
			 $_POST['dateFin'] == '' || 
			 $_POST['descriptionSommaire'] == '' || 
			 $_POST['descriptionTotal'] == ''||
			 $_POST['actif'] == ''||
			 $_POST['title'] == '') {
    exit('emptyFields');
  }
  
  if (NouvellesDAO::saveNewNouvelles(FNSQL($_POST['title']), FNSQL($_POST['descriptionSommaire']), FNSQL($_POST['descriptionTotal']), FNSQL($_POST['dateDebut']), FNSQL($_POST['dateFin']), FNSQL($_POST['actif']), FNSQL($_POST['imageSommaire'])) == 'success'){
    exit('success');
  }
  
  exit('fail');
}
function fnUpdateNouvelle(){
	 
  
  if (NouvellesDAO::updateNouvelles(FNSQL($_POST['nouvelleId']),FNSQL($_POST['title']), FNSQL($_POST['descriptionSommaire']), FNSQL($_POST['descriptionTotal']), FNSQL($_POST['dateDebut']), FNSQL($_POST['dateFin']), FNSQL($_POST['actif']), FNSQL($_POST['imageSommaire'])) == 'success'){
    exit('success');
  }
  
  exit('fail');
}



?>


