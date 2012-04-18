class ListPage extends Hackstars.GenericPage
  init: ->
    @registerEvents()
    new $.Deferred

  registerEvents: ->
    $( '#first-sync-btn' ).on 'click' , =>
      if confirm( 'Warning -- this will delete any existing list named like "HackStars" !!! Are you sure?' )
        @sync()

  sync: -> ( new ListConstructor ).construct()

Hackstars.registerPage 'List' , ListPage
