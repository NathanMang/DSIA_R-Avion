# histogram_page.R

histogramPage <- function() {
  fluidPage(
    titlePanel("Histogramme"),
    sidebarLayout(
      sidebarPanel(
        selectInput("variable", "Sélectionner un type de retard :", 
                    choices = c("Compagnie (CarrierDelay)" = "CarrierDelay",
                                "Météo (WeatherDelay)" = "WeatherDelay",
                                "Système national d\'aviation (NASDelay)" = "NASDelay",
                                "Sécurité (SecurityDelay)" = "SecurityDelay",
                                "Retard de l'avion (LateAircraftDelay)" = "LateAircraftDelay")
        ),
      ),
      mainPanel(
        plotOutput("histPlot")
      )
    )
  )
}