#!/bin/sh

set -e

_name=test

docker build . -t $_name

exec docker run --rm -it --name $_name \
  -p 3000:3000 \
  -v "${PWD}:/app" -w /app \
  -v "${PWD}/.data/root/.cache:/root/.cache" \
  -v "${PWD}/.data/root/.npm:/root/.npm" \
  $_name bash
