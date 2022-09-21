FROM klakegg/hugo:ext as builder

ENV HUGO_ENV=production

COPY . /src
RUN hugo build

FROM halverneus/static-file-server:latest
COPY --from=builder /src/public/ /public/

ENV URL_PREFIX=/blog
ENV FOLDER=/public

EXPOSE 8080
