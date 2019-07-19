FROM openjdk:8-jre-alpine

ARG SBT_VERSION=1.2.8

# Install sbt
RUN \
    apk update && \
    apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing sbt && \
    sbt sbtVersion

# Install docker
RUN apk add --no-cache docker

# Install awscli
RUN apk add --no-cache curl jq python py-pip && \
    pip install awscli