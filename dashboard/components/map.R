# map.R


# Chargement des bibliothèques nécessaires
library(tidyverse)
library(leaflet)      # Librairie pour créer des cartes interactives
library(htmlwidgets)  # Permet d'intégrer des objets interactifs dans des widgets HTML

# Fonction pour ajouter un marqueur à la carte
add_marker <- function(row, map_obj) {
  
  # Définir la couleur du marqueur en fonction du délai
  taxi_out <- row$TaxiOut # Récupération de la valeur
  color <- case_when(
    taxi_out < 15 ~ "green",
    taxi_out < 20 ~ "yellow",
    taxi_out < 30 ~ "orange",
    TRUE ~ "red"
  )
  
  # Ajouter un marqueur à la carte
  map_obj <- addCircleMarkers(
    map = map_obj,          # Notre carte
    lng = row$LONGITUDE,    # Coordonnée longitude du marqueur
    lat = row$LATITUDE,     # Coordonnée latitude du marqueur
    radius = taxi_out / 2,  # Taille du cercle proportionnelle au temps de taxiOut
    color = color,          # Couleur du marqueur
    fill = TRUE,            # Remplissage du marqueur
    fillColor = color,      # Couleur de remplissage
    fillOpacity = 0.6,      # Transparence du marqueur
    label = paste(row$Origin, ": ", taxi_out, " min", sep = ""),  # Label du marqueur
    popup = paste(row$Origin, ": ", taxi_out, " min", sep = "")   # Popup du marqueur
  )
  
  return(map_obj) # Retourne la carte mise à jour avec le marqueur
}

# Fonction pour créer la carte
create_map <- function(data) {
  
  # Créer une carte centrée sur les États-Unis
  map_center <- c(39.8283, -98.5795)  # Coordonnées du centre des États-Unis
  m <- leaflet() %>%
    setView(lng = map_center[2], lat = map_center[1], zoom = 4) %>%
    addTiles()  # Ajouter le fond de carte
  
  # Ajouter tous les marqueurs
  for (i in 1:nrow(data)) {
    m <- add_marker(data[i, ], m)
  }

  # Créer une légende
  legend_html <- '
    <div style="position: fixed; bottom: 50px; left: 40px; width: 160px; height: auto;
                 border:2px solid grey; z-index:9999; font-size:14px; background-color:white;
                 padding:10px; opacity: 0.9;">
      <b>Légende</b><br>
      <i style="background:green;width:20px;height:20px;border-radius:50%;display:inline-block;"></i> Moins de 15 min<br>
      <i style="background:yellow;width:20px;height:20px;border-radius:50%;display:inline-block;"></i> 15-20 min<br>
      <i style="background:orange;width:20px;height:20px;border-radius:50%;display:inline-block;"></i> 20-30 min<br>
      <i style="background:red;width:20px;height:20px;border-radius:50%;display:inline-block;"></i> Plus de 30 min<br>
    </div>
  '
  
  # Ajoute la légende
  m <- m %>% addControl(html = legend_html, position = "bottomleft", layerId = "legend")

}

