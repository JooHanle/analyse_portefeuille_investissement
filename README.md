# analyse_portefeuille_investissement
Analyse d'un portefeuille d’investissement avec R


# Analyse du Portefeuille d'Investissement avec R

## Introduction
Dans ce projet, nous analysons la performance d’un **portefeuille d’investissement** contenant les actions de **Apple (AAPL), Microsoft (MSFT) et Tesla (TSLA)**.  
L'objectif est d’identifier la **meilleure répartition du capital** en fonction du **Ratio de Sharpe** et des rendements ajustés au risque.

---

## 🛠️ Outils utilisés
Ce projet a été réalisé avec les outils et logiciels suivants :

🔹 **Langage de programmation** :  
- 📌 R (pour l’analyse et la visualisation des données)  

🔹 **Environnements de développement** :  
- 🖥️ **RStudio** (édition et exécution des scripts RMarkdown `.Rmd`)  

🔹 **Bibliothèques R utilisées** :  
- 📦 `tidyverse` (manipulation et nettoyage des données)  
- 📦 `ggplot2` (visualisation des graphiques)  
- 📦 `dplyr` (transformation des données)  
- 📦 `kableExtra` (amélioration de l'affichage des tableaux)  
- 📦 `rmarkdown` (génération de rapports `.html`, `.pdf`, `.docx`)  

🔹 **Outils de visualisation et présentation** :  
- 📊 **ggplot2** (pour les graphiques interactifs)  
- 📊 **PowerPoint** (présentation des résultats)  

🔹 **Stockage et partage du projet** :  
- 📂 **GitHub** (hébergement du projet et collaboration)  

---

## 📂 Organisation du projet

📁 **data/** → Contient le fichier `bourse.csv` avec les données des prix des actions.  
📁 **notebooks/** → Contient le fichier RMarkdown `.Rmd` utilisé pour générer le rapport.  
📁 **docs/** → Contient le **rapport HTML** généré.  
📁 **scripts/** → Contient le script R `portfolio_analysis.R` pour l'analyse.  
📁 **presentation/** → Contient la présentation PowerPoint et PDF des résultats. 

---

## 📊 Analyse réalisée
### 🔹 1. Chargement et nettoyage des données
- Importation des prix historiques des actions.
- Vérification et traitement des **valeurs manquantes**.
- Calcul des **rendements quotidiens** des actions.

### 🔹 2. Visualisation des prix et rendements
- 📈 **Évolution des prix des actions** (Graphique `ggplot2`).
- 📉 **Analyse de la volatilité des rendements**.

### 🔹 3. Calcul du Ratio de Sharpe & Allocation optimale
- 📊 **Ratio de Sharpe calculé pour chaque action**.
- 🏆 **Répartition optimale du portefeuille** :
  - **Apple (AAPL) : 50.6%**
  - **Microsoft (MSFT) : 33.7%**
  - **Tesla (TSLA) : 15.6%**
  
---

## 📈 Résultats et recommandations
📌 **Apple (AAPL)** est **l’action la plus stable et rentable**, donc elle doit représenter **la majorité du portefeuille**.  
📌 **Microsoft (MSFT)** est une **bonne alternative**, mais légèrement plus volatile.  
📌 **Tesla (TSLA)** a le **plus grand risque**, donc il est recommandé **de limiter son poids dans le portefeuille**.  

---

## 📁 Fichiers importants
- 🔹 [`analyse_portefeuille_investissement.Rmd`](notebooks/analyse_portefeuille_investissement.Rmd) → Notebook avec le code RMarkdown  
- 🔹 [`analyse_portefeuille_investissement.html`](docs/analyse_portefeuille_investissement.html) → Rapport final généré  

---

## 📊 Présentation du projet
Une présentation détaillée du projet est disponible :

📂 **[Version PowerPoint (.pptx)](presentation/analyse_portefeuille_investissement.pptx)**  
📂 **[Version PDF (.pdf)](presentation/analyse_portefeuille_investissement.pdf)**  

Cette présentation résume l'analyse, les résultats et les recommandations pour optimiser l'investissement du portefeuille.

---
