<?php

require_once '../ConnexionDB.php';

require_once '../Class/clsFeuilletDAO.php';


function GetHTMLAllFeuillets($arrayFeuillet){
	
	$html = '';
	$html = '
		<table class="table table-striped" id="NouvelleEdit">
			<thead>
				<tr>
					<th scope="col">Fichier attaché</th>
					<th scope="col">Taille</th>
				</tr>
			</thead>
		<tbody>';			

	for($x = 0; $x <count($arrayFeuillet);$x++){
		$html .= getHTMLFeuillet($arrayFeuillet[$x]);
	}

	$html .='</tbody>
	</table>';

	$html .='<button type="button" id ="btnAddFeuillet" class="btn btn-primary" onclick="fnAddFeuillet();">Ajouter</button>';

	echo $html;

}

function GetHTMLFeuillet($feuillet){
	
	$html = '';
	$html .='
					<tr>
						<th scope="row">
							<a href="'.$feuillet->getPdfPath().'">'.$feuillet->getPdfName().'</a>							
						</th>
						<td>'.($feuillet->getSize()/1024).'mo</td>
					</tr>';	

	return $html;

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
function loadPageContent(){
	
		GetHTMLAllFeuillets(FeuiletDAO::getAllFeuillet());
			/*if(validateAdminEditing()){
				if($_SESSION["FeuilletId"] == 0){
					GetHTMLAllFeuillets(FeuiletDAO::getAllFeuillet());
					//GetHTMLAllNouvellesEdit(NouvellesDAO::getAllNouvelles());
					//GetAddNouvelles();
				}
				else{
					GetHTMLNouvelleEdit(NouvellesDAO::getNouvelles($_SESSION["FeuilletId"]));
				}
			}
			else{
				if($_SESSION["FeuilletId"] == 0){
					GetHTMLAllnouvelles(NouvellesDAO::getAllNouvelles());
				}
				else{
					GetHTMLNouvelle(NouvellesDAO::getNouvelles($_SESSION["FeuilletId"]));
				}
			}		*/
}


?>