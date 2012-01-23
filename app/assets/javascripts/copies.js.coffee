$ ->
  $(document).bind 'reveal.facebox', ->
    autocompleteUserName()
    showUserFields( $('.reservation').length == 0 )

  $('#check-out .remove-user').live 'click', ->
    $('.user-data').html('')
    showUserFields( true )
    false

  $('.order_user_id').live 'change', ->
    showUserFields( false )
    false

  $('#order_user_id_nil').live 'change', ->
    showUserFields( true )
    false

  showUserFields = (show) ->
    if show
      $('.user-fields').css('display', 'block')
      $('form#check-out .user-fields input').attr('disabled', false)
    else
      $('form#check-out .user-fields input').attr('disabled', true)
      $('.user-fields').css('display', 'none')

  autocompleteUserName = ->
    $('#check-out #user-name').autocomplete
      source: ( request, response ) ->
        $.ajax
          url: "/users"
          dataType: "json"
          data: { autocomplete: request.term}
          success: ( data ) ->
            response( for item in data
              { label: "#{item.name}, #{item.email}", value: item.name, id: item.id }
            )
      minLength: 2
      open: ->
        $( this ).removeClass( "ui-corner-all" ).addClass( "ui-corner-top" )
      close: ->
        $( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" )
      appendTo: '.row.jquery-ui'
      select: ( event, ui ) ->
        console.log(ui.item)
        $.ajax
          url: "/users/#{ui.item.id}/autocomplete"
          dataType: 'script'
