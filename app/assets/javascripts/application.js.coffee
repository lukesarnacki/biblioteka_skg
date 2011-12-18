# This is a manifest file that'll be compiled into including all the files listed below.
# Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
# be included in the compiled file accessible from http://example.com/assets/application.js
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# the compiled file.
#
#= require jquery
#= require jquery_ujs
#= require jquery-ui
#= require bootstrap_alerts
#= require helpers
#= require facebox
#= require copies


$ ->
  $('a[rel*=facebox]').facebox()
  #$('a[rel*=facebox]').live "mousedown", ->
  #  $(this).facebox()

  $(document).bind 'reveal.facebox', ->
    $( "#order_from, #order_to, #order_due" ).datepicker({ dateFormat: 'dd/mm/yy', monthNames: monthNames, dayNamesMin: dayNamesMin, firstDay: 1 })
  $( "#order_from, #order_to, #order_due" ).datepicker({ dateFormat: 'dd/mm/yy', monthNames: monthNames, dayNamesMin: dayNamesMin, firstDay: 1 })
  $(".alert-message").alert()
