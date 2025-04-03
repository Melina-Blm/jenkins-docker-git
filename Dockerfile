DUtilise l'image officielle Nginx comme base
FROM nginx:alpine

Copie les fichiers de ton projet dans le répertoire de Nginx
COPY . /usr/share/nginx/html

Expose le port 80 pour que le serveur web soit accessible
EXPOSE 80

Commande par défaut pour démarrer Nginx
CMD ["nginx", "-g", "daemon off;"]
