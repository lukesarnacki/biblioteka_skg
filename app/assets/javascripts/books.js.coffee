$ ->
  $('.add-new-copy').live 'click', ->
    $.ajax
      url: '/books/1440/add_new_copy'
      type: 'POST'
      data: { form: $('form.book .copies').serializeArray() }
    false
