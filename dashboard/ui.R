# ui.R  


# Chargement des fichiers
source("dashboard/pages/home_page.R")       # Fichier du contenu de la page d'accueil
source("dashboard/pages/histogram_page.R")  # Fichier du contenu de la page des histogrammes
source("dashboard/pages/map_page.R")        # Fichier du contenu de la page de la carte

# Définition de l'interface utilisateur
ui <- navbarPage("Mon Dashboard",
                 
                 # Création de la page d'accueil
                 tabPanel("Home", homePage()),
                 
                 # Création de la page des histogrammes
                 tabPanel("Histogram", histogramPage()),
                 
                 # Création de la page de la carte
                 tabPanel("Map", mapPage())
)
