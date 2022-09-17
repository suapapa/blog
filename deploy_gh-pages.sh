#!/bin/bash
rm -rf gh-pages
mkdir gh-pages
cp index.tmpl gh-pages/index.html
cd gh-pages
git init . && git add . && git commit -m "update at `date`"
git push -f \
	git@github.com:suapapa/blog.git \
	main:gh-pages
