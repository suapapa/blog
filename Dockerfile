FROM nginx:alpine

# add built html for static access
ADD public/* /usr/share/nginx/html/

EXPOSE 80

