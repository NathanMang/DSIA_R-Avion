# Dashboard d'Analyse des Retards Aériens

## User Guide
Pour déployer et utiliser ce dashboard sur une autre machine, suivez ces étapes :

1. **Prérequis** :
    - Installez les packages nécessaires en exécutant le code suivant dans la console R :
     ```R
     install.packages(c("shiny", "ggplot2", "dplyr", "tidyverse"))
     ```

2. **Téléchargement** :
   - Clonez ou téléchargez ce dépôt sur votre machine.

3. **Exécution** :
   - Ouvrez le fichier `app.R` dans RStudio.
   - Exécutez le script en cliquant sur le bouton "Run App" en haut à droite de l'éditeur de script.

## Data


Le dashboard utilise plusieurs ensembles de données, incluant :

- **avg_taxiout_by_airport** : Données nettoyées contenant des informations sur les coordonnées géographiques des 40 aéroports américains ayant le plus de vols en 2019.
  
- **Flight_Delay_clean** : Données nettoyées des retards de vols, comprenant des informations sur les compagnies aériennes, les types de retard, et le délai nécessaire pour qu'un avion décolle après l'embarquement complet.

- **CoordAirports** : Données brutes utilisées pour récupérer les coordonnées géographiques des aéroports américains.

- **Flight_delay** : Données brutes utilisées pour le nettoyage des données de retards.


## Developer Guide








## Rapport d'analyse




## Copyright
Je déclare sur l'honneur que le code fourni a été produit par nous-même.