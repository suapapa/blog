FROM razonyang/hugo:latest AS builder

# RUN git clone https://github.com/gohugoio/hugo.git
# RUN cd hugo && go install --tags extended

WORKDIR /src
ENV HUGO_ENV=production
COPY . .
RUN hugo --minify

# ---

FROM halverneus/static-file-server:v1.8.10
COPY --from=builder /src/public/ /public/

ENV URL_PREFIX=/blog
ENV FOLDER=/public

EXPOSE 8080
