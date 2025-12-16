library(tidyverse)
library(skimr)
library(janitor)

df <- readRDS("data/mental_health.rds") |> clean_names()

# Aperçu général -----------------------------------------------------------

glimpse(df)
skim(df)


# Q1 : Accès au traitement -----------------------------------------------

# Tableau de proportions: traitement selon antécédents familiaux
q1_tab_family_treatment <- df |>
  count(family_history, treatment) |>
  group_by(family_history) |>
  mutate(prop = n / sum(n)) |>
  ungroup()

q1_tab_family_treatment

# Graphique: proportion traitée selon antécédents familiaux
plot_q1_family_treatment <- df |>
  filter(!is.na(family_history), !is.na(treatment)) |>
  ggplot(aes(x = family_history, fill = treatment)) +
  geom_bar(position = "fill") +
  scale_y_continuous(labels = scales::percent_format(accuracy = 1)) +
  labs(
    x = "Antécédents familiaux de troubles mentaux",
    y = "Proportion",
    fill = "Traitement",
    title = "Traitement reçu selon les antécédents familiaux"
  ) +
  theme_minimal()

plot_q1_family_treatment


# Q2 : Interférence avec le travail --------------------------------------

# Distribution de work_interfere
q2_tab_work_interfere <- df |>
  count(work_interfere) |>
  mutate(prop = n / sum(n))

q2_tab_work_interfere

plot_q2_work_interfere <- df |>
  filter(!is.na(work_interfere)) |>
  ggplot(aes(x = work_interfere)) +
  geom_bar(fill = "#3182bd") +
  labs(
    x = "Interférence de la santé mentale avec le travail",
    y = "Nombre de réponses",
    title = "Distribution de l'interférence avec le travail"
  ) +
  theme_minimal()

plot_q2_work_interfere


# Q2 : Interférence et climat de l'entreprise ----------------------------

plot_q2_benefits <- df |>
  filter(!is.na(work_interfere), !is.na(benefits)) |>
  ggplot(aes(x = benefits, fill = work_interfere)) +
  geom_bar(position = "fill") +
  scale_y_continuous(labels = scales::percent_format(accuracy = 1)) +
  labs(
    x = "Bénéfices de santé mentale offerts",
    y = "Proportion",
    fill = "Interférence",
    title = "Interférence avec le travail selon la présence de bénéfices"
  ) +
  theme_minimal()

plot_q2_benefits


# Sauvegarde éventuelle des objets pour réutilisation dans les Rmd ------

save(q1_tab_family_treatment,
     q2_tab_work_interfere,
     plot_q1_family_treatment,
     plot_q2_work_interfere,
     plot_q2_benefits,
     file = "data/eda_objects.RData")
