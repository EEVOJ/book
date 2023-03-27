FROM nginx:stable-alpine

COPY ./site /usr/share/nginx/html
