# Vælg et Node.js base image
FROM node:18

# Opret en mappe til din app
WORKDIR /usr/src/app

# Kopier package.json og package-lock.json (hvis tilgængelig)
COPY package*.json ./

RUN rm -rf node_modules
RUN npm install

# Kopier app kilden
COPY . .

# Byg Strapi app
RUN npm run build

# Exponer den port Strapi kører på
EXPOSE 1337

# Kør Strapi
CMD ["npx", "strapi", "develop"]

