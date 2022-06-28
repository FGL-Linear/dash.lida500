
app_server <- function(input, output, session) {
  # pins::board_register() # connect to pin board if needed
  
  # Pruebo de inicializar el output del modulo de resultados al inicio de la app.
  out_resultados <- list(
    fila = 0
  )
  #
  
  out_resultados <- mod_resultados_server("resultados_ui_1")
  mod_calibracion_server("calibracion_ui_1", out_resultados$datos, out_resultados$reac_selec)
  mod_curvReac_server("curvReac_ui_1", out_resultados$datos, out_resultados$id_reaccion)
}
