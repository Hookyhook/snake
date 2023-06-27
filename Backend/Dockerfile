FROM node:18

WORKDIR /

COPY package*.json ./

RUN npm i

COPY . .

EXPOSE 2457

CMD [ "npm", "start" ]