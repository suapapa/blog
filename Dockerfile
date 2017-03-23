FROM nginx:alpine

# copy built html for static access
COPY ./public/ /usr/share/nginx/html/

EXPOSE 80

