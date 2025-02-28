rm(list = ls())  # Supprime tout !

setwd("C:/Users/teo11/PROJETS/analyse_portefeuille_investissement/data")

# Charger la bibliothèque qui permet de gérer les données
library(tidyverse)  # Charger la bibliothèque

# Lire le fichier CSV
data <- read.csv("bourse.csv")

# Afficher les premières lignes
head(data)

# Vérifier la structure des données
str(data)

# Voir s'il y a des valeurs manquantes
sum(is.na(data))

# Transformer la colonne Date en vrai format de date
data$Date <- as.Date(data$Date, format="%Y-%m-%d")

# Trier les données par Date et Ticker
data <- data %>% arrange(Date, Ticker)

# Installer et charger ggplot2 pour faire des graphes
library(ggplot2)

# Créer un graphique des prix des actions
ggplot(data, aes(x=Date, y=Prix, color=Ticker)) +
  geom_line() +
  labs(title="Évolution du prix des actions", x="Date", y="Prix") +
  theme_minimal()

# Créer le dossier visualisations 
dir.create("visualisations")

# Enregistrer le graphique 
ggsave("visualisations/prix_evolution.png", width = 8, height = 5, dpi = 300)

# Calcul des rendements quotidiens
data <- data %>%
  group_by(Ticker) %>%
  mutate(Rendement = (Prix - dplyr::lag(Prix)) / dplyr::lag(Prix)) %>%
  drop_na()

# Voir les nouvelles données
head(data)

ggplot(data, aes(x=Date, y=Rendement, color=Ticker)) +
  geom_line() +
  labs(title="Rendements quotidiens des actions", x="Date", y="Rendement") +
  theme_minimal()

ggsave("visualisations/rendements_quotidiens_des_actions.png", width = 8, height = 5, dpi = 300)

# Calcul de la volatilité (écart-type des rendements)
data_volatilite <- data %>%
  group_by(Ticker) %>%
  summarise(Volatilite = sd(Rendement, na.rm=TRUE))

# Afficher la volatilité
print(data_volatilite)

# Hypothèse d'un taux sans risque de 0.5%
taux_sans_risque <- 0.005

# Calcul du ratio de Sharpe
sharpe_ratio <- data %>%
  group_by(Ticker) %>%
  summarise(Mean_Rendement = mean(Rendement, na.rm=TRUE),
            Sharpe = (Mean_Rendement - taux_sans_risque) / sd(Rendement, na.rm=TRUE))

# Afficher le ratio de Sharpe
print(sharpe_ratio)

allocation <- sharpe_ratio %>%
  mutate(Allocation = Sharpe / sum(Sharpe) * 100)

# Afficher l’allocation optimale
print(allocation)

# Créer un dataframe pour le camembert
df_pie <- data.frame(
  Action = c("Apple (AAPL)", "Microsoft (MSFT)", "Tesla (TSLA)"),
  Allocation = c(50.6, 33.7, 15.6)
)

# Ajouter une colonne pour afficher les pourcentages
df_pie$label <- paste0(round(df_pie$Allocation, 1), "%")

# Créer un camembert avec les pourcentages affichés
ggplot(df_pie, aes(x="", y=Allocation, fill=Action)) +
  geom_bar(stat="identity", width=1) +
  coord_polar("y", start=0) +
  labs(title="Répartition Optimale du Portefeuille") +
  theme_void() +
  geom_text(aes(label=label), position=position_stack(vjust=0.5), color="white", size=5)

# Sauvegarder l'image du camembert
ggsave("visualisations/répartition_optimale_portefeuille.png", width = 8, height = 5, dpi = 300)
