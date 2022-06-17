FROM alpine:3.16
LABEL maintainer "Dan Gibbs <dev@dangibbs.co.uk>"

SHELL ["/bin/sh", "-o", "pipefail", "-c"]

RUN apk add --update-cache \
        bash \
        chromium \
        chromium-chromedriver \
        chromium-swiftshader \
        font-liberation \
        ttf-droid \
        font-opensans \
        font-ipa \
        npm \
        nodejs \
        wget; \
    addgroup -S webdriver; \
    mkdir -p /home/webdriver; \
    adduser -h /home/webdriver -S webdriver -G webdriver; \
    chown -R webdriver:webdriver /home/webdriver; \
    rm -rf /var/cache/apk/*

WORKDIR /home/webdriver
