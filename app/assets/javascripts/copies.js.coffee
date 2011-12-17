$ ->
  $(document).bind 'reveal.facebox', ->
    $('#new_order').css('display', 'none')
    $('#lend_copy').css('display', 'inline')

    $('#lend_copy').click ->
      $('#new_order').slideDown('slow')
      $(this).slideUp('slow')
      false

    $('#new_order .cancel').click ->
      $(this).parents('#new_order').slideUp('slow')
      $('#lend_copy').slideDown('slow')
      false
