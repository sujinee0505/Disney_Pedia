<!DOCTYPE html>
<html lang='en'>
  <head>
    <meta charset='utf-8' />
<link href='${pageContext.request.contextPath}/resources/css/calendar.css' rel='stylesheet' />
<script src='${pageContext.request.contextPath}/resources/js/calendar.js'></script>
<script type='text/javascript'>

document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');

  var calendar = new FullCalendar.Calendar(calendarEl, {
    googleCalendarApiKey: 'AIzaSyDt2foDKtTjia-bsV5h4ctnwuYIqgJPLzE',
    eventSources: [
      {
          googleCalendarId: 'k86dg99t6pdrgserbldi2oa6h0@group.calendar.google.com',
          className: 'test',
          color: 'black',
          textColor: 'black' 
        }
    ]
  });
  calendar.render();
});
</script>
<style>
#calendar{
   width:60%;
   margin:20px auto;
}
</style>
  </head>
  <body>
    <div id='calendar'></div>
  </body>
</html>