fct_calibracion_data <- function(datos){
  replicados <- datos$cal_rep %>% 
    dplyr::select(reactivo, id_reaccion_temp, id_muestra, absorbancia, valor, fecha_hora)
  
  tipo <- datos$calibracion$tipo
  
  list(
    replicados = replicados,
    tipo = tipo
  )
  
}

fct_calibracion_curve <- function(datos_calibracion){
  
  # Escoge el método de calibracion para la curva. Por ahora solo he configurado
  # la regresión lineal (tipo 2), pero tendria que buscar como hacer splines y 
  # logits
  if (datos_calibracion$tipo == 2) {
    method <- "lm"
    formula <- "y ~ x"
  } else {
    method <- "loess"
    formula <- "y ~ x"
  }
  
  datos_calibracion$replicados %>% 
    dplyr::rename(Absorbancia = absorbancia, Valor = valor) %>% 
    ggplot2::ggplot(mapping = ggplot2::aes(x = Valor, y = Absorbancia)) +
    ggplot2::geom_smooth(method = method) +
    ggplot2::geom_point()
  
}