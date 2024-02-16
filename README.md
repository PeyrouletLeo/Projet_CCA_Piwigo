# Projet Piwigo avec Docker

Ce projet vise à déployer [Piwigo](https://piwigo.org/), une application de galerie photo, en utilisant Docker. La configuration déployée comprend deux instances de Piwigo qui démontrent non seulement la communication inter-conteneurs via un réseau Docker personnalisé, mais également le partage d'un volume commun pour la persistance des galeries photos. Un script d'entrypoint personnalisé est utilisé pour initialiser les instances Piwigo avec un ensemble d'images par défaut, pouvant pré-remplir les galeries avec des images au démarrage du conteneur. De plus, une instance MariaDB est intégrée en tant que base de données, partageant le même réseau Docker, ce qui simplifie la configuration de la connexion et renforce l'intégrité de l'écosystème des conteneurs.

## Architecture

Le projet utilise `docker-compose` pour orchestrer trois services principaux :

- `piwigo1` et `piwigo2` : Deux instances de Piwigo partageant un volume pour les images de la galerie.
- `mariadb` : Une base de données MariaDB utilisée par les instances Piwigo.

Les conteneurs sont configurés pour communiquer sur un réseau Docker personnalisé, permettant à Piwigo d'accéder à la base de données MariaDB.

## Prérequis

- Docker
- Docker Compose

## Mise en Place

1. **Cloner le Répertoire :**

  Clonez ce dépôt sur votre machine locale :
  ```bash
  git clone https://github.com/PeyrouletLeo/Projet_CCA_Piwigo
  cd Projet_CCA_Piwigo

2. **Configuration :**

  Avant de lancer les conteneurs, assurez-vous de configurer les volumes et les ports selon vos besoins dans le fichier `docker-compose.yml`.

3. **Lancement :**

  Utilisez Docker Compose pour construire et démarrer les services :
  ```bash
  docker-compose up --build
