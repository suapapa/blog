Live > [here](http://homin.dev/blog) <

# Cheat sheet

```bash
alias hugo="docker run --rm -v $(pwd):/src -p 1313:1313 klakegg/hugo:latest"
```

Upload image to bucket:
```sh
./ru_img.py -u=true -r=800 tv_recording_system.jpeg
```

Create new post:
```sh
hugo new post/new_topic_title.md
```

Test run:
```sh
hugo serve --buildDrafts --watch
```

# Reference

* [HUGO](https://gohugo.io/)
