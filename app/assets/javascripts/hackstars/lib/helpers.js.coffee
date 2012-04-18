Helpers =
  apiUrlFor: ( resource , action ) -> "#{ Hackstars.api_namespace }/#{ resource }/#{ action }"

  getUrlParameterByName: ( name ) ->
    name    = name.replace( /[\[]/ , "\\\[" ).replace /[\]]/ , "\\\]"
    regexS  = "[\\?&]" + name + "=([^&#]*)"
    regex   = new RegExp( regexS )
    results = regex.exec window.location.search
    if results is null
      ""
    else
      decodeURIComponent results[ 1 ].replace /\+/g , " "

Hackstars = window.Hackstars || Hackstars || {}
Hackstars.Helpers = Helpers
window.Hackstars = Hackstars
