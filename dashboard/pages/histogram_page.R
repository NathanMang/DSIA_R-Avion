# histogram_page.R


library(shiny)
library(ggplot2)

# Définition du contenu de la page d'accueil
histogramPage <- function() {
  fluidPage(
    
    # Titre de la page
    titlePanel("Histogramme"),
    
    # Disposition de la page avec une barre latérale et une zone principale
    sidebarLayout(
      # Barre latérale
      sidebarPanel(
        # Menu déroulant pour sélectionner le type de retard
        selectInput("variable", "Sélectionner un type de retard :", 
                    choices = c("Compagnie (CarrierDelay)" = "CarrierDelay",
                                "Météo (WeatherDelay)" = "WeatherDelay",
                                "Système national d'aviation (NASDelay)" = "NASDelay",
                                "Sécurité (SecurityDelay)" = "SecurityDelay",
                                "Retard de l'avion (LateAircraftDelay)" = "LateAircraftDelay")
        )
      ),
      
      # Zone principale de la page
      mainPanel(
        plotOutput("histPlot"),       # Affiche l'histogramme dynamique associé à l'output histplot
        textOutput("histPlotText1"),  # Affiche le texte associé à l'output histplotText1
        plotOutput("histPlot2"),      # Affiche l'histogramme statique associé à l'output histplot2
        textOutput("histPlotText2"),  # Affiche le texte associé à l'output histPlotText2
      )
    )
  )
}

