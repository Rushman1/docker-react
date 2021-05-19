FROM node:alpine3.13 as build
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=build /app/build /usr/share/nginx/html