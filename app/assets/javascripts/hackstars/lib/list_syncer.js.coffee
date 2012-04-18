class ListConstructor
  construct: ->
    request = $.post Hackstars.Helpers.apiUrlFor( 'list' , 'sync' )
    request.complete ->
      alert 'done'

window.ListConstructor = ListConstructor
