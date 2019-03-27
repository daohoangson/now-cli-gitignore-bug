FROM node:10.15.3-alpine

# https://circleci.com/gh/zeit/now-cli/tree/now-dev
RUN wget -O /usr/local/bin/now-alpine 'https://latest-now-cli.now.sh/download/17743/now-alpine' \
  && chmod +x /usr/local/bin/now-alpine
