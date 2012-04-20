class ListConstructor
  construct: ->
    request = $.post Hackstars.Helpers.apiUrlFor( 'list' , 'sync' )
    request.success ->
      alert 'done'

window.ListConstructor = ListConstructor
