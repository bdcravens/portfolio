// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

jQuery(document).ready(function() {

$('#drilldown-daterangepicker').daterangepicker({
  opens: (Metronic.isRTL() ? 'right' : 'left'),
  startDate: moment().subtract('days', 29),
  endDate: moment(),
  //minDate: '01/01/2012',
  //maxDate: '12/31/2014',
  dateLimit: {
      days: 360
  },
  showDropdowns: true,
  showWeekNumbers: true,
  timePicker: false,
  timePickerIncrement: 1,
  timePicker12Hour: true,
  ranges: {
      //'Today': [moment(), moment()],
      //'Yesterday': [moment().subtract('days', 1), moment().subtract('days', 1)],
      'Last 7 Days': [moment().subtract('days', 6), moment()],
      'Last 30 Days': [moment().subtract('days', 29), moment()],
      'Last 60 Days': [moment().subtract('days', 59), moment()],
      'Last 90 Days': [moment().subtract('days', 89), moment()],
      'This Month': [moment().startOf('month'), moment().endOf('month')],
      'Last Month': [moment().subtract('month', 1).startOf('month'), moment().subtract('month', 1).endOf('month')]
  },
  buttonClasses: ['btn btn-sm btn-circle'],
  applyClass: ' blue',
  cancelClass: 'default',
  format: 'MM/DD/YYYY',
  separator: ' to ',
  locale: {
      applyLabel: 'Apply',
      fromLabel: 'From',
      toLabel: 'To',
      customRangeLabel: 'Custom Range',
      daysOfWeek: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],
      monthNames: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
      firstDay: 1
  }
},
function (start, end) {
    $('#drilldown-daterangepicker span').html(start.format('MMM D, YYYY') + ' - ' + end.format('MMM D, YYYY'));
}
);


$('#drilldown-daterangepicker span').html(moment().subtract('days', 29).format('MMM D, YYYY') + ' - ' + moment().format('MMM D, YYYY'));
$('#drilldown-daterangepicker').show();

});
