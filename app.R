library(shiny)

source("dashboard/ui.R")
source("dashboard/server.R")

shinyApp(ui = ui, server = server)