# Module UI

#' @title mod_calibracion_ui and mod_calibracion_server
#' @description A shiny module.

mod_calibracion_ui <- function(id) {
  ns <- NS(id)
  tabItem(
    tabName = "calibracion",
    fluidRow(
      box(plotOutput(ns("cal_curv")), title = "Curva de calibracion", width = 12),
      box(DT::DTOutput(ns("cal_rep"), height = "800px"), title = "Resultados", width = 12)
    )
  )
}

# Module Server
 
mod_calibracion_server <- function(id, datos, reac_selec) {
	moduleServer(id, function(input, output, session) {

	  datos_calibracion <- reactive(datos() %>% fct_calibracion_data(reac_selec()))
	  output$cal_rep <- DT::renderDT(
	    DT::datatable(
	      datos_calibracion()$replicados, selection = list( mode = "single", selected = 1)
	    )
	  )
	  
	  output$cal_curv <- renderPlot(fct_calibracion_curve(datos_calibracion()))
	})
}
 
## copy to body.R
# mod_calibracion_ui("calibracion_ui_1")
 
## copy to app_server.R
# mod_calibracion_server("calibracion_ui_1")
 
## copy to sidebar.R
# menuItem("displayName",tabName = "calibracion",icon = icon("user"))
 
