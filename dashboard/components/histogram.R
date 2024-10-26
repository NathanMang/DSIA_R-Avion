# histogram.R

library(ggplot2)

create_histogram <- function(data, input) {
  
  # Filtre les données pour des retards supérieurs à 15 min
  data_filtered <- data[data[[input]]>15,]
  
  ggplot(data_filtered, aes(x=Airline)) +
    geom_bar(colour="black", fill="purple") +
    ggtitle(paste("Distribution des retards par compagnie aérienne (", input, ")")) +
    xlab("Compagnies Aériennes") +
    ylab("Nombre d'occurrences")
}