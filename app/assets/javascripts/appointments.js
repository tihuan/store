$(function () {
  $('#hour_picker').hide();
  $('#hidden_hour_div').hide();
 });

var disabledDays = [];

$(function () {
  $('.schedules_dates').map(function () {
    disabledDays.push(this.id);
  }).get().join(',');
});

function unavailableDays(date) {
  var y = date.getFullYear(),
       m = date.getMonth(),
       d = date.getDate();

 if ($.inArray(y + '-' + (m + 1) + '-' + d, disabledDays) != -1 || new Date() > date) {
  return [false];
 }
 return [true];
};

$(function () {
  var currentTime = new Date()
  var month = currentTime.getMonth();
  var day = currentTime.getDate();
  var year = currentTime.getFullYear();

// Show available hours when clicking hour box in #create-appointment-form
  $('#appointment_hour').on('click', function() {
    if ($('#datepicker').val() !== '') {
      prevPage();
    }
  });

// Add appointment hour to #appointment_form after selecting time
  $('.cal_table2').on('click', 'td', function() {
    nextPage($(this).attr('class'), $(this).text());
    $('#submit_form').show();
  })

// Add service id to #appointment_form after selecting service
  // $('#appointment_service_id').on('click', 'option', function() {
  //   console.log("CLICKED!");
  //   $('#final_service_name h2').text($(this).text());
  //   $('#appointments_service_id').val($(this).val());
  // });

  $('#datepicker').datepicker({
    minDate: new Date(year, month, day),
    dateFormat: 'yy-mm-dd',
    onSelect: function(dateText) {
      setFinalDate = dateText
      hideHourPicker();
      findHours(setFinalDate);
      $('th.selected_date').empty();
      $('th.selected_date').append('Date Chosen:' + ' ' + (setFinalDate));
      pageNo = '2';
    }
  });
});

function findHours(chosen_date){
  $.ajax({
    url: '/appointments',
    cache: false,
    dataType: 'json',
    data: { matched_date:chosen_date },
    success: function(resp){
      $('#hour_picker').hide();
      var hours_string = resp;
      $('.cal_table2 td').removeAttr('style');
      for (var j in hours_string) {
        (final_array = '\.'+ hours_string[j]);
        $(final_array).hide();
      }
      $('#hour_picker').show();
    }
  });
};

function nextPage(hour, id){
  $('#hour_picker').hide();
  setDateAndHour(hour, id);
  pageNo = '3';
  return true;
};

function prevPage() {
  setFinalHour = '';
  hideHourPicker();
  $('#hour_picker').show();
  pageNo = '2'
};

function hideHourPicker() {
  $('#appointment_hour').val('');
  $('#submit_form').hide();
}

function setDateAndHour(hour, id) {
  $('#appointment_hour').val(id);
  // $('#final_date h2').text(setFinalDate);
  // $('#final_hour h2').text(id);
  // $('#appointments_hour').val(hour);
  // $('#appointments_date').val(setFinalDate);
}
