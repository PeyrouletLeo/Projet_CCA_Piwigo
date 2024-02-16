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
  ```

2. **Configuration :**

  Avant de lancer les conteneurs, assurez-vous de configurer les volumes et les ports selon vos besoins dans le fichier `docker-compose.yml`.

3. **Lancement :**

  Utilisez Docker Compose pour construire et démarrer les services :
  ```bash
  docker-compose up --build
  ```
## Utilisation

Une fois les conteneurs lancés, vous pouvez accéder aux instances Piwigo via les adresses suivantes dans votre navigateur web :

- **Piwigo 1 :** `http://localhost:81`
- **Piwigo 2 :** `http://localhost:82`

### Configuration Initiale de Piwigo

Lors du premier accès à l'une des instances Piwigo, vous serez guidé à travers un processus d'installation. Voici les étapes à suivre :

1. Sélectionnez la langue par défaut pour votre galerie.
2. Configurez la base de données en entrant les informations suivantes :
   - **Hôte :** `mariadb` (le nom du service MariaDB dans le fichier `docker-compose.yml`)
   - **Utilisateur :** `user` (le nom d'utilisateur de la base de données, par exemple `user`)
   - **Mot de passe :** `password` (le mot de passe de la base de données que vous avez défini)
   - **Nom de la base de données :** `piwigo_db` (ou le nom que vous avez spécifié dans `docker-compose.yml`)
   - **Préfixe des tables :** (par défaut, cela peut être laissé comme `piwigo_`)

3. Créez le compte administrateur en fournissant un nom d'utilisateur, un mot de passe et une adresse e-mail.

### Synchronisation des Images

Après l'installation, les images ajoutées par le script d'entrypoint doivent être synchronisées avec la base de données Piwigo pour qu'elles apparaissent dans votre galerie :

1. Connectez-vous à l'interface d'administration de Piwigo.
2. Allez dans la section `Outils` et choisissez `Synchroniser`.
3. 3. Sélectionnez le dossier `/galleries/` pour synchroniser les images avec la base de données. Vous devrez peut-être également spécifier les options de synchronisation, comme inclure les sous-dossiers et synchroniser les métadonnées des fichiers.

## Personnalisation

- **Images Initiales :** Pour ajouter vos propres images initiales, placez-les dans le dossier `Images` avant de construire les conteneurs.
- **Scripts d'Entrypoint :** Modifiez `entrypoint.sh` pour personnaliser la logique d'initialisation des conteneurs Piwigo.

