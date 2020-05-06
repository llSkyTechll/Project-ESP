<?php

require_once '../ConnexionDB.php';

require_once '../Class/clsAccueilDAO.php';

require_once '../Class/clsNouvellesDAO.php';

require_once '../Class/clsNouvelles.php';

function GetHTMLBandeau($arrayNouvelles){
	
	
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
							<a onclick="parent.fnRedirectionNouvelle(\'Nouvelles/Nouvelles.php\',0,'.$arrayNouvelles[$x]->getNouvellesId().')">
								<img class="d-block img-fluid" style="width:950px;height:300px;" src="'.$arrayNouvelles[$x]->getImagePath().'" alt="'.$arrayNouvelles[$x]->getTitle().'" title="'.$arrayNouvelles[$x]->getTitle().'">
							</a>
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

function GetBasPage($basPage){
	$html = '';
	if(!is_null($basPage) && !empty($basPage))
	$html ='
		<div class="container mt-5">
		<div class="row">
			<div class="col-md-3">
				<!--<p>oméli du curé</p>-->
				<a onclick="parent.fnRedirection(\'Formulaire/FormulaireBenevolat.php\',0)">
					<img class="d-block img-fluid rounded " style="widht: 200px;height:200px" src="'.$basPage['imageHomeliePath'] .'" alt="Homéli du curé" title="Homéli du curé">
				</a>


			</div>
			<div class="col-md-3">
				<a onclick="parent.fnRedirection(\'Formulaire/FormulaireBenevolat.php\',0)">
					<img class="d-block img-fluid rounded " style="widht: 200px;height:200px" src="'.$basPage['imageTemoignagePath'] .'" alt="Témoinage" title="Témoinage">
				</a>
				
			</div>
			<div class="col-md-3">
				<div class="embed-responsive embed-responsive-4by3">
					<video class="embed-responsive-item rounded " controls="controls">
						<source src="'.$basPage['videoBienvenuePath'] .'" type="video/mp4" />
						vidéo curé
					</video>
				</div>

			</div>
			<div class="col-md-3">
				<a onclick="parent.fnRedirection(\'Formulaire/FormulaireBenevolat.php\',0)">
					<img class="d-block img-fluid rounded " style="widht: 200px;height:200px" src="'.$basPage['imageFormulairePath'] .'" alt="Formulaire Bénévolat" title="Formulaire Bénévolat">
				</a>
				
			</div>
		</div>

	</div>';
	echo $html;
	
}

function loadPageContent(){
	GetHTMLBandeau(NouvellesDAO::getNouvellesBandeau());	
	GetBasPage(AccueilDAO::getBasPage());		
}


?>