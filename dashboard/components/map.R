# map.R

library(leaflet)

map <- function(input, output) {
  output$map <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      setView(lng = -99.1332, lat = 19.4326, zoom = 5)  # Centrée sur Mexico
  })
}