# Module UI
 
#' @title mod_importar_ui and mod_importar_server
#' @description A shiny module.
 
mod_importar_ui <- function(id) {
	ns <- NS(id)
	tabItem(
		tabName = "importar",
		fluidRow(
		  selectInput(ns("worklist"), "Worklist", choices = 1:10),
		  actionButton(ns("boton_lida500"), label = "Importar desde Lida 500"),
		  actionButton(ns("boton_rds"), label = "Cargar .rds")
		)
	)
}
 
# Module Server
 
mod_importar_server <- function(id) {
	moduleServer(id, function(input, output, session) {
	  
	  # Reactives 
	  
	  datos <- function(){readRDS(here::here("data/example.RDS"))}
	  
	  datos <- eventReactive( input$boton_lida500, {
	   fct_loadData( reaction_disk = input$worklist ) })

	  datos <- eventReactive( input$boton_rds, {
	    filepath <- file.choose()
	    readRDS(file = filepath) })
	  
	  # Output del modulo
	  list(
	    datos = reactive(datos())
	  )
	})
}
 
## copy to body.R
# mod_importar_ui("importar_ui_1")
 
## copy to app_server.R
# mod_importar_server("importar_ui_1")
 
## copy to sidebar.R
# menuItem("displayName",tabName = "importar",icon = icon("user"))
 
