// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs

/* CORE PLUGINS - Metronic theme */

//= require jquery-migrate-1.2.1.min
//= require jquery-ui-1.10.3.custom.min
//= require bootstrap.min
//= require bootstrap-hover-dropdown.min
//= require jquery.slimscroll.min
//= require jquery.blockui.min
//= require jquery.cokie.min
//= require jquery.uniform.min
//= require bootstrap-switch.min
//= require ion.rangeSlider.min

//= require jquery.dataTables.min
//= require dataTables.bootstrap

/* additional Metronic */

//= require metronic
//= require layout

/* Add to HomeScreen Widget */

//= require add-to-homescreen

/* AMCharts */
/* many of these are broken due to latest version of AMCharts */

//= require amcharts
/* require amexport */
//= require export
/* require canvg */
/* require filesaver */
/* require jspdf */
/* require jspdf.plugin.addimage */
/* require rgbcolor */
//= require serial
//= require pie

//= require ammap_amcharts_extension
//= require usaLow
//= require worldLow

/* date pickers */

//= require moment.min
//= require bootstrap-datepicker
//= require bootstrap-datepaginator.min

//= require ups_missing_invoices

/* page specific */

/*require customer_dashboard*/
//= require drilldown_reports
//= require selenium_clusters


jQuery(document).ready(function() {
  Metronic.init(); // init metronic core components
  Layout.init();   // init current layout
  //Demo.init();   // init demo features
});

