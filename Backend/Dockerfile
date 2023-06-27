FROM node:18

WORKDIR /app

COPY package*.json ./

RUN npm i

COPY . .

EXPOSE 2457

CMD [ "npm", "start" ]