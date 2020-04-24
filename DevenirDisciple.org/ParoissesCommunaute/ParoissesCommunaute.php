<?php

require_once '../ConnexionDB.php';

require_once '../PHPFunctions.php';

require_once 'ParoissesCommunaute_pr.php';

require_once '../Class/clsAdmin.php';

if (isset($_SESSION['gmenuId'])){
  $_SESSION['gcommunityid'] = ParoisseCommunaute::getCommunityId();
}

?>

<!doctype html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- Bootstrap4-->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

	<!--Calendrier-->
  <script src="../JavaScript/JQueryCalendar.js"></script>
	<script src="../JavaScript/PopperCalendar.js"></script>
  <script src="../JavaScript/BootstrapCalendar.js"></script>
  <script src="../JavaScript/moment.js"></script>
  <script src="../JavaScript/FullCalendar.js"></script>
  <script src="../JavaScript/DatePickerCalendar.js"></script>
	<script src="../JavaScript/LanguageCalendar.js"></script>
  
	<link rel="stylesheet" href="../css/include.css">
	<link rel="stylesheet" href="../css/includeCalendar.css">
	<script src="../JavaScript/JSFunction.js"></script>
	<!--<script src="../JavaScript/JSCalendar.js"></script>-->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<title>Devenir Disciple</title>

	<script>
  
    function fnAddEvent(){
      $(function() {
					$.ajax({
						type: 'post',
						url: 'ParoissesCommunaute.php',
						data: ({
							action: 'addEvent',
							name: document.getElementById('ename').value,
							date: document.getElementById('edate').value,
							description: document.getElementById('edesc').value,
							color: document.getElementById('ecolor').value,
							icon: document.getElementById('eicon').value,
						}),
						success: function(data) {
							if (data == 'fail') {
								Swal.fire("Une erreur c'est produite", '', 'warning');
							} else if (data == 'success') {
								Swal.fire({
									title: 'Ajout réussi.',
									icon: 'success'
								}).then((result) => {
									window.top.location.reload();
								});
							} else if (data == 'emptyFields'){
                Swal.fire("Veuillez remplir tous les champs", '', 'warning');
              }
						}
					})
        });
    }

		jQuery(document).ready(function() {
			jQuery('.datetimepicker').datepicker({
				timepicker: true,
				language: 'en',
				range: true,
				multipleDates: true,
				multipleDatesSeparator: " - "
			});
    });

		(function() {
			'use strict';
			// ------------------------------------------------------- //
			// Calendar
			// ------------------------------------------------------ //
			jQuery(function() {
				// page is ready
				jQuery('#calendar').fullCalendar({
					themeSystem: 'bootstrap4',
					// emphasizes business hours
					businessHours: false,
					defaultView: 'month',
					// event dragging & resizing
					editable: true,
					// header
					header: {
						left: 'title',
						center: 'month,agendaWeek,agendaDay',
						right: 'today prev,next'
					},
					events: [
						<?php
              $eventArray = CalendarEventDAO::getAllCalendarEvents();
              if($eventArray != null){
                for($x = 0; $x < count($eventArray); $x++){
                  $eventArray[$x]->getCalendarEventFormat();
                }
              }
            ?> 
					],
					eventRender: function(event, element) {
						if (event.icon) {
							element.find(".fc-title").prepend("<i class='fa fa-" + event.icon + "'></i>");
						}
					},
          <?php
            if (Admin::isConnected()){
          ?>
					dayClick: function() {
						jQuery('#modal-view-event-add').modal();
					},
          <?php
            }
          ?>
					eventClick: function(event, jsEvent, view) {
						jQuery('.event-icon').html("<i class='fa fa-" + event.icon + "'></i>");
						jQuery('.event-title').html(event.title);
						jQuery('.event-body').html(event.description);
						jQuery('.eventUrl').attr('href', event.url);
						jQuery('#modal-view-event').modal();
					},
				})
			});

		})(jQuery);

	</script>


</head>

<body>
	<div class="container">
		<header>
			<h1>Paroisse-Communauté</h1>
		</header>

		<p>
      <?php  
        if (isset($_SESSION['gcommunityid'])){
          echo GetCommunityName(); 
        }
      ?>
    </p>

		<div>
			<h1>Heures de bureau</h1>
			<ul>
				<li>
					<p>Lnndi de 9h à 12h30 et de 13h30 à 16h</p>
				</li>
				<li>
					<p>Mardi de 9h à 12h30 et de 13h30 à 16h</p>
				</li>
				<li>
					<p>Mercredi de 9h à 12h30 et de 13h30 à 16h</p>
				</li>
				<li>
					<p>Jeudi de 9h à 12h30 et de 13h30 à 16h</p>
				</li>
				<li>
					<p>Vendredi de 9h à 12h30 et de 13h30 à 16h</p>
				</li>
				<li>
					<p>Samedi de 9h à 12h30 et de 13h30 à 16h</p>
				</li>
				<li>
					<p>Dimanche de 9h à 12h30 et de 13h30 à 16h</p>
				</li>
			</ul>
		</div>

		
  <div class="col-md-12">
		<div class="p-5">
			<h2 class="mb-4">Calendrier des événements</h2>
			<div class="card">
				<div class="card-body p-0">
					<div id="calendar"></div>
				</div>
			</div>
		</div>

		<!-- calendar modal -->
		<div id="modal-view-event" class="modal modal-top fade calendar-modal">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-body">
						<h4 class="modal-title"><span class="event-icon"></span><span class="event-title"></span></h4>
						<div class="event-body"></div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">Fermer</button>
					</div>
				</div>
			</div>
		</div>

		<div id="modal-view-event-add" class="modal modal-top fade calendar-modal">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<form id="add-event">
						<div class="modal-body">
							<h4>Ajout un événement</h4>
							<div class="form-group">
								<label>Nom de l'événement</label>
								<input type="text" class="form-control" name="ename" id="ename">
							</div>
							<div class="form-group">
								<label>Date de l'événement</label>
								<input type='text' class="datetimepicker form-control" readonly name="edate" id="edate">
							</div>
							<div class="form-group">
								<label>Description de l'événement</label>
								<textarea class="form-control" name="edesc" id="edesc"></textarea>
							</div>
							<div class="form-group">
								<label>Couleur de l'événement</label>
								<select class="form-control" name="ecolor" id="ecolor">
									<option value="fc-bg-default">Défaut</option>
									<option value="fc-bg-blue">Bleu</option>
									<option value="fc-bg-lightgreen">Vert</option>
									<option value="fc-bg-pinkred">Rose</option>
									<option value="fc-bg-deepskyblue">Bleu ciel</option>
								</select>
							</div>
							<div class="form-group">
								<label>Icône de l'événement</label>
								<select class="form-control" name="eicon" id="eicon">
									<option value="circle">Cercle</option>
									<option value="cog">Dent</option>
									<option value="group">Groupe</option>
									<option value="suitcase">Valise</option>
									<option value="calendar">Calendrier</option>
								</select>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" onclick="fnAddEvent();">Enregistrer</button>
							<button type="button" class="btn btn-primary" data-dismiss="modal">Fermer</button>
						</div>
					</form>
				</div>
			</div>
		</div>
    </div>

		<div><a>lien feuillet</a></div>
		<div><a>lien Facebook</a></div>

		<div>
			<p>Données</p>
		</div>
	</div>
	<?php require_once '../Footer.php';?>
</body>

</html>
