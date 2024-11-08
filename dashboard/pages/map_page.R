# map_page.R


library(shiny)
library(leaflet)

# Définition du contenu de la page de la carte
mapPage <- function() {
  fluidPage(
    
    # Titre de la page
    titlePanel(""),
    
    # Sous-titre de la page
    h2("Temps moyen pour décoller après embarquement total par aéroport (TaxiOut)",
       style = "text-align: center; color: #0056b3; margin-bottom: 30px;"),
    
    # Affiche la carte associée à l'output 'map'
    leafletOutput("map", height = "600px"),
    
    # Description
    div("Cette carte présente les 40 aéroports américains ayant le plus de vols en 2019. 
        Explorez les temps moyens de décollage après l'embarquement pour mieux comprendre les 
        performances des différents aéroports. 
        Utilisez la carte interactive pour visualiser les données géographiques et identifier les tendances.",
        style = "text-align: center; color: #555; font-size: 16px; margin: 0 auto; width: 80%;"),
    
    # Footer
    div("© 2024 - Dashboard des Retards Aériens - Mang Nathan & Ludovic Viellard", 
        style = "text-align: center; color: #777; font-size: 14px; margin-top: 50px;"),
    
    # Style de la page
    tags$style(HTML("body { background-color: #F8F9FA; padding: 20px; }"))
  )
  
  
}
