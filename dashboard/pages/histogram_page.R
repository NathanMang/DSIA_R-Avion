# histogram_page.R

histogramPage <- function() {
  fluidPage(
    titlePanel("Histogramme"),
    sidebarLayout(
      sidebarPanel(
        selectInput("variable", "Sélectionner un type de retard :", 
                    choices = c("Compagnie" = "CarrierDelay", "Météo" = "WeatherDelay",
                                "Système national d\'aviation" = "NASDelay",
                                "Sécurité" = "SecurityDelay",
                                "Retard de l'avion" = "LateAircraftDelay")
        ),
      ),
      mainPanel(
        p("histPlot")
      )
    )
  )
}