FROM scardon/ruby-node-alpine:2.4.4

LABEL authors="Franz See <franz@see.net.ph>"

RUN apk add --no-cache bash git openssh alpine-sdk python

COPY . /www

WORKDIR /www

RUN npm install
RUN npm run generate:exchangeSummary -- --fgrep '[binance]'
RUN npm run generate:exchangeSummary -- --fgrep '[coinbasepro]'
RUN npm run generate:exchangeSummary -- --fgrep '[btcturk]'

RUN npm pack
