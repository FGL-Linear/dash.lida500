
fct_formatoExcel <- function(datos){
list(
  resutlados = datos %>% 
    dm::dm_squash_to_tbl(start = resultado, serie, calibracion),
  calibracion = datos$cal_rep,
  curvas = datos$curva
)
}
