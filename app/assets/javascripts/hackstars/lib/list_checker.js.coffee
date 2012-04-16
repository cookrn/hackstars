class ListChecker
  check: ->
    $.ajax
      type: 'GET'
      url:  Hackstars.Helpers.apiUrlFor 'lists' , 'show'

window.ListChecker = ListChecker
