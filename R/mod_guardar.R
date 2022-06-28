# Module UI
 
#' @title mod_guardar_ui and mod_guardar_server
#' @description A shiny module.
 
mod_guardar_ui <- function(id) {
	ns <- NS(id)
	tabItem(
		tabName = "guardar",
		fluidRow(
		  actionButton(inputId = ns("save"), label = "Guardar"),
		  actionButton(inputId = ns("exportExcel"), label = "Exportar Excel")
		)
	)
}
 
# Module Server
 
mod_guardar_server <- function(id, datos, reac_selec) {
	moduleServer(id, function(input, output, session) {
	  
	  datos_exportar <- reactive(datos())
	  observeEvent(
	    input$save,
	    {
	      path <- choose.dir(caption = "Seleccionar carpeta")
	      filename <- paste0(
	        path,
	        "\\",
	        lubridate::now() %>%
	          as.character() %>%
	          stringr::str_replace_all(pattern = ":", replacement = "_"),
	        " resultados_lida500.RDS"
	      )
	      saveRDS(datos_exportar(), file = filename)
	      #readr::write_excel_csv2(x = curvas, file = filename)
	      
	    }
	  )
	  
	  observeEvent(
	    input$exportExcel,
	    {
	      path <- choose.dir(caption = "Seleccionar carpeta")
	      filename <- paste0(
	        path,
	        "\\",
	        lubridate::now() %>%
	          as.character() %>%
	          stringr::str_replace_all(pattern = ":", replacement = "_"),
	        " resultados_lida500.xlsx"
	      )
	      writexl::write_xlsx(fct_formatoExcel(datos_exportar()), path = filename)
	     
	      
	      #readr::write_excel_csv2(x = curvas, file = filename)
	      
	    }
	  )
	})
}
 
## copy to body.R
# mod_guardar_ui("guardar_ui_1")
 
## copy to app_server.R
# mod_guardar_server("guardar_ui_1")
 
## copy to sidebar.R
# menuItem("Guardar",tabName = "guardar",icon = icon("user"))
 
