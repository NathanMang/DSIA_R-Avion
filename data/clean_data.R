library(tidyverse)

clean_data <- function() {
  # Chemin d'accès pour le fichier de retard des vols
  file_path <- 'data/raw/Flight_delay.csv'
  print("Chargement des données de vol...")
  df_flight_delay <- read_csv(file_path)   # Charge les données dans un data frame

  
  # Nettoie les données
  
  df_flight_delay <- df_flight_delay %>%
    drop_na() %>%
    select(CarrierDelay, WeatherDelay, NASDelay, SecurityDelay, 
           LateAircraftDelay, Airline, TaxiOut, Origin)
  
 
  # Enregistrement des données nettoyées
  write_csv(df_flight_delay, 'data/clean/Flight_Delay_Clean.csv')
 
  
  # Chargement des coordonnées des aéroports
  coord_file_path <- 'data/raw/CoordAirports.csv'
 
  df_coord_airports <- read_csv(coord_file_path) %>%
    select(LOCID, LONGITUDE, LATITUDE) %>%
    mutate(LOCID = str_trim(str_to_upper(LOCID)))
  

  
  # Obtenir les 40 aéroports les plus fréquentés

  top_40_airports_id <- df_flight_delay %>%
    count(Origin, sort = TRUE) %>%
    slice(1:40) %>%
    pull(Origin)
  

  
  # Filtrer les données pour garder seulement les 40 aéroports
 
  df_top_40_airports <- df_flight_delay %>%
    filter(Origin %in% top_40_airports_id) %>%
    mutate(Origin = str_trim(str_to_upper(Origin)))
  

  
  # Association des coordonnées des aéroports

  df_top_40_with_coords <- df_top_40_airports %>%
    left_join(df_coord_airports, by = c("Origin" = "LOCID"))

  # Calcul du temps de décollage moyen (TaxiOut) par aéroport

  df_avg_taxiout_by_airport <- df_top_40_with_coords %>%
    group_by(Origin) %>%
    summarise(
      TaxiOut = round(mean(TaxiOut, na.rm = TRUE), 2),
      LATITUDE = first(LATITUDE),
      LONGITUDE = first(LONGITUDE)
    ) %>%
    ungroup()

  
  # Enregistrement du résultat final
  write_csv(df_avg_taxiout_by_airport, 'data/clean/avg_taxiout_by_airport.csv')
  print("Résultat final enregistré avec succès.")
}

# Appel de la fonction pour exécuter le nettoyage
clean_data()
