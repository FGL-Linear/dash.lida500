fct_curvReact_data <- function(datos, id_reaccion){
  datos$curva %>%
    dplyr::filter(
      .data$id_reaccion_temp == id_reaccion
    ) %>%
    dplyr::mutate(
      abs1 = abs1 %>% as.integer() %>% tidyr::replace_na(0),
      abs2 = abs2 %>% as.integer() %>% tidyr::replace_na(0),
      Diferencia = abs1 - abs2
    ) %>% 
    dplyr::rename(
      Primaria = abs1,
      Secundaria = abs2
    ) 
}


fct_curvReact_curve <- function(datos){
  datos %>% 
    tidyr::pivot_longer(cols = c("Primaria", "Secundaria", "Diferencia"), names_to = "Lambda", values_to = "Abs") %>% 
    ggplot2::ggplot(mapping = ggplot2::aes(x = ciclo, y = Abs, color = Lambda)) +
    ggplot2::geom_line()
}
