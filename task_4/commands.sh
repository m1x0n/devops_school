#!/usr/bin/env bash

docker build . -t resizer

docker run --name test_resizer \
            -p 8080:80 \
            -v /home/m1x0n/Pictures:/images:ro \
            -d resizer
