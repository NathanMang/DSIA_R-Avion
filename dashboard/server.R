# server.R


library(shiny)
library(readr)
library(ggplot2)

# Chargement des fichiers
source("dashboard/components/histogram.R")  # Fichier contenant la fonction de création de l'histogramme dynamique
source("dashboard/components/histogram2.R") # Fichier contenant la fonction de création de l'histogramme statique
source("dashboard/components/map.R")        # Fichier contenant la fonction de création de la carte

# Définition de la logique du serveur
server <- function(input, output) {
  
  # Créer l'output 'histplot' qui contient l'histogramme dynamique
  output$histPlot <- renderPlot({
    
    # Charge nos données nettoyées pour l'histogramme
    Flight_Delay <- read.csv("data/clean/Flight_Delay_Clean.csv")
    
    # Génère l'histogramme dynamique
    create_histogram(Flight_Delay, input$variable)  # Prend en paramètre l'input 'variable', qui correspond au type de délai dans notre menu déroulant
    
  })
  
  # Créer l'output 'histplot2' qui contient l'histogramme statique
  output$histPlot2 <- renderPlot({
    
    # Charge nos données nettoyées pour l'histogramme
    Flight_Delay <- read.csv("data/clean/Flight_Delay_Clean.csv")
    
    # Génère l'histogramme statique
    create_histogram2(Flight_Delay)
    
  })
  
  # Texte de l'histogramme dynamique
  output$histPlotText1 <- renderText({
    paste("Cet histogramme montre le nombre d'occurrences des retards aériens en fonction de la compagnie et du type de retard sélectionné. 
          Le dataset contient uniquement des vols ayant subi des retards en 2019, et pour cette visualisation, seuls les vols ayant eu des retards supérieurs à 15 minutes ont été retenus. 
          Cela signifie que chaque barre représente le nombre de retards significatifs pour chaque compagnie aérienne. 
          Explorez les différentes catégories de retards pour mieux comprendre les impacts sur les horaires des vols. 
          Utilisez le menu déroulant pour changer le type de retard affiché.")
  })
  
  # Texte de l'histogramme statique
  output$histPlotText2 <- renderText({
    paste("Cet histogramme illustre le nombre d'occurrences pour chaque type de retard aérien, en mettant l'accent sur les retards supérieurs à 15 minutes. 
    Cet histogramme a été créé pour permettre une visualisation claire et rapide des retards aériens par type, afin de mieux comprendre les différentes causes des retards. \n 
    En observant les données, on peut noter une disparité significative entre les types de retards.")
  })
  
  # Créer l'output 'map' qui contient la carte
  output$map <- renderLeaflet({
    
    # Charge nos données nettoyées pour la carte
    avg_taxiout_by_airport <- read_csv('data/clean/avg_taxiout_by_airport.csv')
    
    # Génère la carte
    create_map(avg_taxiout_by_airport)
  })
  
}
