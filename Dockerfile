FROM klakegg/hugo as builder

COPY . /src
RUN hugo build

FROM nginx:alpine
COPY --from=builder /src/public/ /usr/share/nginx/html/

EXPOSE 80
