# Module UI
 
#' @title mod_curvReac_ui and mod_curvReac_server
#' @description A shiny module.
 
mod_curvReac_ui <- function(id) {
	ns <- NS(id)
	tabItem(
		tabName = "curvReac",
		fluidRow(
		  box(textOutput(ns("id_reaccion")), title = "id_reaccion", width = 3),
		  selectInput(ns("id_reaccion"), "ID Reaccion", choices = 1:100),
		  box(plotOutput(ns("curv_reac")), title = "Curva de calibracion", width = 6),
		  box(DT::DTOutput(ns("datos_abs"), height = "800px"), title = "Replicados", width = 6)
		)
	)
}
 
# Module Server
 
mod_curvReac_server <- function(id, datos, resultados_id_reaccion) {
	moduleServer(id, function(input, output, session) {
	  
	  output$datos_abs <- DT::renderDT(shinipsum::random_DT(nrow = 20, ncol = 7))
	  output$curv_reac <- renderPlot(shinipsum::random_ggplot())
    output$id_reaccion <- renderText(input$id_reaccion)
    
    observeEvent( resultados_id_reaccion() , {
    shiny::updateSelectInput(
      inputId = "id_reaccion",
      selected = resultados_id_reaccion())
    })
    
	})
}
 
## copy to body.R
# mod_curvReac_ui("curvReac_ui_1")
 
## copy to app_server.R
# mod_curvReac_server("curvReac_ui_1")
 
## copy to sidebar.R
# menuItem("displayName",tabName = "curvReac",icon = icon("user"))
 
