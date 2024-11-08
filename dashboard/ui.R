# ui.R  


# Chargement des fichiers
source("dashboard/pages/home_page.R")       # Fichier du contenu de la page d'accueil
source("dashboard/pages/histogram_page.R")  # Fichier du contenu de la page des histogrammes
source("dashboard/pages/map_page.R")        # Fichier du contenu de la page de la carte

# Définition de l'interface utilisateur
ui <- navbarPage("",
                 
                 # Ajout de CSS pour centrer, augmenter la police et mettre en bleu le texte des onglets
                 tags$head(
                   tags$style(HTML("
                     .navbar {
                       font-size: 18px;         /* Taille de police augmentée */
                       display: flex;
                       justify-content: center;
                     }
                     .navbar-nav > li > a {
                       font-size: 18px;         /* Taille de police augmentée */
                       text-align: center;      /* Centrer le texte */
                       font-weight: bold;       /* Texte en gras (facultatif) */
                     }
                   "))
                 ),
                 
                 # Création de la page d'accueil
                 tabPanel("Accueil", homePage()),
                 
                 # Création de la page des histogrammes
                 tabPanel("Histogramme", histogramPage()),
                 
                 # Création de la page de la carte
                 tabPanel("Carte", mapPage())
)
