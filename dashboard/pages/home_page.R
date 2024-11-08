# home_page.R


library(shiny)

# Définition du contenu de la page d'accueil
create_home_layout <- function() {
  
  # Conteneur principal de la page d'accueil
  tags$div(
    
    # En-tête
    tags$h1("Bienvenue sur le Dashboard de Retards Aériens",
            style = "text-align: center; color: #007BFF; margin-bottom: 20px; font-family: Arial, sans-serif;
                     animation: fadeIn 1s ease-in-out;"),
    
    # Description
    tags$div(
      "Ce dashboard interactif vous permet d'analyser les retards des vols aériens en fonction de plusieurs critères.
       Explorez les données pour mieux comprendre les impacts des conditions météorologiques, des compagnies aériennes 
       et d'autres facteurs sur les retards de vol. Utilisez les fonctionnalités ci-dessus pour naviguer à travers 
       les différentes visualisations et statistiques.",
      style = "text-align: center; color: #555; font-size: 18px; margin-bottom: 30px; line-height: 1.6;
               max-width: 800px; margin: 0 auto; padding: 10px; background-color: #f0f8ff; border-radius: 8px;
               box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); transition: transform 0.3s;"
    ),
    
    # Image illustrative
    tags$img(src = "../images/download1.jpg",
             style = "display: block; margin: 50px auto; width: 50%; border-radius: 50px;
                      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); transition: transform 0.3s;"),
    
    # Footer
    tags$div("© 2024 - Dashboard de Retards Aériens - Mang Nathan & Ludovic Viellard",
             style = "text-align: center; color: #777; font-size: 14px; margin-top: 50px; font-family: Arial, sans-serif;"),
    
    # Style du conteneur principal
    style = "background-color: #F8F9FA; padding: 20px; border-radius: 8px;
             box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1); max-width: 900px; margin: 0 auto; animation: fadeIn 1s ease-in-out;"
  )
}
