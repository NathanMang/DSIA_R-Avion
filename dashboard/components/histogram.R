# histogram.R


library(ggplot2)

# Fonction de création de l'histograme dynamique
create_histogram <- function(Flight_Delay_Clean, input) {
  
  # Filtrer les données 
  data_filtered <- Flight_Delay_Clean %>%
    filter(.data[[input]] > 15) %>%           # Pour des retards supérieurs à 15 min
    count(Airline, name = "Occurrences") %>%  # Compte les occurrences par compagnie
    arrange(desc(Occurrences))                # Trie les données par occurrences décroissantes
  
  # Création du graphique
  ggplot(data_filtered, aes(x = reorder(Airline, -Occurrences), y = Occurrences)) +
    geom_bar(stat = "identity",colour="black", fill="purple") +                       # Style des barres
    ggtitle(paste("Distribution des retards par compagnie aérienne (", input, ")")) + # Titre
    xlab("Compagnies Aériennes") +                                                    # Titre de l'axe des x
    ylab("Nombre d'occurrences")+                                                     # Titre de l'axe des y 
    theme(axis.text.x = element_text(angle = 45, hjust = 1))                          # Inclinaison des étiquettes de l'axe x
    
  
}
  

