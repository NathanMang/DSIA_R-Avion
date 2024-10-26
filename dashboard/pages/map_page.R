# map_page.R

mapPage <- function() {
  fluidPage(
    titlePanel("Carte interactive"),
    leafletOutput("map")
  )
}