# scripts/01_load_glimpse.R
# 1) Installer packages si besoin (décommenter si nécessaire)
# install.packages(c("tidyverse","skimr","janitor"))

library(tidyverse)
library(skimr)
library(janitor)

# Chemin du fichier (assure-toi que le csv est dans /data/mental_health.csv)
f <- "data/mental_health.csv"

if(!file.exists(f)){
  stop("Le fichier data/mental_health.csv est introuvable. Place le CSV dans /data puis relance.")
}

df <- read_csv(f, guess_max = 10000, show_col_types = FALSE)

# Aperçu rapide
glimpse(df)
cat("\n--- SKIMR SUMMARY ---\n")
print(skim(df))

# Nettoyage de base des noms de colonnes
df <- df %>% clean_names()

# Sauvegarde rds pour réutilisation rapide
saveRDS(df, "data/mental_health.rds")
message("Fini : data/mental_health.rds créé.")
