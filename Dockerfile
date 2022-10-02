FROM golang:1.19 AS builder

# RUN go install github.com/gohugoio/hugo@latest
RUN apt update
RUN apt install -y wget
RUN wget -q https://github.com/gohugoio/hugo/releases/download/v0.104.2/hugo_0.104.2_linux-amd64.deb
RUN apt install ./hugo_0.104.2_linux-amd64.deb

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
