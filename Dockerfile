
# Étape 1 : Choisir l'image de base

# On utilise Node.js version 20 sur Alpine Linux (image légère)
FROM node:20-alpine

# Étape 2 : Créer le dossier de travail dans le container
WORKDIR /app

# Étape 3 : Copier les fichiers de dépendances d'abord

# (permet de mettre en cache l'installation des dépendances)
COPY package*.json ./

# Étape 4 : Installer les dépendances de production uniquement
RUN npm ci --only=production

# Étape 5 : Copier le reste du code source
COPY . .

# Étape 6 : Exposer le port sur lequel l'app écoute
EXPOSE 3000

# Étape 7 : Commande pour démarrer l'application
CMD ["node", "server.js"]
