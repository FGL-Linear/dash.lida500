# Module UI

#' @title mod_curvReac_ui and mod_curvReac_server
#' @description A shiny module.

mod_curvReac_ui <- function(id) {
  ns <- NS(id)
  tabItem(
    tabName = "curvReac",
    fluidRow(
      selectInput(ns("id_reaccion"), "ID Reaccion", choices = 1)
    ),
    fluidRow(
      column(width = 8,
             box(plotOutput(ns("curv_reac")), title = "Curva de reaccion", width = 12)
      ),
      column(width = 4,
             box(DT::DTOutput(ns("datos_abs"), height = "800px"), title = "Datos", width = 12)
      )
    )
  )
}

# Module Server

mod_curvReac_server <- function(id, datos, resultados_id_reaccion) {
  moduleServer(id, function(input, output, session) {
    
    # Observers
    observeEvent( resultados_id_reaccion() , {
      shiny::updateSelectInput(
        inputId = "id_reaccion",
        selected = resultados_id_reaccion(),
        choices = lista_ids())
    })
    
    # Reactives

    lista_ids <- reactive(
      sort(c(datos()$cal_rep$id_reaccion_temp, datos()$resultado$id_reaccion_temp))
    )

    datos_curvas <- reactive(fct_curvReact_data(
      datos = datos(),
      id_reaccion = input$id_reaccion
    ))
    
    #Outputs
    output$id_reaccion <- renderText(input$id_reaccion)
    output$datos_abs <- DT::renderDT(
      DT::datatable(
        datos_curvas() %>%
          dplyr::ungroup() %>% 
          dplyr::select(Primaria, Secundaria, Diferencia),
        options = list(
          lengthMenu= list(c(-1, 10, 25, 50), 
                           c('All', '10', '25', '50'))
        )
      )
    )
    output$curv_reac <- renderPlot(
      fct_curvReact_curve(
        datos_curvas()
      )
    )
	})
}
 
## copy to body.R
# mod_curvReac_ui("curvReac_ui_1")
 
## copy to app_server.R
# mod_curvReac_server("curvReac_ui_1")
 
## copy to sidebar.R
# menuItem("displayName",tabName = "curvReac",icon = icon("user"))
 
