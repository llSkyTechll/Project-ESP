<?php 

require_once '../Class/clsNouvellesDAO.php';

require_once '../Class/clsNouvelles.php';

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
					<div id="image"> 
						<img src="'.$Nouvelles->getImagePath().'" alt="Image de '.$Nouvelles->getTitle().'" height="200" width="200">
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
		<table class="table table-striped">
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
					<th scope="row">'.$arrayNouvelles[$x]->getTitle().'</th>
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
	
	
	
	echo $html;
}

?>