FROM node:12.7-alpine AS build

COPY package.json ./
RUN npm install
COPY . .
RUN npm run build


FROM nginx:1.13.3-alpine
COPY /nginx/default.conf /etc/nginx/conf.d/
RUN rm -rf /usr/share/nginx/html/*
COPY dist/shop /usr/share/nginx/html
