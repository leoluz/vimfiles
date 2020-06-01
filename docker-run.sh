#!/bin/sh
docker build -t devbox:local .
docker run --rm -it devbox:local
