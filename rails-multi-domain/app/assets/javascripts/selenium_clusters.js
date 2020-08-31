$(document).ready(function() {
  grid_sessions = function(grid_server) {
    alert(grid_server);
  }
  $('.refresh_grid_details').on('click', function() {
    alert($(this).data('server'));
    return false;
  });
});