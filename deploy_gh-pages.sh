#!/bin/bash
hugo
cd public
git init . && git add . && git commit -m "update at `date`"
git push -f https://github.com/suapapa/blog master:gh-pages
