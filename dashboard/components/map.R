# Chargement des bibliothèques nécessaires
library(tidyverse)
library(leaflet)
library(htmlwidgets)

# Fonction pour ajouter un marqueur à la carte
add_marker <- function(row, map_obj) {
  
  # Définir la couleur du marqueur en fonction du délai
  taxi_out <- row$TaxiOut
  color <- case_when(
    taxi_out < 15 ~ "green",
    taxi_out < 20 ~ "yellow",
    taxi_out < 30 ~ "orange",
    TRUE ~ "red"
  )
  
  # Ajouter un marqueur à la carte
  map_obj <- addCircleMarkers(
    map = map_obj,
    lng = row$LONGITUDE,
    lat = row$LATITUDE,
    radius = taxi_out / 2,  # Taille du cercle proportionnelle au temps de taxiOut
    color = color,
    fill = TRUE,
    fillColor = color,
    fillOpacity = 0.6,
    label = paste(row$Origin, ": ", taxi_out, " min", sep = ""),
    popup = paste(row$Origin, ": ", taxi_out, " min", sep = "")
  )
  
  return(map_obj)
}

# Fonction pour créer la carte
create_map <- function() {
  
  # Récupérer les données
  avg_taxiout_by_airport <- read_csv('data/clean/avg_taxiout_by_airport.csv')
  
  # Créer une carte centrée sur les États-Unis
  map_center <- c(39.8283, -98.5795)  # Coordonnées du centre des États-Unis
  m <- leaflet() %>%
    setView(lng = map_center[2], lat = map_center[1], zoom = 4) %>%
    addTiles()  # Ajouter le fond de carte
  
  # Ajouter tous les marqueurs
  for (i in 1:nrow(avg_taxiout_by_airport)) {
    m <- add_marker(avg_taxiout_by_airport[i, ], m)
  }
  # Ajouter un titre à la carte
  title_html <- '
    <div style="position: fixed; top: 10px; left: 50%; transform: translateX(-50%); 
                 background-color: white; border-radius: 4px; padding: 5px; 
                 box-shadow: 0 0 5px rgba(0,0,0,0.5); z-index: 9999;">
      <strong>Temps moyen nécessaire pour décoller après l\'embarquement total par aéroport</strong>
    </div>
  '
  m <- m %>% addControl(html = title_html, position = "topleft", layerId = "title")
  # Ajouter une légende
  legend_html <- '
    <div style="position: fixed; bottom: 50px; left: 50px; width: 160px; height: auto;
                 border:2px solid grey; z-index:9999; font-size:14px; background-color:white;
                 padding:10px; opacity: 0.9;">
      <b>Légende</b><br>
      <i style="background:green;width:20px;height:20px;border-radius:50%;display:inline-block;"></i> Moins de 15 min<br>
      <i style="background:yellow;width:20px;height:20px;border-radius:50%;display:inline-block;"></i> 15-20 min<br>
      <i style="background:orange;width:20px;height:20px;border-radius:50%;display:inline-block;"></i> 20-30 min<br>
      <i style="background:red;width:20px;height:20px;border-radius:50%;display:inline-block;"></i> Plus de 30 min<br>
    </div>
  '
  m <- m %>% addControl(html = legend_html, position = "bottomleft", layerId = "legend")
  
  # Sauvegarde la carte sous format HTML
  saveWidget(m, file = 'dashboard/map.html', selfcontained = TRUE)
}

# Exemple d'utilisation de la fonction
create_map()  # Décommenter pour créer la carte
