fct_resultados_tabla <- function(datos_importar, react_selec){
  x <- datos_importar %>% 
  dm::dm_select_tbl(resultado, serie, calibracion) %>%
    dm::dm_squash_to_tbl(start = resultado)
  y <- x %>%
    dplyr::filter(.data$reactivo == react_selec) %>%
    dplyr::select(reactivo, instrumento, id_reaccion_temp, id_muestra, absorbancia, concentracion, resultado.fecha_hora) %>%
    dplyr::rename(fecha_hora = resultado.fecha_hora)
}