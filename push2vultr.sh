#!/bin/bash
set -e
CR=icn.vultrcr.com/homincr1
IMAGE_TAG=$CR/blog:latest 
docker buildx build --platform linux/amd64 -t $IMAGE_TAG .
docker push $IMAGE_TAG

kubectl rollout restart deployment blog