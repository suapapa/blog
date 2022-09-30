FROM golang:latest as builder

RUN go install github.com/gohugoio/hugo@latest

ENV HUGO_ENV=production

WORKDIR /src
COPY . .
RUN hugo --minify

# ---

FROM halverneus/static-file-server:latest
COPY --from=builder /src/public/ /public/

ENV URL_PREFIX=/blog
ENV FOLDER=/public

EXPOSE 8080
