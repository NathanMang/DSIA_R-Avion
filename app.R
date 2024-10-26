library(shiny)

source("dashboard/ui.R")
source("dashboard/server.R")
source("data/clean_data.R")
source("dashboard/components/map.R")


clean_data()
create_map()

shinyApp(ui = ui, server = server)