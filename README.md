Live > [here](http://homin.dev/blog) <

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
hugo serve --buildDrafts --watch
```

# Reference

* [HUGO](https://gohugo.io/)
