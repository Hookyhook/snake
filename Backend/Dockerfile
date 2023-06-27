FROM node:18

WORKDIR /

COPY package-lock*.json ./

RUN npm ci

COPY . .

EXPOSE 2457

CMD [ "npm", "start" ]