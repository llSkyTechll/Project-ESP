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
  <link rel="stylesheet" href="../css/Bootstrap.css" >
  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  

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
  
    function fnAdaptDate(inDate){
      var targetTime = new Date(inDate);
      var tzDifference = targetTime.getTimezoneOffset();
      var offsetTime = new Date(targetTime.getTime() + tzDifference * 60 * 1000);
      
      return offsetTime;
    }
  
    function fnFormatDate(inDate){
      var newDate;
      
      var curr_date = inDate.getDate();
      var curr_month = inDate.getMonth();
      curr_month++;
      var curr_year = inDate.getFullYear();
      newDate = curr_month + "/" + curr_date + "/" + curr_year;
      
      var curr_hour = inDate.getHours();
      
      if (curr_hour < 12){
        a_p = "am";
      }else{
        a_p = "pm";
      }
      if (curr_hour == 0){
        curr_hour = 12;
      }
      if (curr_hour > 12){
        curr_hour = curr_hour - 12;
      }
      
      var curr_min = inDate.getMinutes();
      curr_min = curr_min + "";

      if (curr_min.length == 1){
        curr_min = "0" + curr_min;
      }
      
      if (curr_hour.length == 1){
        curr_hour = "0" + curr_hour;
      }
      
      newDate += ' ' + curr_hour + ':' + curr_min + ' ' + a_p;
      
      return newDate;
    }
  
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
            global: document.getElementById('eglobal').checked ? 1 : 0
          }),
          success: function(data) {
            if (data.trim() == 'fail') {
              Swal.fire("Une erreur c'est produite", '', 'warning');
            } else if (data.trim() == 'success') {
              Swal.fire({
                title: 'Ajout réussi.',
                icon: 'success'
              }).then((result) => {
                window.top.location.reload();
              });
            } else if (data.trim() == 'emptyFields'){
              Swal.fire("Veuillez remplir tous les champs", '', 'warning');
            }
          }
        })
      });
    }
    
    function fnDeleteEvent(){
      $(function() {
        $.ajax({
          type: 'post',
          url: 'ParoissesCommunaute.php',
          data: ({
            action: 'deleteEvent',
            eventid: document.getElementById('eventid').value            
          }),
          success: function(data) {
            if (data.trim() == 'fail') {
              Swal.fire("Une erreur c'est produite", '', 'warning');
            } else if (data.trim() == 'success') {
              Swal.fire({
                title: 'Supression réussi.',
                icon: 'success'
              }).then((result) => {
                window.top.location.reload();
              });
            } 
          }
        })
      });
    }
    
    function fnUpdateEvent(){
      $(function() {
        $.ajax({
          type: 'post',
          url: 'ParoissesCommunaute.php',
          data: ({
            action: 'updateEvent',
            eventid: document.getElementById('eventid').value,
            name: document.getElementById('ename').value,
            date: document.getElementById('edate').value,
            description: document.getElementById('edesc').value,
            color: document.getElementById('ecolor').value,
            icon: document.getElementById('eicon').value,
            global: document.getElementById('eglobal').checked ? 1 : 0
          }),
          success: function(data) {
            if (data.trim() == 'fail') {
              Swal.fire("Une erreur c'est produite", '', 'warning');
            } else if (data.trim() == 'success') {
              Swal.fire({
                title: 'Modification réussi.',
                icon: 'success'
              }).then((result) => {
                window.top.location.reload();
              });
            }else if (data.trim() == 'emptyFields'){
              Swal.fire("Veuillez remplir tous les champs", '', 'warning');
            }
          }
        })
      });
    }

    function fnSaveSchedule(){
      $.ajax({
          type: 'post',
          url: 'ParoissesCommunaute.php',
          data: ({
            action: 'saveSchedule',
            scheduleid: document.getElementById('scheduleid').value,
            schedule: document.getElementById('schedule').innerHTML
          }),
          success: function(data) {
            if (data.trim() == 'fail') {
              Swal.fire("Une erreur c'est produite", '', 'warning');
            } else if (data.trim() == 'success') {
              Swal.fire({
                title: 'Modification réussi.',
                icon: 'success'
              }).then((result) => {
                window.top.location.reload();
              });
            }
          }
        })
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
            jQuery('#btnAdd').show();
            jQuery('#btnDelete').hide();
            jQuery('#btnUpdate').hide();
            jQuery('#ename').val('');
            jQuery('#edesc').val('');
            jQuery('#ecolor').val('');
            jQuery('#eicon').val('');
            jQuery('#edate').val('');
            jQuery('#eglobal').prop('checked', false);
            jQuery('#modal-view-event-add').modal();
          },
          <?php
            }
          ?>
          eventClick: function(event, jsEvent, view) {
            <?php
              if (Admin::isConnected()){
            ?> 
              jQuery('#eventid').val(event.eventid);
              jQuery('#ename').val(event.title);
              jQuery('#edesc').val(event.description);
              jQuery('#ecolor').val(event.className);
              jQuery('#eicon').val(event.icon);
              var global = true;
              if (event.global == 0) {
                global = false;
              }
              jQuery('#eglobal').prop('checked', global);
              var startDate = fnAdaptDate(event.start);
              
              if (event.end == null){
                jQuery('#edate').val(fnFormatDate(new Date(startDate)));
              }else{
                jQuery('#edate').val(fnFormatDate(new Date(startDate)) + ' - ' + fnFormatDate(new Date(event.end)) );
              }
              jQuery('#btnAdd').hide();
              jQuery('#btnDelete').show();
              jQuery('#btnUpdate').show();
              jQuery('#modal-view-event-add').modal();
            <?php
              }else{
            ?>
            jQuery('.event-icon').html("<i class='fa fa-" + event.icon + "'></i>");
            jQuery('.event-title').html(event.title);
            jQuery('.event-body').html(event.description);
            jQuery('.eventUrl').attr('href', event.url);
            jQuery('#modal-view-event').modal();
            <?php
            }
            ?>
          },
        })
      });

    })(jQuery);

  </script>


</head>

<body>
  <div class="content container">
    <?php  
      if (isset($_SESSION['gcommunityid'])){
        echo"<header><h1>";
        echo GetCommunityName();
        echo"</h1></header>";
      }
      ?>
    
    <?php
      ParoisseCommunaute::getScheduleHTML();
    ?>
    
    <?php 
      if (Admin::isConnected()){
        echo '<input type="button" name="btnSaveSchedule" id="btnSaveSchedule" value="Sauvegarder" onclick="fnSaveSchedule()">';
      }
    ?>
    
  <div class="col-md-12">
    <div class="p-2">
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
              <input type="hidden" name="eventid" id="eventid" value="0">
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
              <div class="form-group">
                <label>Global</label>
                <input type="checkbox" class="big-checkbox" name="eglobal" id="eglobal" value="1">
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-primary" id="btnDelete" onclick="fnDeleteEvent();">Supprimer</button>
              <button type="button" class="btn btn-primary" id="btnUpdate" onclick="fnUpdateEvent();">Enregistrer</button>
              <button type="button" class="btn btn-primary" id="btnAdd" onclick="fnAddEvent();">Enregistrer</button>
              <button type="button" class="btn btn-primary" data-dismiss="modal">Fermer</button>
            </div>
          </form>
        </div>
      </div>
    </div>
    </div>

    <!--<div><a>lien feuillet</a></div>
    <div><a>lien Facebook</a></div>

    <div>
      <p>Données</p>
    </div>-->
  </div>
  <?php require_once '../Footer.php';?>
</body>

</html>
