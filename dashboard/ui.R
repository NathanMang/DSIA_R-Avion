# ui.R
library(dplyr)

# Importer le contenu de chaque page
source("dashboard/pages/home_page.R")
source("dashboard/pages/histogram_page.R")
source("dashboard/pages/map_page.R")

# Définir l'interface utilisateur
ui <- navbarPage("Mon Dashboard",
                 
                 # Page d'accueil
                 tabPanel("Home", homePage()),
                 
                 # Page Histogramme
                 tabPanel("Histogram", histogramPage()),
                 
                 # Page Cartographie
                 tabPanel("Map", mapPage())
)
