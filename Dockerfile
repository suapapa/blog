FROM hugomods/hugo:0.146.7 AS builder

# RUN git clone https://github.com/gohugoio/hugo.git
# RUN cd hugo && go install --tags extended

WORKDIR /src
ENV HUGO_ENV=production
COPY . .
RUN rm -rf public
# RUN hugo --minify
RUN hugo

# ---

# FROM halverneus/static-file-server:v1.8.10
FROM halverneus/static-file-server:latest
COPY --from=builder /src/public/ /public/

ENV URL_PREFIX=/blog
ENV FOLDER=/public

EXPOSE 8080
