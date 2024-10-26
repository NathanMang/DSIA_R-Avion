library(shiny)

source("dashboard/ui.R")
source("dashboard/server.R")
source("data/clean_data.R")


clean_data()

shinyApp(ui = ui, server = server)