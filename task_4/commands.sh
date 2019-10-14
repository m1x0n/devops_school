#!/usr/bin/env bash

docker run --name test_resizer \
            -p 8080:80 \
            -v /path/to/images:/images:ro \
            -v /path/to/cache/:/resized_images \
            -d m1x0n/nginx-image-resizer
