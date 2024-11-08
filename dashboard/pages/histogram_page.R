# histogram_page.R

library(shiny)
library(ggplot2)

# Définition du contenu de la page d'accueil
histogramPage <- function() {
  fluidPage(
    
    # Titre de la page
    titlePanel("Dashboard des Retards Aériens"),
    
    # Disposition de la page avec une barre latérale et une zone principale
    sidebarLayout(
      
      # Barre latérale
      sidebarPanel(
        
        # Curseurs pour définir la plage de retard d'arrivée
        sliderInput("min_delay", "Retard minimum (minutes) :", min = 0, max = 120, value = 15, step = 5),
        sliderInput("max_delay", "Retard maximum (minutes) :", min = 15, max = 120, value = 30, step = 5),
        
       
        # Menu déroulant pour sélectionner le type de retard
        selectInput("variable", "Sélectionner un type de retard :", 
                    choices = c("Compagnie (CarrierDelay)" = "CarrierDelay",
                                "Météo (WeatherDelay)" = "WeatherDelay",
                                "Système national d'aviation (NASDelay)" = "NASDelay",
                                "Sécurité (SecurityDelay)" = "SecurityDelay",
                                "Retard de l'avion (LateAircraftDelay)" = "LateAircraftDelay"))
      ),
      
      # Zone principale de la page
      mainPanel(
        plotOutput("histPlot1"),       # Affiche l'histogramme dynamique pour les retards d'arrivée
        textOutput("histPlotText1"),   
        
        tags$hr(style = "border-top: 1px solid #888;"), # Ligne de séparation pour bien distinguer les sections
        
        br(), br(),                    # Ajoute des espaces entre les graphiques
        
        plotOutput("histPlot2"),       # Affiche l'histogramme dynamique en fonction du type de retard
        textOutput("histPlotText2"),   
        
        tags$hr(style = "border-top: 1px solid #888;"), # Ligne de séparation pour bien distinguer les sections
        
        br(), br(),                    # Ajoute des espaces entre les graphiques
        
        plotOutput("histPlot3"),       # Affiche l'histogramme statique des types de retards
        textOutput("histPlotText3")    
      )
    ),
    
    # Footer
    div("© 2024 - Dashboard des Retards Aériens - Mang Nathan & Ludovic Viellard", 
        style = "text-align: center; color: #777; font-size: 14px; margin-top: 50px")
  )
}
