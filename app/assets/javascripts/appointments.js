$(function () {
  $('#appointment_form').hide();
  $('#hour_picker').hide();
  $('#hidden_hour_div').hide();
  $('#cal_previous2').hide();
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

  $("#datepicker").datepicker({
    minDate: new Date(year, month, day),
    dateFormat: 'yy-mm-dd',
    onSelect: function(dateText) {
      setFinalDate = dateText
      $('#cal_previous2').hide();
      $('#appointment_form').hide();
      findHours(setFinalDate);
      $('#appointment_hour').val('');
      $("th.selected_date").empty();
      $("th.selected_date").append("Date Chosen:" + " " + (setFinalDate));
      pageNo = '2';
    }
  });
});

function findHours(chosen_date){
  $.ajax({
    url: "/appointments",
    cache: false,
    dataType: "json",
    data: { matched_date:chosen_date },
    success: function(resp){
      $('#hour_picker').hide();
      var hours_string = resp;
      $(".cal_table2 td").removeAttr("style");
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
  $("#appointment_form").show();
  $('#cal_previous2').show();
  document.getElementById('subData').style.display = 'block'
  $('#final_date h2').text(setFinalDate);
  $('#final_hour h2').text(id);
  $('#appointment_hour').val(id);
  $('#appointments_hour').val(hour);
  $('#schedules_date').val(setFinalDate);
  pageNo = '3';
  return true;
};

function prevPage() {
  setFinalHour = "";
  $('#appointment_form').hide();
  $('#cal_previous2').hide();
  $("#hour_picker").show();
  pageNo = '2'
};
