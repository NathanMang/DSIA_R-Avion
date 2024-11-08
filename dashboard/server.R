# server.R

library(shiny)
library(readr)
library(ggplot2)
library(dplyr)

# Chargement des fichiers
source("dashboard/components/histogram_arr_delay.R")  # Histogramme dynamique pour le retard à l'arrivée
source("dashboard/components/histogram_airline.R")    # Histogramme dynamique par type de retard
source("dashboard/components/histogram_type_delay.R") # Histogramme statique pour les types de retards
source("dashboard/components/map.R")                  # Carte

# Définition de la logique du serveur
server <- function(input, output) {
  
  # Histogramme dynamique pour le retard à l'arrivée
  output$histPlot1 <- renderPlot({
    
    # Charger les données
    Flight_Delay <- read.csv("data/clean/Flight_Delay_Clean.csv")
    
    # Appliquer la plage de retard sélectionnée par les curseurs
    min_delay <- input$min_delay
    max_delay <- input$max_delay
    
    # Générer l'histogramme avec la plage de retard sélectionnée
    create_histogram_arrival_delay(Flight_Delay, min_delay, max_delay)
  })
  
  # Histogramme dynamique par type de retard (en fonction de la sélection de l'utilisateur)
  output$histPlot2 <- renderPlot({
    
    # Charger les données
    Flight_Delay <- read.csv("data/clean/Flight_Delay_Clean.csv")
    
    # Générer l'histogramme en fonction du type de retard sélectionné
    create_histogram_airline(Flight_Delay, input$variable)  # `input$variable` correspond au type de retard choisi
  })
  
  # Histogramme statique pour la distribution des types de retards
  output$histPlot3 <- renderPlot({
    
    # Charger les données
    Flight_Delay <- read.csv("data/clean/Flight_Delay_Clean.csv")
    
    # Générer l'histogramme statique
    create_histogram_type_delay(Flight_Delay)
  })
  
  # Texte pour l'histogramme de la plage de retards d'arrivée
  output$histPlotText1 <- renderText({
    paste("Cet histogramme montre la distribution des retards d'arrivée pour les vols ayant des retards entre",
          input$min_delay, "et", input$max_delay, "minutes, avec plus de 1000 occurrences.")
  })
  
  # Texte pour l'histogramme dynamique par type de retard
  output$histPlotText2 <- renderText({
    paste("Cet histogramme montre le nombre d'occurrences des retards aériens en fonction de la compagnie et du type de retard sélectionné. 
          Le dataset contient uniquement des vols ayant subi des retards en 2019, et pour cette visualisation, seuls les vols ayant eu des retards supérieurs à 15 minutes ont été retenus. 
          Cela signifie que chaque barre représente le nombre de retards significatifs pour chaque compagnie aérienne. 
          Explorez les différentes catégories de retards pour mieux comprendre les impacts sur les horaires des vols. 
          Utilisez le menu déroulant pour changer le type de retard affiché.")
  })
  
  # Texte pour l'histogramme statique
  output$histPlotText3 <- renderText({
    paste("Cet histogramme illustre le nombre d'occurrences pour chaque type de retard aérien, en mettant l'accent sur les retards supérieurs à 15 minutes. 
    Cet histogramme a été créé pour permettre une visualisation claire et rapide des retards aériens par type, afin de mieux comprendre les différentes causes des retards. 
    En observant les données, on peut noter une disparité significative entre les types de retards.")
  })
  
  # Carte des retards moyens par aéroport
  output$map <- renderLeaflet({
    
    # Charger les données
    avg_taxiout_by_airport <- read_csv('data/clean/avg_taxiout_by_airport.csv')
    
    # Générer la carte
    create_map(avg_taxiout_by_airport)
  })
}
