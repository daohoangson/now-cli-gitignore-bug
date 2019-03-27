FROM node:8.15.1-stretch-slim

# https://circleci.com/gh/zeit/now-cli/tree/now-dev
RUN wget -O /usr/local/bin/now-linux 'https://latest-now-cli.now.sh/download/17743/now-linux' \
  && chmod +x /usr/local/bin/now-linux
