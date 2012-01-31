# This is a manifest file that'll be compiled into including all the files listed below.
# Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
# be included in the compiled file accessible from http://example.com/assets/application.js
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# the compiled file.
#
#= require jquery
#= require jquery_ujs
#= require jquery-ui
#= require bootstrap-alerts
#= require bootstrap-dropdown
#= require helpers
#= require facebox
#= require copies
#= require books


$ ->
  $('a[rel*=facebox]').facebox()

  initializeJqueryUi = ->
    $( "#order_from, #order_to, #order_due" ).datepicker({ dateFormat: 'dd/mm/yy', monthNames: monthNames, dayNamesMin: dayNamesMin, firstDay: 1 })
    $('#ui-datepicker-div').wrap('<div class="jquery-ui" />')

  initializeJqueryUi()
  $(document).bind 'reveal.facebox', ->
    initializeJqueryUi()
    $( "#accordion" ).accordion({ collapsible: true, active: false, autoHeight: false })

  $(".alert-message").alert()
  $('#topbar').dropdown()

