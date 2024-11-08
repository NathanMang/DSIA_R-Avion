library(ggplot2)
library(dplyr)

# Fonction pour créer l'histogramme dynamique en R
create_histogram_arrival_delay <- function(data, min_delay, max_delay) {
  
  # Filtrer les données pour ne garder que les retards dans la plage définie
  data_filtered <- data %>%
    filter(ArrDelay >= min_delay, ArrDelay < max_delay) %>%
    count(ArrDelay, name = "Occurrences") %>%  # Compter les occurrences pour chaque valeur de retard
    filter(Occurrences > 1000) %>%             # Ne conserver que les retards avec plus de 1000 occurrences
    arrange(ArrDelay)                          # Trier par ordre croissant de retard
  
  # Créer l'histogramme
  ggplot(data_filtered, aes(x = ArrDelay, y = Occurrences)) +
    geom_bar(stat = "identity", color = "black", fill = "purple") +
    ggtitle(paste("Distribution des retards d'arrivée (", min_delay, "à", max_delay, "minutes)")) +
    xlab("Retard à l'arrivée (minutes)") +
    ylab("Nombre d'occurrences") +
    theme_minimal()
}
