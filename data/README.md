# Jeu de données : Santé mentale dans le secteur technologique

## Description
Ce jeu de données contient les réponses à un sondage sur la santé mentale des employés travaillant dans le secteur technologique.  
Il inclut des informations démographiques, le statut de traitement pour santé mentale, et des mesures sur l'interférence de la santé mentale avec le travail.

## Source
Kaggle : [Mental Health in Tech Survey](https://www.kaggle.com/datasets/osmi/mental-health-in-tech-survey)

## Dimensions
- **Observations (lignes)** : 1259  
- **Variables (colonnes)** : 27  

## Types de variables
- **Catégorielles** : `gender`, `country`, `work_interfere`, `self_employed`, `family_history`, etc.  
- **Numériques discrètes** : `age`, `num_employees`, etc.  
- **Numériques continues** : aucune variable strictement continue, mais `age` peut être traitée comme numérique continue.

## Remarques
- Les colonnes ont été **nettoyées** avec `janitor::clean_names()`.  
- Les valeurs manquantes sont présentes et devront être prises en compte lors de l'analyse.
