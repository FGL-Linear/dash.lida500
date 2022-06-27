# Module UI

#' @title mod_calibracion_ui and mod_calibracion_server
#' @description A shiny module.

mod_calibracion_ui <- function(id) {
  ns <- NS(id)
  tabItem(
    tabName = "calibracion",
    fluidRow(
      box(plotOutput(ns("cal_curv")), title = "Curva de calibracion", width = 6),
      box(DT::DTOutput(ns("cal_rep"), height = "800px"), title = "Replicados", width = 6)
    )
  )
}

# Module Server
 
mod_calibracion_server <- function(id) {
	moduleServer(id, function(input, output, session) {
	  output$cal_rep <- DT::renderDT(shinipsum::random_DT(nrow = 20, ncol = 7))
	  output$cal_curv <- renderPlot(shinipsum::random_ggplot())
	})
}
 
## copy to body.R
# mod_calibracion_ui("calibracion_ui_1")
 
## copy to app_server.R
# mod_calibracion_server("calibracion_ui_1")
 
## copy to sidebar.R
# menuItem("displayName",tabName = "calibracion",icon = icon("user"))
 
