#!/bin/bash

docker run --rm -v $(pwd):/src -p 1313:1313 klakegg/hugo:latest -- serve --buildDraft --watch
