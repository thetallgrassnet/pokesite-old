editor = new MediumEditor '.editable'

$('.editable').mediumInsert
  editor: editor,
  addons:
    embeds:
      oembedProxy: 'https://iframely.thetallgrass.net/oembed?iframe=1'

$('.editable').on 'input propertychange', ->
  $('#post_' + $(this).data('field-id')).val $(this).html()
