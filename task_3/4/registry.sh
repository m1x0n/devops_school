#!/usr/bin/env bash

# Start docker registry
docker run -d -p 5000:5000 --name registry registry:2

# Build image
docker build . -t devops_school

# Tag image
docker image tag devops_school localhost:5000/devops_school

# Push image
docker image push localhost:5000/devops_school

# Check image is present in registry
curl -X GET http://localhost:5000/v2/_catalog
# Should be
# {"repositories":["devops_school"]}

# Pull and run container from registry image
docker run --name devops_school_test \
            -p 8888:80 \
            -d localhost:5000/devops_school

# Check container from registry is up and running
curl -X GET http://localhost:8888
# Should be
# Hello Docker Registry!
