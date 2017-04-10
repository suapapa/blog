Live at [here](http://suapapa.github.io/blog/)

# Cheat sheet

Create new post:

    $ hugo new post/new_topic_title.md

Test run:

    $ hugo serve \
        --baseURL http://127.0.0.1:1313 \
        --buildDrafts \
        --watch

Deploy to gh-pages:

    $ hugo
    $ cd public
    $ git init . && git add . && git commit -m "update at 20161122"
    $ git push -f https://github.com/suapapa/blog master:gh-pages

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

Generate static htmls with Hugo.

    $ hugo -b http://127.0.0.1

Run static site:

    $ docker rmi suapapa/blog
    $ docker build -t suapapa/blog .
    $ docker run -it --rm -p 80:80 suapapa/blog

Tag and push:

    $ docker tag suapapa/blog suapapa/blog:20170323
    $ docker login
    ...
    $ docker push suapapa/blog

## deploy in GKE

Build image and push it to dockerhub

    $ docker build -t suapapa/blog:20170406v2 .
    $ docker push suapapa/blog:20170406v2

Login into gcloud:

    $ gcloud auth application-default login

Creage new deployment:

    $ kubectl run blog --image=suapapa/blog:20170406v2 --port=80

Allow external traffic

    $ kubectl expose deployment blog --type=LoadBalancer

Upgrade image on deployment:

    $ kubectl set image deployment/blog \
          blog=suapapa/blog:20170406v2

# Reference

* [HUGO](https://gohugo.io/)
