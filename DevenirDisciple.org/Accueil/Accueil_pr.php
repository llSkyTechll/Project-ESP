<?php

require_once '../ConnexionDB.php';

require_once '../Class/clsAccueilDAO.php';

require_once '../Class/clsNouvellesDAO.php';

require_once '../Class/clsNouvelles.php';

function GetHTMLBandeau($arrayNouvelles){
	
	
	$html = '';
	$html = '<div id="carouselExampleIndicators" class=" carousel slide  container pt-1" data-ride="carousel" data-interval="10000">
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
						<div class="">
								<a onclick="parent.fnRedirectionNouvelle(\'Nouvelles/Nouvelles.php\',0,'.$arrayNouvelles[$x]->getNouvellesId().')">
									<img class="d-block w-100 h-100" src="'.$arrayNouvelles[$x]->getImagePath().'" alt="'.$arrayNouvelles[$x]->getTitle().'" title="'.$arrayNouvelles[$x]->getTitle().'">
								</a>
							</div>
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
	/*
						<div class="embed-responsive embed-responsive-21by9">
						<div class="embed-responsive embed-responsive-16by9">
						<div class="embed-responsive embed-responsive-4by3">
						<div class="embed-responsive embed-responsive-1by1">
	*/
	if(!is_null($basPage) && !empty($basPage))
	{
		$html ='
		<div class="container mt-5">
			<div class="basPage row m-auto">
				<div class="col-md-6 col-sm-12 row m-auto">
					<div class="col-md-6 col-sm-6 col-10 m-auto">
						<a onclick="parent.fnRedirection(\'Formulaire/FormulaireBenevolat.php\',0)">
							<img class="d-block img-fluid rounded w-100 " src="'.$basPage['imageHomeliePath'] .'" alt="Homéli du curé" title="Homéli du curé">
						</a>
					</div>
					<div class="col-md-6 col-sm-6 col-10 m-auto">
						<a onclick="parent.fnRedirection(\'Formulaire/FormulaireBenevolat.php\',0)">
							<img class="d-block img-fluid rounded w-100 "  src="'.$basPage['imageTemoignagePath'] .'" alt="Témoinage" title="Témoinage">
						</a>
					</div>
				</div>
				<div class="col-md-6 col-sm-12 row m-auto">
					<div class="col-md-6 col-sm-6 col-10 m-auto">
						<div class="embed-responsive embed-responsive-4by3">
							<video class="embed-responsive-item rounded " controls="controls">
								<source src="'.$basPage['videoBienvenuePath'] .'" type="video/mp4" />
								vidéo curé
							</video>
							
						</div>
					</div>
					<div class="col-md-6 col-sm-6 col-10 m-auto">
						<a onclick="parent.fnRedirection(\'Formulaire/FormulaireBenevolat.php\',0)">
							<img class="d-block img-fluid rounded w-100"  src="'.$basPage['imageFormulairePath'] .'" alt="Formulaire Bénévolat" title="Formulaire Bénévolat">
						</a>
					</div>
				</div>
			</div>
		</div>';
	}
	echo $html;
	
}

function loadPageContent(){
	GetHTMLBandeau(NouvellesDAO::getNouvellesBandeau());	
	GetBasPage(AccueilDAO::getBasPage());		
}


?>
