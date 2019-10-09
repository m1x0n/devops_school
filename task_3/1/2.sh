#!/usr/bin/env bash

# Build dind image with user
docker build -t superdocker .

# Run dind
docker run --privileged \
           --name level0 \
           -d superdocker

# Go inside level0 (dind)
docker exec -it level0 sh

# Run nginx container with shared folder
docker run --name level1 \
           -v /share:/share \
           -d nginx

# Go inside level1 (nginx)
docker exec -it level1
echo "Hello" > /share/hello.txt

