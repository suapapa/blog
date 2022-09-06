FROM klakegg/hugo as builder

COPY . /build
WORKDIR /build
RUN hugo

FROM nginx:alpine
# copy built html for static access
COPY --from=builder /build/public/ /usr/share/nginx/html/

EXPOSE 80

