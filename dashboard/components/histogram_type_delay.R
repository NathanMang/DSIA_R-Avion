# historgam2.R


library(tidyverse)

# Fonction de création de l'histogramme statique 
create_histogram_type_delay <- function(Flight_Delay_Clean) {
  
  # Colonnes choisies
  delay_types <- c('CarrierDelay', 'WeatherDelay', 'NASDelay', 'SecurityDelay', 'LateAircraftDelay')
  
  # Filtre les données
  data_filtered <- Flight_Delay_Clean %>%
    select(all_of(delay_types)) %>%               # Sélectionne uniquement les colonnes choisies
    pivot_longer(cols = everything(), 
                 names_to = "Type de Retard", 
                 values_to = "Délai") %>%         # Transformer les colonnes en format long
    filter(Délai > 15) %>%                        # Filtrer les retards supérieurs à 15 min
    count(`Type de Retard`, name = "Occurrences") # Compte les occurences par retard
  
  # Création du graphique
  ggplot(data_filtered, aes(x = reorder(`Type de Retard`, -Occurrences), y = Occurrences)) +
    geom_bar(stat = "identity",colour="black", fill="purple") +   # Génère un histogramme avec des barres violettes et des bordures noires
    ggtitle("Nombre d'occurrences pour chaque type de retard") +  # Titre du graphique
    xlab("Type de Retard") +                                      # Titre de l'axe des x
    ylab("Nombre d'occurrences")+                                 # Titre de l'axe des y
    theme(axis.text.x = element_text(angle = 45, hjust = 1),      # Inclinaison des étiquettes de l'axe x pour la lisibilité
          plot.title = element_text(hjust = 0.5))                 # Centre le titre
  
  
}