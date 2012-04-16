class ListPage extends Hackstars.GenericPage
  init: -> @checkForHackstarsList()

  checkForHackstarsList: ->
    checker = ( new ListChecker ).check()
    checker.success -> alert 'wut'

Hackstars.registerPage 'List' , ListPage
