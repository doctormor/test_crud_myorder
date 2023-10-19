FROM node:17

WORKDIR /backend-nest
COPY package.json package-lock.json ./
RUN npm install
COPY . .
EXPOSE 3001
CMD [ "npm", "run", "start:dev" ]