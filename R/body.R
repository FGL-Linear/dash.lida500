body <- function() {
  dashboardBody(
    theme_dashboard(),
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "custom.css"),
      tags$script(src = "custom.js")
    ),
    tabItems(
      #Add ui module here (e.g., uiOne("one"))
      mod_resultados_ui("resultados_ui_1"),
      mod_calibracion_ui("calibracion_ui_1"),
      mod_curvReac_ui("curvReac_ui_1"),
      mod_guardar_ui("guardar_ui_1"),
      mod_importar_ui("importar_ui_1")
    )
  )
}
