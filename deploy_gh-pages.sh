#!/bin/bash
#hugo
rm -rf public
docker run --rm -v `pwd`:/src  klakegg/hugo:latest build
cd public
git init . && git add . && git commit -m "update at `date`"
git push -f \
	git@github.com:suapapa/blog.git \
	main:gh-pages
