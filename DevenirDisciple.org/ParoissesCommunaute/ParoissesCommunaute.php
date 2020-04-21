<?php

require_once '../ConnexionDB.php';

require_once '../PHPFunctions.php';

require_once 'ParoissesCommunaute_pr.php';

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
	<!--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>-->
	<script src="../JavaScript/PopperCalendar.js"></script>
  <!--<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>-->
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
  <script src="../JavaScript/moment.js"></script>
	<!--<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.js"></script>-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/air-datepicker/2.2.3/js/datepicker.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/air-datepicker/2.2.3/js/i18n/datepicker.en.js"></script>

	<link rel="stylesheet" href="../css/include.css">
	<link rel="stylesheet" href="../css/calendar.css">
	<script src="../JavaScript/JSFunction.js"></script>
	<!--<script src="../JavaScript/JSCalendar.js"></script>-->
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
									title: 'Connexion réussi.',
									icon: 'success'
								}).then((result) => {
									window.top.location.reload();
								});
							} else if (data == 'empty'){
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
          $conn = OpenCon();
          $SQL = "SELECT NAME, redirectionpath FROM MENU LIMIT 0, 1;";
          $RSSQL = $conn->query($SQL);
          $TEST = '';
          if ($RSSQL->num_rows > 0) {
          // output data of each row
            while($row = $RSSQL->fetch_assoc()) {
              $TEST = $row['NAME'];
            }
          }
          CLoseCon($conn);
        ?> {
							title: 'Barber',
							description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eu pellentesque nibh. In nisl nulla, convallis ac nulla eget, pellentesque pellentesque magna.',
							start: '2019-07-07',
							end: '2019-07-07',
							className: 'fc-bg-default',
							icon: "circle"
						},
						{
							title: 'Flight Paris',
							description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eu pellentesque nibh. In nisl nulla, convallis ac nulla eget, pellentesque pellentesque magna.',
							start: '2019-08-08T14:00:00',
							end: '2019-08-08T20:00:00',
							className: 'fc-bg-deepskyblue',
							icon: "cog",
							allDay: false
						},
						{
							title: 'Team Meeting',
							description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eu pellentesque nibh. In nisl nulla, convallis ac nulla eget, pellentesque pellentesque magna.',
							start: '2019-07-10T13:00:00',
							end: '2019-07-10T16:00:00',
							className: 'fc-bg-pinkred',
							icon: "group",
							allDay: false
						},
						{
							title: 'Meeting',
							description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eu pellentesque nibh. In nisl nulla, convallis ac nulla eget, pellentesque pellentesque magna.',
							start: '2019-08-12',
							className: 'fc-bg-lightgreen',
							icon: "suitcase"
						},
						{
							title: 'Conference',
							description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eu pellentesque nibh. In nisl nulla, convallis ac nulla eget, pellentesque pellentesque magna.',
							start: '2019-08-13',
							end: '2019-08-15',
							className: 'fc-bg-blue',
							icon: "calendar"
						},
						{
							title: 'Baby Shower',
							description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eu pellentesque nibh. In nisl nulla, convallis ac nulla eget, pellentesque pellentesque magna.',
							start: '2019-08-13',
							end: '2019-08-14',
							className: 'fc-bg-default',
							icon: "child"
						},
						{
							title: 'Birthday',
							description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eu pellentesque nibh. In nisl nulla, convallis ac nulla eget, pellentesque pellentesque magna.',
							start: '2019-09-13',
							end: '2019-09-13',
							className: 'fc-bg-default',
							icon: "birthday-cake",
							allDay: false
						},
						{
							title: 'Birthday',
							description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eu pellentesque nibh. In nisl nulla, convallis ac nulla eget, pellentesque pellentesque magna.',
							start: '2019-09-15',
							end: '2019-09-16',
							className: 'fc-bg-default',
							icon: "birthday-cake",
							allDay: true
						},
						{
							title: 'Restaurant',
							description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eu pellentesque nibh. In nisl nulla, convallis ac nulla eget, pellentesque pellentesque magna.',
							start: '2019-10-15T09:30:00',
							end: '2019-10-15T11:45:00',
							className: 'fc-bg-default',
							icon: "glass",
							allDay: false
						},
						{
							title: 'Dinner',
							description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eu pellentesque nibh. In nisl nulla, convallis ac nulla eget, pellentesque pellentesque magna.',
							start: '2019-11-15T20:00:00',
							end: '2019-11-15T22:30:00',
							className: 'fc-bg-default',
							icon: "cutlery",
							allDay: false
						},
						{
							title: 'Shooting',
							description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eu pellentesque nibh. In nisl nulla, convallis ac nulla eget, pellentesque pellentesque magna.',
							start: '2019-08-25',
							end: '2019-08-25',
							className: 'fc-bg-blue',
							icon: "camera"
						},
						{
							title: 'Go Space :)',
							description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eu pellentesque nibh. In nisl nulla, convallis ac nulla eget, pellentesque pellentesque magna.',
							start: '2019-12-27',
							end: '2019-12-27',
							className: 'fc-bg-default',
							icon: "rocket"
						},
						{
							title: 'Dentist',
							description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eu pellentesque nibh. In nisl nulla, convallis ac nulla eget, pellentesque pellentesque magna.',
							start: '2019-12-29T11:30:00',
							end: '2019-12-29T012:30:00',
							className: 'fc-bg-blue',
							icon: "medkit",
							allDay: false
						}
					],
					eventRender: function(event, element) {
						if (event.icon) {
							element.find(".fc-title").prepend("<i class='fa fa-" + event.icon + "'></i>");
						}
					},
					dayClick: function() {
						jQuery('#modal-view-event-add').modal();
					},
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

		<div class="col-12 calender d-none">
			<header>
				<h4 class="display-4 mb-4 text-center">November 2017</h4>
				<div class="row d-none d-sm-flex p-1 bg-dark text-white">
					<h5 class="col-sm p-1 text-center">Sunday</h5>
					<h5 class="col-sm p-1 text-center">Monday</h5>
					<h5 class="col-sm p-1 text-center">Tuesday</h5>
					<h5 class="col-sm p-1 text-center">Wednesday</h5>
					<h5 class="col-sm p-1 text-center">Thursday</h5>
					<h5 class="col-sm p-1 text-center">Friday</h5>
					<h5 class="col-sm p-1 text-center">Saturday</h5>
				</div>
			</header>
			<div class="row border border-right-0 border-bottom-0">
				<div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate d-none d-sm-inline-block bg-light text-muted">
					<h5 class="row align-items-center">
						<span class="date col-1">29</span>
						<small class="col d-sm-none text-center text-muted">Sunday</small>
						<span class="col-1"></span>
					</h5>
					<p class="d-sm-none">No events</p>
				</div>
				<div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate d-none d-sm-inline-block bg-light text-muted">
					<h5 class="row align-items-center">
						<span class="date col-1">30</span>
						<small class="col d-sm-none text-center text-muted">Monday</small>
						<span class="col-1"></span>
					</h5>
					<p class="d-sm-none">No events</p>
				</div>
				<div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate d-none d-sm-inline-block bg-light text-muted">
					<h5 class="row align-items-center">
						<span class="date col-1">31</span>
						<small class="col d-sm-none text-center text-muted">Tuesday</small>
						<span class="col-1"></span>
					</h5>
					<p class="d-sm-none">No events</p>
				</div>
				<div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
					<h5 class="row align-items-center">
						<span class="date col-1">1</span>
						<small class="col d-sm-none text-center text-muted">Wednesday</small>
						<span class="col-1"></span>
					</h5>
					<p class="d-sm-none">No events</p>
				</div>
				<div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
					<h5 class="row align-items-center">
						<span class="date col-1">2</span>
						<small class="col d-sm-none text-center text-muted">Thursday</small>
						<span class="col-1"></span>
					</h5>
					<p class="d-sm-none">No events</p>
				</div>
				<div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
					<h5 class="row align-items-center">
						<span class="date col-1">3</span>
						<small class="col d-sm-none text-center text-muted">Friday</small>
						<span class="col-1"></span>
					</h5>
					<a class="event d-block p-1 pl-2 pr-2 mb-1 rounded text-truncate small bg-info text-white" title="Test Event 1">Test Event 1</a>
				</div>
				<div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
					<h5 class="row align-items-center">
						<span class="date col-1">4</span>
						<small class="col d-sm-none text-center text-muted">Saturday</small>
						<span class="col-1"></span>
					</h5>
					<p class="d-sm-none">No events</p>
				</div>
				<div class="w-100"></div>
				<div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
					<h5 class="row align-items-center">
						<span class="date col-1">5</span>
						<small class="col d-sm-none text-center text-muted">Sunday</small>
						<span class="col-1"></span>
					</h5>
					<p class="d-sm-none">No events</p>
				</div>
				<div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
					<h5 class="row align-items-center">
						<span class="date col-1">6</span>
						<small class="col d-sm-none text-center text-muted">Monday</small>
						<span class="col-1"></span>
					</h5>
					<p class="d-sm-none">No events</p>
				</div>
				<div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
					<h5 class="row align-items-center">
						<span class="date col-1">7</span>
						<small class="col d-sm-none text-center text-muted">Tuesday</small>
						<span class="col-1"></span>
					</h5>
					<p class="d-sm-none">No events</p>
				</div>
				<div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
					<h5 class="row align-items-center">
						<span class="date col-1">8</span>
						<small class="col d-sm-none text-center text-muted">Wednesday</small>
						<span class="col-1"></span>
					</h5>
					<a class="event d-block p-1 pl-2 pr-2 mb-1 rounded text-truncate small bg-success text-white" title="Test Event 2">Test Event 2</a>
					<a class="event d-block p-1 pl-2 pr-2 mb-1 rounded text-truncate small bg-danger text-white" title="Test Event 3">Test Event 3</a>
				</div>
				<div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
					<h5 class="row align-items-center">
						<span class="date col-1">9</span>
						<small class="col d-sm-none text-center text-muted">Thursday</small>
						<span class="col-1"></span>
					</h5>
					<p class="d-sm-none">No events</p>
				</div>
				<div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
					<h5 class="row align-items-center">
						<span class="date col-1">10</span>
						<small class="col d-sm-none text-center text-muted">Friday</small>
						<span class="col-1"></span>
					</h5>
					<p class="d-sm-none">No events</p>
				</div>
				<div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
					<h5 class="row align-items-center">
						<span class="date col-1">11</span>
						<small class="col d-sm-none text-center text-muted">Saturday</small>
						<span class="col-1"></span>
					</h5>
					<p class="d-sm-none">No events</p>
				</div>
				<div class="w-100"></div>
				<div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
					<h5 class="row align-items-center">
						<span class="date col-1">12</span>
						<small class="col d-sm-none text-center text-muted">Sunday</small>
						<span class="col-1"></span>
					</h5>
					<p class="d-sm-none">No events</p>
				</div>
				<div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
					<h5 class="row align-items-center">
						<span class="date col-1">13</span>
						<small class="col d-sm-none text-center text-muted">Monday</small>
						<span class="col-1"></span>
					</h5>
					<p class="d-sm-none">No events</p>
				</div>
				<div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
					<h5 class="row align-items-center">
						<span class="date col-1">14</span>
						<small class="col d-sm-none text-center text-muted">Tuesday</small>
						<span class="col-1"></span>
					</h5>
					<p class="d-sm-none">No events</p>
				</div>
				<div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
					<h5 class="row align-items-center">
						<span class="date col-1">15</span>
						<small class="col d-sm-none text-center text-muted">Wednesday</small>
						<span class="col-1"></span>
					</h5>
					<p class="d-sm-none">No events</p>
				</div>
				<div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
					<h5 class="row align-items-center">
						<span class="date col-1">16</span>
						<small class="col d-sm-none text-center text-muted">Thursday</small>
						<span class="col-1"></span>
					</h5>
					<p class="d-sm-none">No events</p>
				</div>
				<div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
					<h5 class="row align-items-center">
						<span class="date col-1">17</span>
						<small class="col d-sm-none text-center text-muted">Friday</small>
						<span class="col-1"></span>
					</h5>
					<p class="d-sm-none">No events</p>
				</div>
				<div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
					<h5 class="row align-items-center">
						<span class="date col-1">18</span>
						<small class="col d-sm-none text-center text-muted">Saturday</small>
						<span class="col-1"></span>
					</h5>
					<p class="d-sm-none">No events</p>
				</div>
				<div class="w-100"></div>
				<div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
					<h5 class="row align-items-center">
						<span class="date col-1">19</span>
						<small class="col d-sm-none text-center text-muted">Sunday</small>
						<span class="col-1"></span>
					</h5>
					<p class="d-sm-none">No events</p>
				</div>
				<div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
					<h5 class="row align-items-center">
						<span class="date col-1">20</span>
						<small class="col d-sm-none text-center text-muted">Monday</small>
						<span class="col-1"></span>
					</h5>
					<a class="event d-block p-1 pl-2 pr-2 mb-1 rounded text-truncate small bg-primary text-white" title="Test Event with Super Duper Really Long Title">Test Event with Super Duper Really Long Title</a>
				</div>
				<div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
					<h5 class="row align-items-center">
						<span class="date col-1">21</span>
						<small class="col d-sm-none text-center text-muted">Tuesday</small>
						<span class="col-1"></span>
					</h5>
					<p class="d-sm-none">No events</p>
				</div>
				<div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
					<h5 class="row align-items-center">
						<span class="date col-1">22</span>
						<small class="col d-sm-none text-center text-muted">Wednesday</small>
						<span class="col-1"></span>
					</h5>
					<p class="d-sm-none">No events</p>
				</div>
				<div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
					<h5 class="row align-items-center">
						<span class="date col-1">23</span>
						<small class="col d-sm-none text-center text-muted">Thursday</small>
						<span class="col-1"></span>
					</h5>
					<p class="d-sm-none">No events</p>
				</div>
				<div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
					<h5 class="row align-items-center">
						<span class="date col-1">24</span>
						<small class="col d-sm-none text-center text-muted">Friday</small>
						<span class="col-1"></span>
					</h5>
					<p class="d-sm-none">No events</p>
				</div>
				<div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
					<h5 class="row align-items-center">
						<span class="date col-1">25</span>
						<small class="col d-sm-none text-center text-muted">Saturday</small>
						<span class="col-1"></span>
					</h5>
					<p class="d-sm-none">No events</p>
				</div>
				<div class="w-100"></div>
				<div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
					<h5 class="row align-items-center">
						<span class="date col-1">26</span>
						<small class="col d-sm-none text-center text-muted">Sunday</small>
						<span class="col-1"></span>
					</h5>
					<p class="d-sm-none">No events</p>
				</div>
				<div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
					<h5 class="row align-items-center">
						<span class="date col-1">27</span>
						<small class="col d-sm-none text-center text-muted">Monday</small>
						<span class="col-1"></span>
					</h5>
					<p class="d-sm-none">No events</p>
				</div>
				<div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
					<h5 class="row align-items-center">
						<span class="date col-1">28</span>
						<small class="col d-sm-none text-center text-muted">Tuesday</small>
						<span class="col-1"></span>
					</h5>
					<p class="d-sm-none">No events</p>
				</div>
				<div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
					<h5 class="row align-items-center">
						<span class="date col-1">29</span>
						<small class="col d-sm-none text-center text-muted">Wednesday</small>
						<span class="col-1"></span>
					</h5>
					<p class="d-sm-none">No events</p>
				</div>
				<div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate ">
					<h5 class="row align-items-center">
						<span class="date col-1">30</span>
						<small class="col d-sm-none text-center text-muted">Thursday</small>
						<span class="col-1"></span>
					</h5>
					<p class="d-sm-none">No events</p>
				</div>
				<div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate d-none d-sm-inline-block bg-light text-muted">
					<h5 class="row align-items-center">
						<span class="date col-1">1</span>
						<small class="col d-sm-none text-center text-muted">Friday</small>
						<span class="col-1"></span>
					</h5>
					<p class="d-sm-none">No events</p>
				</div>
				<div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate d-none d-sm-inline-block bg-light text-muted">
					<h5 class="row align-items-center">
						<span class="date col-1">2</span>
						<small class="col d-sm-none text-center text-muted">Saturday</small>
						<span class="col-1"></span>
					</h5>
					<p class="d-sm-none">No events</p>
				</div>
				<div class="w-100"></div>
				<div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate d-none d-sm-inline-block bg-light text-muted">
					<h5 class="row align-items-center">
						<span class="date col-1">3</span>
						<small class="col d-sm-none text-center text-muted">Sunday</small>
						<span class="col-1"></span>
					</h5>
					<p class="d-sm-none">No events</p>
				</div>
				<div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate d-none d-sm-inline-block bg-light text-muted">
					<h5 class="row align-items-center">
						<span class="date col-1">4</span>
						<small class="col d-sm-none text-center text-muted">Monday</small>
						<span class="col-1"></span>
					</h5>
					<p class="d-sm-none">No events</p>
				</div>
				<div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate d-none d-sm-inline-block bg-light text-muted">
					<h5 class="row align-items-center">
						<span class="date col-1">5</span>
						<small class="col d-sm-none text-center text-muted">Tuesday</small>
						<span class="col-1"></span>
					</h5>
					<p class="d-sm-none">No events</p>
				</div>
				<div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate d-none d-sm-inline-block bg-light text-muted">
					<h5 class="row align-items-center">
						<span class="date col-1">6</span>
						<small class="col d-sm-none text-center text-muted">Wednesday</small>
						<span class="col-1"></span>
					</h5>
					<p class="d-sm-none">No events</p>
				</div>
				<div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate d-none d-sm-inline-block bg-light text-muted">
					<h5 class="row align-items-center">
						<span class="date col-1">7</span>
						<small class="col d-sm-none text-center text-muted">Thursday</small>
						<span class="col-1"></span>
					</h5>
					<p class="d-sm-none">No events</p>
				</div>
				<div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate d-none d-sm-inline-block bg-light text-muted">
					<h5 class="row align-items-center">
						<span class="date col-1">8</span>
						<small class="col d-sm-none text-center text-muted">Friday</small>
						<span class="col-1"></span>
					</h5>
					<p class="d-sm-none">No events</p>
				</div>
				<div class="day col-sm p-2 border border-left-0 border-top-0 text-truncate d-none d-sm-inline-block bg-light text-muted">
					<h5 class="row align-items-center">
						<span class="date col-1">9</span>
						<small class="col d-sm-none text-center text-muted">Saturday</small>
						<span class="col-1"></span>
					</h5>
					<p class="d-sm-none">No events</p>
				</div>
			</div>
		</div>

  <div class="col-md-9">
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
								<input type='text' class="datetimepicker form-control" name="edate" id="edate">
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
