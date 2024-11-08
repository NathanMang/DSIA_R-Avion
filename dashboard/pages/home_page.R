# home_page.R


library(shiny)

# Définition du contenu de la page d'accueil
homePage <- function() {
  fluidPage(
    
    # En-tête
    h1("Bienvenue sur le Dashboard des Retards Aériens",
            style = "text-align: center; color: #007BFF; margin-bottom: 20px; font-family: Arial, sans-serif;"),
    
    # Description
    div(
      "Ce dashboard interactif vous permet d'analyser les retards des vols aériens en fonction de plusieurs critères.
       Explorez les données pour mieux comprendre les impacts des conditions météorologiques, des compagnies aériennes 
       et d'autres facteurs sur les retards de vol. Utilisez les fonctionnalités ci-dessus pour naviguer à travers 
       les différentes visualisations et statistiques.",
      style = "text-align: center; color: #555; font-size: 18px; margin-bottom: 100px; line-height: 1.6;
               max-width: 75%; margin: 0 auto; padding: 10px; background-color: #f0f8ff; border-radius: 8px;
               box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);"
    ),
    
    # Image illustrative
    div(
      img(src = "avion.png", style = "width: 50%; height: auto;"),
      style =  "display: flex; justify-content: center;"
    ),
    
    # Footer
    div("© 2024 - Dashboard des Retards Aériens - Mang Nathan & Ludovic Viellard",
             style = "text-align: center; color: #777; font-size: 14px; margin-top: 50px; font-family: Arial, sans-serif;"),
    
    # Style du conteneur principal
    style = "background-color: #F8F9FA; padding: 20px; border-radius: 8px;
             box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1); max-width: 100%; margin: 0 auto;"
  )
}
