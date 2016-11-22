Live at [here](http://suapapa.github.io/blog/)

# Cheat sheet

Create new post:

    $ hugo new post/new_topic_title.md

Test run:

    $ hugo serve \
        --baseURL http://127.0.0.1:1313 \
        --buildDrafts \
        --watch

# Using docker

## jojomi/hugo

Build Hugo site:

    $ docker run --name "my-hugo" \
        -P \
        -v $(pwd):/src \
        jojomi/hugo

Run Hugo server:

    $ docker run --name "my-hugo" \
        -p 1313:1313 \
        -v $(pwd):/src \
        -e HUGO_WATCH=1 \
        jojomi/hugo

## ngnix

Run static site:

    $ hugo -b http://127.0.0.1
    $ docker run --name suapapablog \
        -p 80:80 \
        -v $PWD/public:/usr/share/nginx/html:ro \
        -d \
        nginx:alpine


# Reference

* [HUGO](https://gohugo.io/)
