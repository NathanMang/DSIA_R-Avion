# histogram.R

library(ggplot2)

histogram <- function(input, output) {
  output$histPlot <- renderPlot({
    ggplot(data.frame(value = faithful[[input$variable]]), aes(x = value)) +
      geom_histogram(binwidth = 5, fill = "skyblue", color = "white") +
      labs(title = paste("Histogramme de la variable :", input$variable),
           x = input$variable, y = "Fréquence")
  })
}