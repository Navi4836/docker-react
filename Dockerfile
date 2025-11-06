FROM node:lts-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
ARG APP_BUILD_FOLDER=/app/build
COPY --from=builder ${APP_BUILD_FOLDER} /usr/share/nginx/html
