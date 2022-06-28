fct_loadData <- function(reaction_disk){
  file <- "C:\\Users\\fguerrero.LINEAR\\Desktop\\Analyzer.mdb"
  
  importr::import_lida500_db(reaction_disk = reaction_disk, file = file) %>%
    importr::wrangle_lida500_db() %>%
    importr::imp_dm(instrument = "Lida 500")
}

fct_resultados_tabla <- function(datos, react_selec){
  x <- datos %>% 
  dm::dm_select_tbl(resultado, serie, calibracion) %>%
    dm::dm_squash_to_tbl(start = resultado)
  y <- x %>%
    dplyr::filter(.data$reactivo == react_selec) %>%
    dplyr::select(reactivo, instrumento, id_reaccion_temp, id_muestra, absorbancia, concentracion, resultado.fecha_hora) %>%
    dplyr::rename(fecha_hora = resultado.fecha_hora)
}