#!/bin/bash

# Chemin du dossier contenant les images initiales
SOURCE_DIR="/initial_images"

# Chemin de destination dans le conteneur, où le volume est monté
DEST_DIR="/gallery/galleries"

# Créer le dossier de destination s'il n'existe pas
mkdir -p $DEST_DIR/initial_images


# Copie des images initiales vers le dossier de destination
echo "Copie des images initiales vers $DEST_DIR/initial_images..."
cp -R $SOURCE_DIR/. $DEST_DIR/initial_images/

# Appliquer des permissions ouvertes sur les images pour garantir l'accès
chmod -R 777 $DEST_DIR/initial_images

echo "Copie terminée."

# Exécuter le CMD original de l'image de base
exec "$@"

