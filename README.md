Live > [here](http://suapapa.github.io/blog/) <

# Cheat sheet

```bash
alias hugo="docker run --rm -v $(pwd):/src -p 1313:1313 klakegg/hugo:latest"
```

Create new post:

```bash
hugo new post/new_topic_title.md
```

Test run:

```bash
hugo serve \
    --buildDrafts \
    --watch
```

Deploy to gh-pages:

```
./deploy_gh-pages.sh
```

# Reference

* [HUGO](https://gohugo.io/)
