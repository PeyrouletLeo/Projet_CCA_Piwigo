# Utiliser l'image de base Piwigo
FROM lscr.io/linuxserver/piwigo:latest

# Copier le script d'entrypoint personnalisé dans le conteneur
COPY entrypoint.sh /entrypoint.sh

# Rendre le script exécutable
RUN chmod +x /entrypoint.sh

# Définir le script comme entrypoint du conteneur
ENTRYPOINT ["/entrypoint.sh"]

# Utiliser le CMD de l'image de base
CMD ["/init"]
