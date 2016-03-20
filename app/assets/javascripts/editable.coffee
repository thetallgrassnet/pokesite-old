editor = new MediumEditor '.editable'

$('.editable').on 'input propertychange', ->
  $('#post_' + $(this).data('field-id')).val $(this).html()
