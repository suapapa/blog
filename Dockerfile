FROM hugomods/hugo:exts AS builder

# RUN git clone https://github.com/gohugoio/hugo.git
# RUN cd hugo && go install --tags extended

WORKDIR /src
ENV HUGO_ENV=production
COPY . .
RUN hugo --minify

# ---

FROM nginx:1.25-alpine

WORKDIR /usr/share/nginx/html
COPY --from=builder /src/public .

EXPOSE 8080/tcp
