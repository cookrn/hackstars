Hackstars =
  api_namespace: '/api/v1'
  current_page: null
  pages:   {}

  changePage: ( page_name , params ) ->
    @current_page = page = new @pages[ page_name ]( params )
    page.load()

  registerPage: ( page , o ) -> @pages[ page ] = o

window.Hackstars = Hackstars
