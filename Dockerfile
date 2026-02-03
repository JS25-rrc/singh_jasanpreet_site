FROM node:25-alpine

WORKDIR /singh_jasanpreet_site

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 7775

CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0", "--port", "7775"]