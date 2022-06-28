# Module UI

#' @title mod_resultados_ui and mod_resultados_server
#' @description A shiny module.

mod_resultados_ui <- function(id) {
  ns <- NS(id)
  tabItem(
    tabName = "resultados",
    
    fluidRow(
      selectInput(ns("worklist"), "Worklist", choices = 1:10, width = "80px"),
      box(textOutput(ns("reactivo")), title = "Reactivo", width = 3),
      box(textOutput(ns("instrumento")), title = "Instrumento", width = 3),
      box(textOutput(ns("loteR1")), title = "Lote R1", width = 2),
      box(textOutput(ns("loteR2")), title = "Lote R2", width = 2),

    ),
    fluidRow(
      box(DT::DTOutput(ns("results"), height = "800px"), title = "Resultados", width = 12)
    )
  )
}

# Module Server
 
mod_resultados_server <- function(id) {
	moduleServer(id, function(input, output, session) {
	  
	 # Reactives 

	  datos <- reactive(fct_loadData(reaction_disk = input$worklist))
	  id_reaccion <- eventReactive(
	    input$results_rows_selected , {
	      tryCatch(
	        error = function(cnd) {1},
	      datos()$resultado$id_reaccion_temp[[input$results_rows_selected]]
	      )
	    })


	  # Outputs
	  output$id_reaccion <- renderText( id_reaccion() )
	  output$reactivo <- renderText( datos()$calibracion$reactivo )
	  output$instrumento <- renderText( datos()$calibracion$instrumento)
	  output$loteR1 <- renderText("Pendiente")
	  output$loteR2 <- renderText("Pendiente")
	  output$results <- DT::renderDT(
	    DT::datatable(
	      datos()$resultado, selection = list( mode = "single", selected = 1)
	      )
	    )
	

	  # Output del modulo
	  list(
	    datos = reactive(datos()),
	    id_reaccion = reactive(id_reaccion())
	    )
		
	})
}
 
## copy to body.R
# mod_resultados_ui("resultados_ui_1")
 
## copy to app_server.R
# mod_resultados_server("resultados_ui_1")
 
## copy to sidebar.R
# menuItem("displayName",tabName = "resultados",icon = icon("user"))
 
