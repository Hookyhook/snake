FROM node:18

WORKDIR /app

COPY package*.json ./

RUN npm ci --omit=dev

COPY . .

EXPOSE 2457

CMD [ "npm", "start" ]