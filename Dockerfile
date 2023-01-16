#stage-1 build react app first
FROM node:lts-alpine as build

WORKDIR /app
COPY ./package.json /app
COPY ./yarn.lock /app

RUN yarn
COPY . /app
RUN yarn build


#stage-2 build the image and copy the react build files
FROM nginx:latest
COPY ./nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]