Hackstars =
  api_namespace: '/api/v1'
  current_page: null
  pages:   {}

  changePage: ( page_name , params ) ->
    @current_page = page = new @pages[ page_name ]( params )
    page.load()

  registerPage: ( page , o ) -> @pages[ page ] = o

Hackstars.Helpers =
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

window.Hackstars = Hackstars
