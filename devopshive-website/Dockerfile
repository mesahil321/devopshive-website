FROM node:18-alpine

WORKDIR /app

COPY .next .next
COPY public public
COPY node_modules node_modules
COPY package.json .

EXPOSE 3000

CMD ["npm", "start"]
