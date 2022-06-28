sidebar <- function() {
  dashboardSidebar(
    sidebarMenu(id = "sidebarid",
      menuItem("Importar",tabName = "importar",icon = icon("user")),
      menuItem("Resultados",tabName = "resultados",icon = icon("user")),
      menuItem("Calibracion",tabName = "calibracion",icon = icon("user")),
      menuItem("Curvas de reaccion",tabName = "curvReac",icon = icon("user")),
      menuItem("Guardar",tabName = "guardar",icon = icon("user"))
      
    )
  )
}
