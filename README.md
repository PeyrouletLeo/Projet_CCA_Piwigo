# Projet Piwigo avec Docker

Ce projet vise à déployer [Piwigo](https://piwigo.org/), une application de galerie photo, en utilisant Docker. Il comprend la configuration de deux instances Piwigo pour démontrer la communication inter-conteneurs et le partage de volumes, ainsi qu'une instance MariaDB comme base de données.

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
