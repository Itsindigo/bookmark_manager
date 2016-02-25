$( document ).ready(function() {
  $('#select-city').submit(function(event) {
    event.preventDefault();
    var city = $('#current-city').val();
    $.get('http://api.openweathermap.org/data/2.5/weather?q=' + city + '&appid=a3d9eb01d4de82b9b8d0849ef604dbed&units=metric', function(data) {
      $('#current-temperature').text(data.main.temp);
      $('#current-location').text(data.name);
      $('#current-longitude').text(data.coord.lat);
      $('#current-lattitude').text(data.coord.lon);
    });
  });
});
