Live at [here](http://suapapa.github.io/blog/)

# Cheat sheet

Create new post:

    $ hugo new post/new_topic_title.md

Test run:

    $ hugo serve \
        --buildDrafts \
        --watch

Deploy to gh-pages:

    $ hugo
    $ cd public
    $ git init . && git add . && git commit -m "update at 20161122"
    $ git push -f https://github.com/suapapa/blog master:gh-pages

# Reference

* [HUGO](https://gohugo.io/)
