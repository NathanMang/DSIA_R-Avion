# app.R


library(shiny)

# Chargement des fichiers
source("dashboard/ui.R")      # Fichier contenant la définition de l'interface utilisateur de l'application.
source("dashboard/server.R")  # Fichier contenant la logique serveur
source("data/clean_data.R")   # Fichier contenant le script du nettoyage des données



clean_data()  # Appelle la fonction pour nettoyer les données


# Initialise et lance l'application Shiny en utilisant les objets `ui` et `server`.
shinyApp(ui = ui, server = server)  # `ui` et `server` sont respectivement l'interface utilisateur et la logique serveur de l'application