# Module UI

#' @title mod_resultados_ui and mod_resultados_server
#' @description A shiny module.

mod_resultados_ui <- function(id) {
  ns <- NS(id)
  tabItem(
    tabName = "resultados",
    
    fluidRow(
      
      box(textOutput(ns("reactivo")), title = "Reactivo", width = 3),
      box(textOutput(ns("instrumento")), title = "Instrumento", width = 3),
      box(textOutput(ns("loteR1")), title = "Lote R1", width = 2),
      box(textOutput(ns("loteR2")), title = "Lote R2", width = 2),
      box(
        selectInput(ns("worklist"), "Worklist", choices = 1:10),
        actionButton(ns("guardar"), "Guardar"),
        width = 2
      ),
      box(textOutput(ns("selec")), title = "Fila")
    ),
    fluidRow(
      box(DT::DTOutput(ns("results"), height = "800px"), title = "Resultados", width = 12)
    )
  )
}

# Module Server
 
mod_resultados_server <- function(id) {
	moduleServer(id, function(input, output, session) {
	  
	  output$reactivo <- renderText("Reactivo")
	  output$instrumento <- renderText("Instrumento")
	  output$loteR1 <- renderText("Lote R1")
	  output$loteR2 <- renderText("Lote R2")
	  output$results <- DT::renderDT(
	    shinipsum::random_DT(nrow = 20, ncol = 7, selection = list(mode = "single", target = "row"))
	    ) 
	  
	  output$selec <- renderText(input$results_rows_selected)
	  
	  # Returned values?
	  list(
	    fila = reactive(input$results_rows_selected),
	    otro = "0"
	    )
		
	})
}
 
## copy to body.R
# mod_resultados_ui("resultados_ui_1")
 
## copy to app_server.R
# mod_resultados_server("resultados_ui_1")
 
## copy to sidebar.R
# menuItem("displayName",tabName = "resultados",icon = icon("user"))
 
