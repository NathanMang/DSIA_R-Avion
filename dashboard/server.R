# server.R

source("dashboard/components/histogram.R")

server <- function(input, output) {
  
  output$histPlot <- renderPlot({
    # Charger les données traitées
    data <- read.csv("data/clean/Flight_Delay_Clean.csv")
    
    # Appeler la fonction pour générer l'histogramme
    create_histogram(data, input$variable)
  })
  
}
