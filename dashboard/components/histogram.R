# histogram.R

library(ggplot2)



create_histogram <- function(Flight_Delay_Clean, input) {
  
  # Filtrer les données pour des retards supérieurs à 15 min
  data_filtered <- Flight_Delay_Clean %>%
    filter(.data[[input]] > 15) %>%
    count(Airline, name = "Occurrences") %>%  # Compter les occurrences par compagnie
    arrange(desc(Occurrences))                 # Trier les données par occurrences décroissantes
  
  ggplot(data_filtered, aes(x = reorder(Airline, -Occurrences), y = Occurrences)) +
    geom_bar(stat = "identity",colour="black", fill="purple") +
    ggtitle(paste("Distribution des retards par compagnie aérienne (", input, ")")) +
    xlab("Compagnies Aériennes") +
    ylab("Nombre d'occurrences")+
    theme(axis.text.x = element_text(angle = 45, hjust = 1)) # Inclinaison des étiquettes de l'axe x pour la lisibilité
    
  
}
  

