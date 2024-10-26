library(tidyverse)

clean_data <- function() {
  # Chemin d'accès pour le fichier de retard des vols
  file_path <- 'data/raw/Flight_delay.csv'
  print("Chargement des données de vol...")
  df_flight_delay <- read_csv(file_path)   # Charge les données dans un data frame
  print("Données de vol chargées avec succès.")
  
  # Nettoie les données
  print("Nettoyage des données...")
  df_flight_delay <- df_flight_delay %>%
    drop_na() %>%
    select(CarrierDelay, WeatherDelay, NASDelay, SecurityDelay, 
           LateAircraftDelay, Airline, TaxiOut, Origin)
  
  print("Données nettoyées. Enregistrement des données...")
  # Enregistrement des données nettoyées
  write_csv(df_flight_delay, 'data/clean/Flight_Delay_Clean.csv')
  print("Données nettoyées enregistrées avec succès.")
  
  # Chargement des coordonnées des aéroports
  coord_file_path <- 'data/raw/CoordAirports.csv'
  print("Chargement des coordonnées des aéroports...")
  df_coord_airports <- read_csv(coord_file_path) %>%
    select(LOCID, LONGITUDE, LATITUDE) %>%
    mutate(LOCID = str_trim(str_to_upper(LOCID)))
  
  print("Coordonnées des aéroports chargées avec succès.")
  
  # Obtenir les 40 aéroports les plus fréquentés
  print("Obtention des 40 aéroports les plus fréquentés...")
  top_40_airports_id <- df_flight_delay %>%
    count(Origin, sort = TRUE) %>%
    slice(1:40) %>%
    pull(Origin)
  
  print("Les 40 aéroports les plus fréquentés obtenus avec succès.")
  
  # Filtrer les données pour garder seulement les 40 aéroports
  print("Filtrage des données pour les 40 aéroports...")
  df_top_40_airports <- df_flight_delay %>%
    filter(Origin %in% top_40_airports_id) %>%
    mutate(Origin = str_trim(str_to_upper(Origin)))
  
  print("Données filtrées avec succès.")
  
  # Association des coordonnées des aéroports
  print("Association des coordonnées avec les aéroports...")
  df_top_40_with_coords <- df_top_40_airports %>%
    left_join(df_coord_airports, by = c("Origin" = "LOCID"))
  
  print("Coordonnées associées avec succès.")
  
  # Afficher les colonnes de df_top_40_with_coords pour le débogage
  print("Colonnes de df_top_40_with_coords:")
  print(colnames(df_top_40_with_coords))
  
  #df_top_40_with_coords <- df_top_40_with_coords %>%
  #select(-LOCID)
  
  # Calcul du temps de décollage moyen (TaxiOut) par aéroport
  print("Calcul du temps de décollage moyen par aéroport...")
  df_avg_taxiout_by_airport <- df_top_40_with_coords %>%
    group_by(Origin) %>%
    summarise(
      TaxiOut = round(mean(TaxiOut, na.rm = TRUE), 2),
      LATITUDE = first(LATITUDE),
      LONGITUDE = first(LONGITUDE)
    ) %>%
    ungroup()
  
  print("Calcul du temps de décollage moyen effectué.")
  
  # Enregistrement du résultat final
  write_csv(df_avg_taxiout_by_airport, 'data/clean/avg_taxiout_by_airport.csv')
  print("Résultat final enregistré avec succès.")
}

# Appel de la fonction pour exécuter le nettoyage
clean_data()
