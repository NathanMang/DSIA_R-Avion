# server.R

library(shiny)
library(readr)
library(ggplot2)

source("dashboard/components/histogram.R")
source("dashboard/components/map.R")

server <- function(input, output) {
  
  output$histPlot <- renderPlot({
    
    # Charger les données traitées
    Flight_Delay <- read.csv("data/clean/Flight_Delay_Clean.csv")
    
    # Appeler la fonction pour générer l'histogramme
    create_histogram(Flight_Delay_Clean, input$variable)
    
  })
  
  output$map <- renderLeaflet({
    
    avg_taxiout_by_airport <- read_csv('data/clean/avg_taxiout_by_airport.csv')
    
    # Appeler la fonction pour générer la map
    create_map(avg_taxiout_by_airport)
  })
  
}
