#!/bin/bash

# docker run --rm -v $(pwd):/src -p 1313:1313 klakegg/hugo:latest serve --buildDrafts --watch
# docker run --rm -v $(pwd):/src -p 1313:1313 hugomods/hugo:go-git-0.146.7 \
hugo \
    serve --buildDrafts --watch
