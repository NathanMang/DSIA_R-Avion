# map_page.R
library(leaflet)

mapPage <- function() {
  fluidPage(
    titlePanel("Carte interactive"),
    leafletOutput("map")
  )
}