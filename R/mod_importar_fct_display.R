fct_loadData <- function(reaction_disk){
  file <- "C:\\Users\\fguerrero.LINEAR\\Desktop\\Analyzer.mdb"
  
  importr::import_lida500_db(reaction_disk = reaction_disk, file = file) %>%
    importr::wrangle_lida500_db() %>%
    importr::imp_dm(instrument = "Lida 500")
}
