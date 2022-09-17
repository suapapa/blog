#!/bin/bash
#hugo
rm -rf public
cp index.html public/
cd public
git init . && git add . && git commit -m "update at `date`"
git push -f \
	git@github.com:suapapa/blog.git \
	main:gh-pages
